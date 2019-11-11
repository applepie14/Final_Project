package jeju.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;

import controller.DBConnectionMgr;
import jeju.review.ReviewDTO;

public class MyPageDAO {

	// 1. 멤버변수에 연결할 클래스의 객체를 선언
	private DBConnectionMgr pool = null; // getConnection, freeConnection();

	// 2. 공통으로 접속할 경우 필요로 하는 멤버변수
	private Connection con = null;
	private PreparedStatement pstmt = null; // sql 실행
	private ResultSet rs = null; // select
	private String sql = ""; // 실행시킬 sql구문 저장

	SimpleDateFormat sdf = new SimpleDateFormat("MM/dd hh:mm:ss");
	Date dd = new Date();

	// 2. 생성자를 통해서 객체를 얻어오는 구문 작성
	public MyPageDAO() {
		try {
			pool = DBConnectionMgr.getInstance(); // 기본 정적 메소드 제공
			// System.out.println("pool : " + pool);
		} catch (Exception e) {
			// System.out.println("DB연결실패 : " + e); // e.toString()
		}
	} // 생성자

	// 페이징 처리를 위한 전체 레코드 수
	// select count(*) from Review;
	public int getReviewCount(String email) {
		int x = 0; // 총 레코드 개수 저장
		try {
			con = pool.getConnection();
			System.out.println("con=> " + con);
			sql = "select count(*) from Review " + "where User_Email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) { // 보여주는 결과가 있다면
				x = rs.getInt(1);
				// 변수명 = rs.get자료형(필드명 또는 인덱스번호)
			}
		} catch (Exception e) {
			System.out.println("마이페이지 getReviewCount() 에러 => " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}

	// 검색어 관련 메소드. 게시판의 검색어에 따른 레코드 수를 구하는 메서드작성(검색분야, 검색어)
	public int getReviewSearchCount(String search, String searchtext, String email) {

		int x = 0; // 총 레코드 갯수를 저장

		try {
			con = pool.getConnection();
			System.out.println("con => " + con);
			// --------------------------------
			if (search == null || search == "") { // 검색분야 선택X (검색어를 입력하지 않은경우)
				sql = "select count(*) from Review, user " + "where user.user_email=Review.user_email "
						+ "And user.user_email=?";
				// select count(*) from member;
			} else { // 검색분야 (제목, 작성자, 제목+본문)
				if (search.contentEquals("place")) { // 제목+본문
					sql = "select count(*) from Review, user " + "where user.user_email=Review.user_email "
							+ "And user.user_email=? " + "and (Review_Place like '%" + searchtext + "%') ";
				} else { // 제목, 작성자 -> 매개변수를 이용해서 하나의 SQL통합
					sql = "select count(*) from Review, user " + "where user.user_email=Review.user_email "
							+ "And user.user_email=? " + "and " + search + " like '%" + searchtext + "%' ";
				}
			}
			// System.out.println("마이페이지 getCompanySearchCount 검색sql => "+sql);
			// -------------------------------
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) { // 보여주는 결과가 있다면
				x = rs.getInt(1);
				// 변수명 = rs.get자료형(필드명 또는 인덱스번호) -> 필드명을 사용할수 없는 경우
			}
		} catch (Exception e) {
			System.out.println("마이페이지 getReviewSearchCount() 에러 => " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}

	// 글 목록보기에 대한 메서드 구현
	public List getReviewList(int start, int end, String email) {

		String nickname = "";
		List reviewList = null;
		ReviewDTO review = null;
		try {
			con = pool.getConnection();
			sql = "SELECT *, User_Nickname " + "FROM Review, user " + "WHERE user.User_Email=Review.User_Email "
					+ "AND user.user_email= ? " + "ORDER BY Review_Date desc " + "LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, start - 1);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				reviewList = new ArrayList(end);
				do {
					review = makeReviewFromResult();
					reviewList.add(review);
				} while (rs.next());
			}

		} catch (Exception e) {
			System.out.println("마이페이지 getReviewList() 에러=> " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return reviewList;
	}

	// 검색어 관련 메소드2 검색어에 따른 레코드의 범위지정에 대한 메소드
	public List getReviewArticles(int start, int end, String search, String searchtext, String email) {

		List reviewList = null; // ArrayList articleList=null;
		ReviewDTO review = null;

		try {
			con = pool.getConnection();
			// ----------------------------------
			if (search == null || search == "") {
				sql = "select * " + "from Review, user " + "where user.user_email=Review.user_email "
						+ "AND user.user_email= ? " + "group by Review_No " + "order by Review_Date desc "
						+ "limit ?,?";
			} else {
				if (search.contentEquals("place")) { // 장소
					sql = "select * " + "from Review, user " + "where user.user_email=Review.user_email "
							+ "AND user.user_email= ? " + "and (Review_Place like '%" + searchtext + "%') "
							+ "group by Review_No " + "order by Review_Date desc " + "limit ?,?";
				} else { // 제목, 작성자 -> 매개변수를 이용해서 하나의 SQL통합
					sql = "select * " + "from Review, user " + "where user.user_email=Review.user_email "
							+ "AND user.user_email= ? " + "and " + search + " like '%" + searchtext + "%' "
							+ "group by Review_No " + "order by Review_Date desc " + "limit ?,?";
				}
			}
			// System.out.println("getCompanyArticles()의 sql => "+sql);
			// ----------------------------------
			// 1, 10 --> 1번째 레코드 번호부터 10개씩 끊어서 보여달라는 구문
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, start - 1);// mysql은 레코드 순번이 내부적으로 0부터 시작
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			// 글 목록보기
			if (rs.next()) { // 레코드가 최소 만족 1개이상 존재한다면
				reviewList = new ArrayList(end); // 자식형
				// 10 => end갯수만큼 데이터를 담을 공간을 생성
				do {
					review = makeReviewFromResult();
					reviewList.add(review);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.println("마이페이지 getReviewArticles() 에러 => " + e);
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
	
	
	
	// 좋아요 필드 추가(메소드 오버로딩해서 사용할 거임)
	public int reviewLike(String review_no, String email) {

		int x = 0; // 좋아요

		try {
			con = pool.getConnection();
			sql =	"INSERT INTO Review_Like(Review_No, User_Email) " + 
					"VALUES (?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, review_no);
			pstmt.setString(2, email);
			x = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("▶ 좋아요 누른 이력이 없을 때 필드를 추가하는 메소드");
			System.out.println("▶ 마이페이지 reviewLike() 에러 => " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}
	// 좋아요 필드 추가(메소드 오버로딩해서 사용할 거임)
	public int reviewLike(String review_no, String email, String state) {

		int x = 0; // 좋아요

		try {
			con = pool.getConnection();
			sql =	"업데이트";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, review_no);
			pstmt.setString(2, email);
			x = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("▶ 좋아요 누른 이력이 없을 때 필드를 추가하는 메소드");
			System.out.println("▶ 마이페이지 reviewLike() 에러 => " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}
	
	
	// ==========================================================================================
	// 페이징 처리를 위한 전체 레코드 수를 구해와야함
	// select count(*) from company; -> 반환값 O, 매개변수 X(where 조건식X)
	public int getCompanyCount(String email) {
		int x = 0; // 총 레코드 개수 저장
		try {
			con = pool.getConnection();
			System.out.println("con=> "+con);
			sql="select count(*) from Company" + " where User_Email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) { // 보여주는 결과가 있다면
				x = rs.getInt(1);
				// 변수명 = rs.get자료형(필드명 또는 인덱스번호)
			}
		} catch(Exception e) {
			System.out.println("getCompanyCount() 에러 => "+e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}
	
	// 검색어 관련 메소드. 게시판의 검색어에 따른 레코드 수를 구하는 메서드작성(검색분야, 검색어)
	public int getCompanySearchCount(String search, String searchtext, String email) { // getMemberCount()
		
		int x = 0; // 총 레코드 갯수를 저장

		try {
			con = pool.getConnection();
			System.out.println("con => " + con);
			//--------------------------------
			if (search == null || search == "") { // 검색분야 선택X (검색어를 입력하지 않은경우)
				sql = "select count(*) from Company, user "
						+ "where user.user_email=Company.user_email "
						+ "And user.user_email=?"; 
				// select count(*) from member;
			} else { // 검색분야 (제목, 작성자, 제목+본문)
				if (search.contentEquals("title_content")) { // 제목+본문
					sql = "select count(*) from Company, user "
							+ "where user.user_email=Company.user_email "
							+ "and (Company_Title like '%" + searchtext + "%' "
							+ "or Company_Content like '%"+ searchtext + "%') "
							+ "And user.user_email=?"; 
				} else if(search.contentEquals("all")) {
					sql = "select count(*) from Company, user "
							+ "where user.user_email=Company.user_email "
							+ "and (Company_Title like '%"+ searchtext + "%' "
							+ "or Company_Content like '%"+ searchtext + "%' "
							+ "or User_Nickname like '%"+ searchtext + "%') "
							+ "And user.user_email=?"; 
				} else { // 제목, 작성자 -> 매개변수를 이용해서 하나의 SQL통합
					sql = "select count(*) from Company, user "
							+ "where user.user_email=Company.user_email "
							+ "and " + search + " like '%" + searchtext + "%' "
							+ "And user.user_email=?"; 
				}
			}
			System.out.println("getCompanySearchCount 검색sql => "+sql);
			//-------------------------------
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) { // 보여주는 결과가 있다면
				x = rs.getInt(1);
				// 변수명 = rs.get자료형(필드명 또는 인덱스번호) -> 필드명을 사용할수 없는 경우
			}
		} catch (Exception e) {
			System.out.println("getCompanySearchCount() 에러 => " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}
	

}
