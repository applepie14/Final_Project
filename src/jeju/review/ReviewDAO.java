package jeju.review;

import java.sql.*;
import java.util.*;

import controller.DBConnectionMgr;

public class ReviewDAO {

	// 멤버변수에 연결할 클래스의 객체를 선언
	private DBConnectionMgr pool = null; // getConnection, freeConnection();

	// 공통으로 접속할 경우 필요로하는 변수선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null; // select
	private String sql = ""; // 실행시킬 SQL 구문 저장

	// 생성자를 통해 객체를 얻어오는 구문
	public ReviewDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("DB접속 오류 => " + e);
		}
	}

	// 페이징 처리를 위한 전체 레코드 수
	// select count(*) from Review;
	public int getReviewCount() {
		int x = 0; // 총 레코드 개수 저장
		try {
			con = pool.getConnection();
			System.out.println("con=> " + con);
			sql = "select count(*) from Review";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) { // 보여주는 결과가 있다면
				x = rs.getInt(1);
				// 변수명 = rs.get자료형(필드명 또는 인덱스번호)
			}
		} catch (Exception e) {
			System.out.println("getReviewCount() 에러 => " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}
	
	// 검색어 관련 메소드. 게시판의 검색어에 따른 레코드 수를 구하는 메서드작성(검색분야, 검색어)
		public int getReviewSearchCount(String search, String searchtext) { 
			
			int x = 0; // 총 레코드 갯수를 저장

			try {
				con = pool.getConnection();
				System.out.println("con => " + con);
				//--------------------------------
				if (search == null || search == "") { // 검색분야 선택X (검색어를 입력하지 않은경우)
					sql = "select count(*) from Review, user "
							+ "where user.user_email=Review.user_email "; 
					// select count(*) from member;
				} else { // 검색분야 (제목, 작성자, 제목+본문)
					if (search.contentEquals("place")) { // 제목+본문
						sql = "select count(*) from Review, user "
								+ "where user.user_email=Review.user_email "
								+ "and (Review_Place like '%" + searchtext + "%') ";
					} else { // 제목, 작성자 -> 매개변수를 이용해서 하나의 SQL통합
						sql = "select count(*) from Review, user "
								+ "where user.user_email=Review.user_email "
								+ "and " + search + " like '%" + searchtext + "%' ";
					}
				}
				System.out.println("getReviewSearchCount 검색sql => "+sql);
				//-------------------------------
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) { // 보여주는 결과가 있다면
					x = rs.getInt(1);
					// 변수명 = rs.get자료형(필드명 또는 인덱스번호) -> 필드명을 사용할수 없는 경우
				}
			} catch (Exception e) {
				System.out.println("getReviewSearchCount() 에러 => " + e);
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return x;
		}

	// 글 목록보기에 대한 메서드 구현
	public List getReviewList(int start, int end) {

		String nickname = "";
		List reviewList = null;
		ReviewDTO review = null;
		try {
			con = pool.getConnection();
			sql = "SELECT *, User_Nickname " + "FROM Review, user " + "WHERE user.User_Email=Review.User_Email "
					+ "ORDER BY Review_Date desc " + "LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				reviewList = new ArrayList(end);
				do {
					review = makeReviewFromResult();
					reviewList.add(review);
				} while (rs.next());
			}

		} catch (Exception e) {
			System.out.println("getReviewList() 에러=> " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return reviewList;
	}
	
	// 검색어 관련 메소드2 검색어에 따른 레코드의 범위지정에 대한 메소드
		public List getReviewArticles(int start, int end, String search, String searchtext) { 
		
			List reviewList = null ; // ArrayList articleList=null;
			ReviewDTO review = null ;

			try {
				con = pool.getConnection();
				//----------------------------------
				if(search==null || search=="") {
					sql = "select * "
							+ "from Review, user "
							+ "where user.user_email=Review.user_email "
							+ "group by Review_No "
							+ "order by Review_Date desc "
							+ "limit ?,?";
				} else {
					if (search.contentEquals("place")) { // 장소
						sql = "select * "
								+ "from Review, user "
								+ "where user.user_email=Review.user_email "
								+ "and (Review_Place like '%" + searchtext + "%') "
								+ "group by Review_No "
								+ "order by Review_Date desc "
								+ "limit ?,?";
					} else { // 제목, 작성자 -> 매개변수를 이용해서 하나의 SQL통합
						sql = "select * "
								+ "from Review, user "
								+ "where user.user_email=Review.user_email "
								+ "and " + search + " like '%" + searchtext + "%' "
								+ "group by Review_No "
								+ "order by Review_Date desc "
								+ "limit ?,?";
					}
				}
				System.out.println("getReviewArticles()의 sql => "+sql);
				//----------------------------------
				// 1, 10 --> 1번째 레코드 번호부터 10개씩 끊어서 보여달라는 구문
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start-1); // mysql은 레코드 순번이 내부적으로 0부터 시작
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();
				// 글 목록보기
				if (rs.next()) { // 레코드가 최소 만족 1개이상 존재한다면
					reviewList = new ArrayList(end); // 자식형
					// 10 => end갯수만큼 데이터를 담을 공간을 생성
					do {
						review = makeReviewFromResult();		
						reviewList.add(review);
					}while(rs.next());
				}
			} catch (Exception e) {
				System.out.println("getReviewArticles() 에러 => " + e);
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return reviewList;
		}
	

	// 페이징 처리 해주는 메서드
	public Hashtable pageList(String pageNum, int count) {

		// 1) 페이징 처리결과를 저장할 hashtable객체를 선언
		Hashtable<String, Integer> pgList = new Hashtable<String, Integer>();

		int pageSize = 12; // numPerPage -> 페이지당 보여주는 게시물 수(=레코드 수)
		int blockSize = 10; // pagePerBlock -> 블럭당 보여주는 페이지수 10

		// 게시판을 맨 처음 실행시키면 무조건 1페이지부터 출력
		if (pageNum == null) {
			pageNum = "1"; // default
			// 1. 무조건 1페이지는 선택하지 않아도 보여줘야 함
			// 2. 가장 최근의 글을 출력하는 목적을 가짐
		}

		int currentPage = Integer.parseInt(pageNum); // "1" -> 1 현재페이지(=nowPage)
		// 메서드 호출 -> 시작 레코드 번호
		// currentPage=1 -> 1 - 1 * 10 + 1 = 1
		// 2페이지일 경우 (2-1)*10+1=11, 3페이지일 경우(3-1)*10+1=21
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = (currentPage * pageSize);
		// 1*10=10, 2*10=20, 3*10=30 -> 마지막 레코드 번호
		int number = 0;
		// beginPerPage -> 페이지별로 시작하는 맨 처음에 나오는 게시물번호
		System.out.println("현재 레코드 수 (count) =>" + count);
		number = count - (currentPage - 1) * pageSize;
		System.out.println("페이지별 number => " + number);

		// 2. JspBoard(모델1)의 list.jsp 소스코드를 BoardDAO로 이동
		// 총페이지수, 시작, 종료페이지 계산
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		// 블럭당 페이지수 계산 -> 10(10배수), 3(3배수)
		int startPage = 0; // 1,2,3,,,10 [다음블럭 10] -> 11,12,13,,,20
		if (currentPage % blockSize != 0) { // 10의 배수가 아닐 경우
			startPage = currentPage / blockSize * blockSize + 1;
		} else { // 10%10과 같은 경우 (10, 20, 30,,,)
					// (( 10 / 10 )-1)* 10 +1 = 1
			startPage = ((currentPage / blockSize) - 1) * blockSize + 1;
		}

		int endPage = startPage + blockSize - 1; // 1 + 10 - 1 = 10
		System.out.println("startPage => " + startPage + " , endPage => " + endPage);

		if (endPage > pageCount)
			endPage = pageCount; // 마지막페이지 = 총페이지수

		// 페이징처리에 대한 결과 -> Hashtable, HashMap -> ListAction.java에 전달
		// -> 메모리에 저장 -> list.jsp
		pgList.put("pageSize", pageSize); // <-> pgList.get(키명(="pageSize"))
		pgList.put("blockSize", blockSize);
		pgList.put("currentPage", currentPage);
		pgList.put("startRow", startRow);
		pgList.put("endRow", endRow);
		pgList.put("count", count);
		pgList.put("number", number);
		pgList.put("startPage", startPage);
		pgList.put("endPage", endPage);
		pgList.put("pageCount", pageCount);

		return pgList;
	}

	private ReviewDTO makeReviewFromResult() throws Exception {

		ReviewDTO review = new ReviewDTO();
		review.setReview_no(rs.getInt("review_no"));
		review.setUser_email(rs.getString("user_email"));
		review.setReview_title(rs.getString("review_title"));
		review.setReview_content(rs.getString("review_content"));
		review.setReview_date(rs.getTimestamp("review_date"));
		review.setReview_place(rs.getString("review_place"));
		review.setReview_like_count(rs.getInt("review_like_count"));
		review.setReview_img(rs.getString("review_img"));
		review.setUser_nickname(rs.getString("user_nickname"));

		return review;
	}

	// 글쓰기
	public void insertReview(ReviewDTO review, String email) {

		int number = 0;
		try {
			con = pool.getConnection();
			sql = "select max(Review_No) from Review";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				number = rs.getInt(1) + 1;
			} else { // 맨 처음에 레코드가 한개라도 없다면 무조건 number = 1
				number = 1;
			}

			sql = "insert into Review(Review_Title, User_Email, Review_Content, Review_Date, Review_Place, Review_Like_Count, Review_Img ) "
					+ "values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, review.getReview_title());
			pstmt.setString(2, email);
			pstmt.setString(3, review.getReview_content());
			pstmt.setTimestamp(4, review.getReview_date());
			pstmt.setString(5, review.getReview_place());
			pstmt.setInt(6, review.getReview_like_count());
			pstmt.setString(7, review.getReview_img());

			int insert = pstmt.executeUpdate();
			System.out.println("리뷰게시판 글쓰기 성공유무(insertReview) => " + insert);

		} catch (Exception e) {
			System.out.println("insertReview() 에러 => " + e);
		}
	}

	// 글 수정
	// 1) 수정할 데이터를 찾을 메서드 필요 => select * from board
	public ReviewDTO updateGetReview(int num) {

		ReviewDTO review = null;
		try {
			con = pool.getConnection();
			sql = "select *, user_nickname " + "from Review, user " + "where Review.user_email = user.user_email "
					+ "and Review_No=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			System.out.println("user_nickname");
			if (rs.next()) {
				review = makeReviewFromResult();
				review.setUser_nickname(rs.getString("user_nickname"));
			}
		} catch (Exception e) {
			System.out.println("updateGetReview() 에러 => " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return review;
	}

	// 2) 수정시키는 메서드 작성
	public int updateReview(ReviewDTO review) {
		int update = 0; // 게시물의 수정 성공 유무
		try {
			con = pool.getConnection();
			sql = "update Review set Review_Title=?, Review_Place=?, Review_Content=?, Review_Img=? " + "where Review_No=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, review.getReview_title());
			pstmt.setString(2, review.getReview_place());
			pstmt.setString(3, review.getReview_content());
			pstmt.setString(4, review.getReview_img());
			pstmt.setInt(5, review.getReview_no());

			update = pstmt.executeUpdate();
			System.out.println("리뷰게시판 글수정 성공 유무(updateReview) => " + update);
		} catch (Exception e) {
			System.out.println("updateReview() 에러 => " + e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return update;
	}

	// 글 삭제
	public int deleteReview(int review_no) {

		int delete = 0;
		try {
			con = pool.getConnection();
			sql = "delete from Review where Review_No=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review_no);

			delete = pstmt.executeUpdate();
			System.out.println("리뷰게시판 글삭제 성공 유무(deleteReview) => " + delete);
		} catch (Exception e) {
			System.out.println("deleteReview() 에러 => " + e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return delete;
	}
}
