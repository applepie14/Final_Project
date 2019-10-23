package jeju.plan;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.*;

import controller.DBConnectionMgr;
import jeju.find.FindDTO;
import jeju.plan.*;
import sun.security.util.Length;


public class PlanDAO {
	
	// 멤버변수에 연결할 클래스의 객체를 선언
		private DBConnectionMgr pool = null; // getConnection, freeConnection();
		
		// 공통으로 접속할 경우 필요로하는 변수선언
		private Connection con = null;
		private PreparedStatement pstmt = null;
		private PreparedStatement pstmt2 = null;
		private ResultSet rs = null; // select
		private String sql = ""; // 실행시킬 SQL 구문 저장
		String sql2="";//태그 sql 구문 저장
		int pn=0;
		int count2=0;
		
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd hh:mm:ss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("MM/dd/hh");
		Date dd = new Date();
		
		// 생성자를 통해 객체를 얻어오는 구문
		public PlanDAO() {
			try {
				pool = DBConnectionMgr.getInstance();
			} catch (Exception e) {
				System.out.println("DB접속 오류 => " + e);
			}
		}

		// 페이징 처리를 위한 전체 레코드 수를 구해와야함
		// select count(*) from plan; -> 반환값 O, 매개변수 X(where 조건식X)
		public int getPlanCount() {
			int x = 0; // 총 레코드 개수 저장
			try {
				con = pool.getConnection();
				System.out.println("con=> "+con);
				sql="select count(*) from Plan";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) { // 보여주는 결과가 있다면
					x = rs.getInt(1);
					// 변수명 = rs.get자료형(필드명 또는 인덱스번호)
				}
			} catch(Exception e) {
				System.out.println("getPlanCount() 에러 => "+e);
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return x;

		}
		
		
		// 검색어 관련
		public int getPlanSearchCount(String subject, String theme,int []tags,String date, int day,int p, String gender) { // getMemberCount()
			
			int x = 0; // 총 레코드 갯수를 저장
			sql = "SELECT count(DISTINCT Plan.Plan_No) from Plan,Plan_Tag,Tag,user"
					 + " where Plan.Plan_No=Plan_Tag.Plan_No and Plan_Tag.Tag_No=Tag.Tag_No and user.user_email=Plan.user_email" ;
			
			try {
				con = pool.getConnection();
				System.out.println("con => " + con);
				//-------------------------------- 검색어태그
				//검색어 입력안했을때 다 보여주기.
							if (subject.contentEquals("plansubject")) { // 제목을 입력했을때
									sql+=" and Plan.Plan_Title like '%" + subject + "%'";
							}
							
							if(tags[0]!=-500) {//태그 추가시
								
								if(tags.length!=1) {
								for(int i=0; i<tags.length; i++){//태그 for문
									  
												if(i==0) {	  
											    sql+=" and (Plan_Tag.Tag_No="+tags[i];
												}
										  
											else if (i==tags.length-1) {
												 sql+=" or Plan_Tag.Tag_No="+tags[i]+")";
											}
											else  {
										   sql+=" or Plan_Tag.Tag_No="+tags[i];
											}
									  
									  
								  }//for문
								 		
								
							}
							else {
								 sql+=" and Plan_Tag.Tag_No="+tags[0];
							}
							}
							
							if(theme!="") {//태마 추가시
								sql+=" and Plan.Plan_Theme="+theme;
							}
							
							
							if(date!="") {//날짜 추가시
								sql+=" and Plan.Plan_Date="+date;
							}
							if(day!=0) {//day 추가시
								sql+=" and Plan.Plan_Period="+day;
								
							}
							if(p!=0) {//인원 추가시
								sql+=" and Plan.Plan_nop="+p;
								
							}
							
							if(gender!="") {
								sql+=" and Plan.Plan_Gender="+gender;
							}
							
							
							
				System.out.println("getPlanSearchCount 검색sql => "+sql);

				//-------------------------------
				pstmt = con.prepareStatement(sql);
				
			
				rs = pstmt.executeQuery();
				if (rs.next()) { // 보여주는 결과가 있다면
					x = rs.getInt(1);
					// 변수명 = rs.get자료형(필드명 또는 인덱스번호) -> 필드명을 사용할수 없는 경우
				}
				
			} catch (Exception e) {
				System.out.println("getPlanSearchCount() 에러 => " + e);
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return x;
		}
		
		// 글 목록보기에 대한 메서드 구현 -> 레코드 한개 이상 -> 한 페이지당 10개씩 끊어서 보여줌
		// 페이징처리
		public List getPlanList(int start, int end) {
			
			String nickname = "";
			List PlanList = null;
			PlanDTO plan = null ;
			
			 try {
				 con = pool.getConnection();
				 // 그룹번호가 가장 최신의 글을 중심으로 정렬
				 sql = "select *, user_nickname from Plan,user "
				 		+ "where user.user_email=Plan.user_email "
				 		+ "order by Plan_Date desc "
				 		+ "limit ?,?";

				 pstmt = con.prepareStatement(sql);
				 pstmt.setInt(1, start-1); // mysql 레코드 순번 0부터 시작
				 pstmt.setInt(2, end);
				 rs = pstmt.executeQuery();
				 
				 // 글 목록보기
				 if(rs.next()) { // 레코드가 최소 만족 1개이상 존재한다면
					 PlanList = new ArrayList(end);
					 
					 do {
						 plan = makePlanFromResult();		
						 PlanList.add(plan);
					 }while(rs.next());
					 
				 }
			 } catch(Exception e) {
				 System.out.println("getPlanList() 에러 =>" +e);
			 } finally {
				 pool.freeConnection(con,pstmt,rs);
			 }
			 return PlanList;
		}
		
		// 검색어 관련 메소드2 검색 내용 sql
		public List getPlanArticles(int start, int end,String subject, String theme,int []tags,String date, int day,int p, String gender) { 
			sql = "select DISTINCT Plan.Plan_No,Plan.plan_count,Plan.Plan_content,Plan.Plan_Title,user.User_Nickname,Plan.Plan_Date,Plan.Plan_StartDate,Plan.Plan_Period,Plan.Plan_like_count,Plan.Plan_Theme,Plan.Plan_Gender from Plan,Plan_Tag,Tag,user "
				+"where Plan.Plan_No=Plan_Tag.Plan_No and Plan_Tag.Tag_No=Tag.Tag_No and user.user_email=Plan.user_email";
			
			
			List PlanList = null ; // ArrayList articleList=null;
			PlanDTO plan = null ;

			try {
				con = pool.getConnection();
				//----------------------------------
				if (subject!="") { // 제목을 입력했을때
					sql+=" and Plan_Title like '%" + subject + "%'";
				}
			
				if(tags[0]!=-500) {//태그 추가시
					
					if(tags.length!=1) {
					for(int i=0; i<tags.length; i++){//태그 for문
						  
									if(i==0) {	  
								    sql+=" and (Plan_Tag.Tag_No="+tags[i];
									}
							  
								else if (i==tags.length-1) {
									 sql+=" or Plan_Tag.Tag_No="+tags[i]+")";
								}
								else  {
							   sql+=" or Plan_Tag.Tag_No="+tags[i];
								}
						  
						  
					  }//for문
					 		
					
				}
				else {
					 sql+=" and Plan_Tag.Tag_No="+tags[0];
				}
				}

			
			if(theme!="") {//태마 추가시
				sql+=" and Plan.Plan_Theme="+theme;
			}
			
			if(date!="") {//날짜 추가시
				sql+=" and Plan.Plan_Date="+date;
			}
			if(day!=0) {//day 추가시
				sql+=" and Plan.Plan_Period="+day;
				
			}
			if(p!=0) {//인원 추가시
				sql+=" and Plan.Plan_nop="+p;
				
			}
			
			if(gender!="") {
				sql+=" and Plan.Plan_Period="+gender;
			}
			
			sql+=" limit ?,?";
				System.out.println("getCompanyArticles()의 sql => "+sql);
				//----------------------------------
				// 1, 10 --> 1번째 레코드 번호부터 10개씩 끊어서 보여달라는 구문
				
				
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start-1); // mysql은 레코드 순번이 내부적으로 0부터 시작
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();
				// 글 목록보기
				
	
				if (rs.next()) { // 레코드가 최소 만족 1개이상 존재한다면
					PlanList = new ArrayList(end); // 자식형
					// 10 => end갯수만큼 데이터를 담을 공간을 생성
					do {
						plan = makePlanFromResult();		
						PlanList.add(plan);
					}while(rs.next());
				}
				
			} catch (Exception e) {
				System.out.println("getPlanArticles() 에러 => " + e);
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return  PlanList;
		}
		
		public Hashtable pageList(String pageNum, int count) {
			
			// 1. ListAction.java 소스코드를 BoardDAO로 이동
			// ListAction에서의 복잡한 페이징처리를 대신 처리
			
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
			System.out.println("현재 레코드 수 (count) =>" + count);
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
		
		
		
		private PlanDTO makePlanFromResult() throws Exception {
			
			 PlanDTO plan = new PlanDTO();
			 plan.setPlan_no(rs.getInt("plan_no"));
			 plan.setPlan_content(rs.getString("plan_content"));
			 plan.setPlan_count(rs.getInt("plan_count"));
			 plan.setPlan_date(rs.getInt("plan_date"));
			 plan.setPlan_gender(rs.getString("plan_gender"));
			 plan.setPlan_like_count(rs.getInt("plan_like_count"));
			 plan.setPlan_period(rs.getString("plan_period"));
			 plan.setPlan_startdate(rs.getDate("plan_startdate"));
			 plan.setPlan_theme("plan_theme");
			 plan.setPlan_title(rs.getString("plan_title"));
			 plan.setUser_nickname(rs.getString("user_nickname"));
			 
			 
			 return plan;
		}
		
		
}
