package jeju.find;

import java.sql.*;
import java.util.*;

import controller.DBConnectionMgr;
import jeju.find.FindDTO;

public class FindDAO {

	// 멤버변수에 연결할 클래스의 객체를 선언
	private DBConnectionMgr pool = null; // getConnection, freeConnection();
	
	// 공통으로 접속할 경우 필요로하는 변수선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null; // select
	private String sql = ""; // 실행시킬 SQL 구문 저장
	// 태그 관련 변수 선언
	String[] tags1;
	String sql2 = ""; // 태그 sql 구문 저장
	int pn = 0;
	int count2 = 0;

	// 생성자를 통해 객체를 얻어오는 구문
	public FindDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("DB접속 오류 => " + e);
		}
	}

	// 페이징 처리를 위한 전체 레코드 수를 구해와야함
	// select count(*) from company; -> 반환값 O, 매개변수 X(where 조건식X)
	public int getCompanyCount() {
		int x = 0; // 총 레코드 개수 저장
		try {
			con = pool.getConnection();
			System.out.println("con=> "+con);
			sql="select count(*) from Company";
			pstmt = con.prepareStatement(sql);
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
	public int getCompanySearchCount(String search, String searchtext) { // getMemberCount()
		
		int x = 0; // 총 레코드 갯수를 저장

		try {
			con = pool.getConnection();
			System.out.println("con => " + con);
			//--------------------------------
			if (search == null || search == "") { // 검색분야 선택X (검색어를 입력하지 않은경우)
				sql = "select count(*) from Company, user "
						+ "where user.user_email=Company.user_email "; 
				// select count(*) from member;
			} else { // 검색분야 (제목, 작성자, 제목+본문)
				if (search.contentEquals("title_content")) { // 제목+본문
					sql = "select count(*) from Company, user "
							+ "where user.user_email=Company.user_email "
							+ "and (Company_Title like '%" + searchtext + "%' "
							+ "or Company_Content like '%"+ searchtext + "%') ";
				} else if(search.contentEquals("all")) {
					sql = "select count(*) from Company, user "
							+ "where user.user_email=Company.user_email "
							+ "and (Company_Title like '%"+ searchtext + "%' "
							+ "or Company_Content like '%"+ searchtext + "%' "
							+ "or User_Nickname like '%"+ searchtext + "%') ";
				} else { // 제목, 작성자 -> 매개변수를 이용해서 하나의 SQL통합
					sql = "select count(*) from Company, user "
							+ "where user.user_email=Company.user_email "
							+ "and " + search + " like '%" + searchtext + "%' ";
				}
			}
			System.out.println("getCompanySearchCount 검색sql => "+sql);
			//-------------------------------
			pstmt = con.prepareStatement(sql);
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
	
	// 글 목록보기에 대한 메서드 구현 -> 레코드 한개 이상 -> 한 페이지당 10개씩 끊어서 보여줌
	public List getCompanyList(int start, int end) {
		
		String nickname = "";
		List companyList = null;
		FindDTO company = null ;
		
		 try {
			 con = pool.getConnection();
			 // 그룹번호가 가장 최신의 글을 중심으로 정렬
			 sql = "select *, user_nickname from Company,user "
			 		+ "where user.user_email=Company.user_email "
			 		+ "order by Company_Date desc "
			 		+ "limit ?,?";
			 pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1, start-1); // mysql 레코드 순번 0부터 시작
			 pstmt.setInt(2, end);
			 rs = pstmt.executeQuery();
			 
			 // 글 목록보기
			 if(rs.next()) { // 레코드가 최소 만족 1개이상 존재한다면
				 companyList = new ArrayList(end);
				 
				 do {
					 company = makeCompanyFromResult();		
					 companyList.add(company);
				 }while(rs.next());
				 
			 }
		 } catch(Exception e) {
			 System.out.println("getCompanyList() 에러 =>" +e);
		 } finally {
			 pool.freeConnection(con,pstmt,rs);
		 }
		 return companyList;
	}
	
	// 검색어 관련 메소드2 검색어에 따른 레코드의 범위지정에 대한 메소드
	public List getCompanyArticles(int start, int end, String search, String searchtext) { 
	
		List companyList = null ; // ArrayList articleList=null;
		FindDTO company = null ;

		try {
			con = pool.getConnection();
			//----------------------------------
			if(search==null || search=="") {
				sql = "select * "
						+ "from Company, user "
						+ "where user.user_email=Company.user_email "
						+ "group by Company_No "
						+ "order by Company_Date desc "
						+ "limit ?,?";
			} else {
				if (search.contentEquals("title_content")) { // 제목+본문
					sql = "select * "
							+ "from Company, user "
							+ "where user.user_email=Company.user_email "
							+ "and (Company_Title like '%" + searchtext + "%' "
							+ "or Company_Content like '%"+ searchtext + "%') "
							+ "group by Company_No "
							+ "order by Company_Date desc "
							+ "limit ?,?";
				} else if(search.contentEquals("all")) {
					sql = "select * "
							+ "from Company, user "
							+ "where user.user_email=Company.user_email "
							+ "and (Company_Title like '%"+ searchtext + "%' "
							+ "or Company_Content like '%"+ searchtext + "%' "
							+ "or user_nickname like '%"+ searchtext + "%') "
							+ "group by Company_No "
							+ "order by Company_Date desc "
							+ "limit ?,?";
				} else { // 제목, 작성자 -> 매개변수를 이용해서 하나의 SQL통합
					sql = "select * "
							+ "from Company, user "
							+ "where user.user_email=Company.user_email "
							+ "and " + search + " like '%" + searchtext + "%' "
							+ "group by Company_No "
							+ "order by Company_Date desc "
							+ "limit ?,?";
				}
			}
			System.out.println("getCompanyArticles()의 sql => "+sql);
			//----------------------------------
			// 1, 10 --> 1번째 레코드 번호부터 10개씩 끊어서 보여달라는 구문
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start-1); // mysql은 레코드 순번이 내부적으로 0부터 시작
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			// 글 목록보기
			if (rs.next()) { // 레코드가 최소 만족 1개이상 존재한다면
				companyList = new ArrayList(end); // 자식형
				// 10 => end갯수만큼 데이터를 담을 공간을 생성
				do {
					company = makeCompanyFromResult();		
					companyList.add(company);
				}while(rs.next());
			}
		} catch (Exception e) {
			System.out.println("getCompanyArticles() 에러 => " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return companyList;
	}
	
	// 페이징 처리 해주는 메서드
	public Hashtable pageList(String pageNum, int count) {
				
		// 1) 페이징 처리결과를 저장할 hashtable객체를 선언
		Hashtable<String,Integer> pgList = new Hashtable<String,Integer>();
		
		int pageSize = 10; // numPerPage -> 페이지당 보여주는 게시물 수(=레코드 수)
		int blockSize = 10; // pagePerBlock -> 블럭당 보여주는 페이지수 10

		// 게시판을 맨 처음 실행시키면 무조건 1페이지부터 출력
		if (pageNum == null) {
			pageNum = "1"; // default
			// 1. 무조건 1페이지는 선택하지 않아도 보여줘야 함
			// 2. 가장 최근의 글을 출력하는 목적을 가짐
		}

		int currentPage = Integer.parseInt(pageNum); // "1" -> 1 현재페이지(=nowPage)
		// 메서드 호출 -> 시작 레코드 번호
		// currentPage=1 -> 1       - 1 *    10     + 1 = 1
		// 2페이지일 경우 (2-1)*10+1=11, 3페이지일 경우(3-1)*10+1=21
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = (currentPage * pageSize);
		// 1*10=10, 2*10=20, 3*10=30 -> 마지막 레코드 번호
		int number = 0;
		// beginPerPage -> 페이지별로 시작하는 맨 처음에 나오는 게시물번호
		System.out.println("현재 레코드 수 (count) => " + count);
		number=count-(currentPage-1)*pageSize;
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
		
		if(endPage > pageCount) endPage=pageCount; // 마지막페이지 = 총페이지수
		
		// 페이징처리에 대한 결과 -> Hashtable, HashMap -> ListAction.java에 전달
		// -> 메모리에 저장 -> list.jsp
		pgList.put("pageSize",pageSize); // <-> pgList.get(키명(="pageSize"))
		pgList.put("blockSize",blockSize);
		pgList.put("currentPage",currentPage);
		pgList.put("startRow",startRow);
		pgList.put("endRow",endRow);
		pgList.put("count",count);
		pgList.put("number",number);
		pgList.put("startPage",startPage);
		pgList.put("endPage",endPage);
		pgList.put("pageCount",pageCount);
		
		return pgList;
	}
	
	private FindDTO makeCompanyFromResult() throws Exception {
		
		 FindDTO company = new FindDTO();
		 company.setCompany_no(rs.getInt("company_no"));
		 company.setUser_email(rs.getString("user_email"));
		 company.setCompany_title(rs.getString("company_title"));
		 company.setCompany_count(rs.getInt("company_count"));
		 company.setCompany_startdate(rs.getString("company_startdate"));
		 company.setCompany_enddate(rs.getString("company_enddate"));
		 company.setCompany_gender(rs.getString("company_gender"));
		 company.setCompany_theme(rs.getString("company_theme"));
		 company.setCompany_date(rs.getTimestamp("company_date"));
		 company.setCompany_content(rs.getString("company_content"));
		 company.setUser_nickname(rs.getString("user_nickname"));
		 
		 return company;
	}
	
	// 조회수 증가
	public int updateCount(int company_no) {
		int update = 0;
		try {
			con = pool.getConnection();
			sql = "update Company set Company_Count=Company_Count+1 where Company_No=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, company_no);
			update = pstmt.executeUpdate();
			System.out.println("조회수 증가유무(update) => " + update);
		} catch (Exception e) {
			System.out.println("updateCount() 에러 => " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return update;
	}
	
	// 조회수 출력
	public FindDTO readCount(int company_no) {
		
		FindDTO company = null ;
		
		try {
			con = pool.getConnection();
			sql = "select *, user_nickname " 
					+ "from Company, user " 
					+ "where Company.user_email = user.user_email "
					+ "and Company_No=?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, company_no); 
			rs = pstmt.executeQuery();
			
			// 글 목록보기
			if (rs.next()) { // 레코드가 최소 만족 1개이상 존재한다면
				// article = new BoardDTO(); // MemberDTO~
				company = makeCompanyFromResult();	// 반환형을 얻어와서 처리
			}
		} catch(Exception e) {
			System.out.println("readCount() 에러 => "+e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return company;
	}
	
	// 글 상세보기
	/*
	public FindDTO getCompany(int company_no) {
		
		FindDTO company = null ;

		try {
			con = pool.getConnection();
			sql = "update Company set Company_Count=Company_Count+1 where Company_No=?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, company_no); 
			int update = pstmt.executeUpdate();
			System.out.println("조회수 증가유무(update) => " + update);
			
			sql = "select * from Company where Company_No=?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, company_no); 
			rs = pstmt.executeQuery();
			
			// 글 목록보기
			if (rs.next()) { // 레코드가 최소 만족 1개이상 존재한다면
				// article = new BoardDTO(); // MemberDTO~
				company = makeCompanyFromResult();	// 반환형을 얻어와서 처리
				
			}
		} catch (Exception e) {
			System.out.println("getCompany() 에러 => " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return company;
	}
	*/
	
	
	// 글 상세보기 태그
	public List getTagCompany(int company_no) {
		//System.out.println(company_no);
		List tags1 = new ArrayList();
		
		try {
			con = pool.getConnection();
			sql = "select tag from Company_Tag, Tag "
					+ "where Tag.tag_no=Company_Tag.tag_no and Company_No=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, company_no);
			rs = pstmt.executeQuery();

			while (rs.next()) {// 레코드가 존재한다면
				tags1.add(rs.getString("tag"));
				// System.out.println(rs.getString("tag"));
			}
		} catch (Exception e) {
			System.out.println("getTagCompany() 에러 => " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return tags1;
	}
	
	// 게시판 글 쓰기
	public void insertCompany(FindDTO company, String email, int[] tags) {
		
		// 테이블에 입력할 게시물번호를 저장할 변수
		int number = 0; // -> 데이터를 저장하기 위한 게시물 번호
		
		try {
			con = pool.getConnection();

			// 글 번호는 자동 증가
			sql = "insert into Company(User_Email, Company_Title, Company_StartDate, Company_EndDate, Company_Theme, Company_Gender, Company_Content, Company_Date) ";
			sql += "values(?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, company.getCompany_title());
			pstmt.setString(3, company.getCompany_startdate());
			pstmt.setString(4, company.getCompany_enddate());
			pstmt.setString(5, company.getCompany_theme());
			pstmt.setString(6, company.getCompany_gender());
			pstmt.setString(7, company.getCompany_content());
			pstmt.setTimestamp(8, (Timestamp)company.getCompany_date());
			
			int insert = pstmt.executeUpdate();
			System.out.println("글쓰기 insertCompany(입력유무) => "+ insert);
			
			// 방금 쓴 글의 번호를 불러오기
			sql = "select max(Company_No) from Company";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) { 
				number = rs.getInt(1);
			} else {
				 // 현재 테이블에 데이터가 하나도 없는 경우
				number = 1;
			}
						
			sql2 = "insert into Company_Tag (Tag_No, Company_No) values (?, ?)";
			for (int i = 0; i < tags.length; i++) {
				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, tags[i]);
				pstmt.setInt(2, number);
				int insert2 = pstmt.executeUpdate();
				System.out.println("태그생성 insertCompany() => " + insert2);
			}
			
		} catch(Exception e) {
			System.out.println("insertCompany() 에러 => " + e);
		} finally {
			pool.freeConnection(con,pstmt,rs);
		}
		
	}
	
	// 글 수정
	// 1) 수정할 데이터를 찾을 메서드 필요 -> select * from board
	public FindDTO updateGetCompany(int company_no) {
		
		FindDTO company = null;
		try {
			con = pool.getConnection();
			sql = "select *, user_nickname " 
					+ "from Company, user " 
					+ "where Company.user_email = user.user_email "
					+ "and Company_No=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, company_no);
			rs = pstmt.executeQuery();
			System.out.println("user_nickname");
			if (rs.next()) {
				company = makeCompanyFromResult();
				company.setUser_nickname(rs.getString("user_nickname"));
			}
		} catch (Exception e) {
			System.out.println("updateGetCompany() 에러 => " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return company;
	}
	
	// 1-1) 태그를 불러오는 메소드
	public ArrayList updateGetCompanyTags(int company_no){
		ArrayList tags = new ArrayList();
		
		/*
		select tag 
		from Company_Tag,Tag 
		where Tag.tag_no=Company_Tag.tag_no 
		and Company_No=25
		 */

		try {
			con = pool.getConnection();
			sql = 	"select Tag.tag_no " + 
					"from Company_Tag,Tag " + 
					"where Tag.tag_no=Company_Tag.tag_no " + 
					"and Company_No=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, company_no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				tags.add(rs.getInt("Tag.tag_no"));
			}
		} catch (Exception e) {
			System.out.println("updateGetCompany() 에러 => " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return tags;
		
	}
	
	// 2) 수정시키는 메서드 작성
	public int updateCompany(FindDTO company, int[] tags) {
		
		int update = 0; // 게시물의 수정 성공 유무
		
		try {
			con = pool.getConnection();
			System.out.println( company.getCompany_no());
			
			sql = "delete from Company_Tag where Company_No=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, company.getCompany_no());
			int delete = pstmt.executeUpdate();
			System.out.println("동행찾기 게시판(수정) 태그삭제 성공 유무(updateCompany) => " + delete);
			
			sql2 = "insert into Company_Tag (Tag_No, Company_No) values (?, ?)";
			for (int i = 0; i < tags.length; i++) {
				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, tags[i]);
				pstmt.setInt(2, company.getCompany_no());
				int insert2 = pstmt.executeUpdate();
				System.out.println("동행찾기 게시판(수정) 태그생성 => " + insert2);
			}
			
			sql = "update Company set Company_Title=?, Company_StartDate=?, Company_EndDate=?, Company_Theme=?, "
					+ "Company_Gender=?, Company_Content=? where Company_No=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, company.getCompany_title());
			pstmt.setString(2, company.getCompany_startdate());
			pstmt.setString(3, company.getCompany_enddate());
			pstmt.setString(4, company.getCompany_theme());
			pstmt.setString(5, company.getCompany_gender());
			pstmt.setString(6, company.getCompany_content());
			pstmt.setInt(7, company.getCompany_no());

			update = pstmt.executeUpdate();
			System.out.println("동행찾기게시판 글수정 성공 유무(updateCompany) => " + update);
			
		} catch (Exception e) {
			System.out.println("updateCompany() 에러 => " + e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return update;
	}
	
	// 글 삭제
	public int deleteCompany(int company_no) {

		int delete = 0;
		try {
			con = pool.getConnection();
			sql = "delete from Company_Tag where Company_No=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, company_no);delete = pstmt.executeUpdate();
			System.out.println("동행찾기게시판 글삭제 태그 삭제 성공 유무(deleteCompany) => " + delete);
					
			sql = "delete from Company where Company_No=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, company_no);
			delete = pstmt.executeUpdate();
			System.out.println("동행찾기게시판 글삭제 성공 유무(deleteCompany) => " + delete);
		
		} catch (Exception e) {
			System.out.println("deleteCompany() 에러 => " + e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return delete;
	}
}