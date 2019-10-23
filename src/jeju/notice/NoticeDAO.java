package jeju.notice;
import java.sql.*;
import java.util.*; // 자료구조 Collection(Vector, ArrayList 등)
import java.util.Date;
import controller.DBConnectionMgr;
import jeju.user.UserDTO;
import jeju.notice.NoticeDTO;
import java.text.SimpleDateFormat;

public class NoticeDAO {

	// 1. 멤버변수에 연결할 클래스의 객체를 선언
	private DBConnectionMgr pool = null;
	
	// 2. 공통으로 접속할 경우 필요로 하는 멤버변수
		private Connection conn = null;
		private PreparedStatement pstmt = null; // sql 실행
		private ResultSet rs = null; // select 
		private String sql = ""; // 실행시킬 sql구문 저장
	
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd hh:mm:ss");
		Date dd = new Date();
		
		// 2. 생성자를 통해서 객체를 얻어오는 구문 작성
		public NoticeDAO() {
			try {
				pool = DBConnectionMgr.getInstance(); // 기본 정적 메소드 제공
				System.out.println("pool : " + pool);
			} catch (Exception e) {
				System.out.println("DB연결실패 : " + e); // e.toString()
			}
		} // 생성자

	public int getArticleCount() { //->getMemberCount()
	int x=0;//레코드갯수
	try {
		conn=pool.getConnection();
		System.out.println("con="+conn);
		sql="select count(*) from Notice";  //select count(*) from member
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()) { //보여주는 결과가 있다면
			x=rs.getInt(1);// 변수명=rs.get자료형(필드명 또는 인덱스번호)
			                       //필드명이 아니기때문에 select ~ from 사이에 나오는 순서
		}
	}catch(Exception e) {
		System.out.println("getArticleCount()메서드 에러유발"+e);
	}finally {
		pool.freeConnection(conn,pstmt,rs);
	}
	return x;
}
// 검색어 관련 메소드. 게시판의 검색어에 따른 레코드 수를 구하는 메서드작성(검색분야, 검색어)
 public int getNoticeSearchCount(String search, String searchtext) { // getMemberCount()
	
	int x = 0; // 총 레코드 갯수를 저장
	try {
		conn = pool.getConnection();
		System.out.println("con => " + conn);
		//--------------------------------
		if (search == null || search == "") { // 검색분야 선택X (검색어를 입력하지 않은경우)
			sql = "select count(*) from Notice "; 
			// select count(*) from member;
		} else { // 검색분야 (제목, 작성자, 제목+본문)
			if (search.contentEquals("title_content")) { // 제목+본문
				sql = "select count(*) from Notice where (Notice_Title like '%" + searchtext + "%' "
						+ "or Notice_Content like '%"+ searchtext + "%') ";
			} else { // 제목-> 매개변수를 이용해서 하나의 SQL통합
				sql = "select count(*) from Notice "
						+ "where " + search + " like '%" + searchtext + "%' ";
			} 
		}
		System.out.println("getNoticeSearchCount 검색sql => "+sql);
		//-------------------------------
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if (rs.next()) { // 보여주는 결과가 있다면
			x = rs.getInt(1);
			// 변수명 = rs.get자료형(필드명 또는 인덱스번호) -> 필드명을 사용할수 없는 경우
		}
	} catch (Exception e) {
		System.out.println("getNoticeSearchCount() 에러 => " + e);
	} finally {
		pool.freeConnection(conn, pstmt, rs);
	}
	return x;
}
 
//2.글목록보기에 대한 메서드 구현->레코드가 한개이상=>한페이지당 10개씩 끊어서 보여준다
//1.레코드의 시작번호   2.불러올 레코드의 갯수
 public List getNoticeList(int start,int end) { //getMemberArticle(int start,int end)
	                                                          //id asc name desc
	List noticeList=null;//ArrayList articleList=null;
	NoticeDTO notice=null;
	
	try {
		conn=pool.getConnection();
		//그룹번호가 가장 최신의 글을 중심으로 정렬하되,만약에 level이 같은 경우에는
		//step값으로 오름차순을 통해서 몇번째레코드번호를 기준해서 정렬하라.
		sql="select * from Notice order by Notice_No desc limit ?,?"; //1,10
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, start-1);//mysql은 레코드순번이 내부적으로 0부터 시작
		pstmt.setInt(2, end);
		rs=pstmt.executeQuery();
	
		
		//기존의 레코드외에 추가된 레코드를 첨부해서 다같이 보여주는 개념->누적개념(벽돌)
		if(rs.next()) {//레코드가 존재한다면(최소만족 1개)
			noticeList=new ArrayList(end);//10->end갯수만큼 데이터를 담을 공간생성하라
		
			do {
				notice = makeNoticeFromResult();
				noticeList.add(notice);
			}while(rs.next());
		} 
	}catch(Exception e) {
		System.out.println("getArticles()메서드 에러유발"+e);
	}finally {
		pool.freeConnection(conn, pstmt,rs);
	}
	return noticeList;
}
 
/////추가2- 2-1) 검색어에 따른 레코드의 범위지정에 대한 메소드
 
public List getNoticeArticles(int start, int end, String search, String searchtext) { 
	// id asc name desc
 List noticeList = null;// ArrayList articleList=null;
 NoticeDTO notice= null;

 try {
	conn = pool.getConnection();
	//----------------------------------
	if(search==null || search=="") {
		sql = "select * from Notice order by Notice_Date desc limit ?,?";
	} else {
		if (search.contentEquals("title_content")) { // 제목+본문
			sql = "select * "
					+ "from Notice where Notice_Title like '%" + searchtext + "%' "
					+ "or Notice_Content like '%"+ searchtext + "%' "
					+ "order by Notice_Date desc "
					+ "limit ?,?";
		} else { // 제목, 작성자 -> 매개변수를 이용해서 하나의 SQL통합
			sql = "select * "
					+ "from Notice "
					+ "where "  + search + " like '%" + searchtext + "%' "
					+ "order by Notice_Date desc "
					+ "limit ?,?";
		}
	}
	System.out.println("getNoticeArticles()의 sql => "+sql);
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, start-1); // mysql은 레코드 순번이 내부적으로 0부터 시작
	pstmt.setInt(2, end);
	rs = pstmt.executeQuery();
	//글목록보기
	if (rs.next()) {// 레코드가 존재한다면(최소만족 1개)

		noticeList = new ArrayList(end);// 10->end갯수만큼 데이터를 담을 공간생성하라
		do {
			notice=makeNoticeFromResult();
			noticeList.add(notice);
		}while(rs.next());
	}
 } catch (Exception e) { 
	System.out.println("getNoticeArticles() 에러 => " + e);
 } finally {
	pool.freeConnection(conn, pstmt, rs);
 }
 return noticeList;
 }
		/*
		 * NoticeDTO article = makeArticleFromResult();
		 * article.setNotice_no(rs.getInt("notice_no"));
		 * article.setNotice_title(rs.getString("notice_title"));
		 * article.setNotice_cate(rs.getString("notice_cate"));
		 * article.setNotice_content(rs.getString("notice_content"));
		 * article.setNotice_count(rs.getInt("notice_count"));
		 */

		/*
		 * * BoardDTO article=new BoardDTO();//MemberDTO mem=new MemberDTO()
		 * article.set(rs.getInt("")); article.setWriter(rs.getString("writer"));
		 * article.setEmail(rs.getString("email"));
		 * article.setSubject(rs.getString("subject"));
		 * article.setPasswd(rs.getString("passwd"));
		 * article.setReg_date(rs.getTimestamp("reg_date"));//오늘날짜->코딩 now()
		 * article.setReadcount(rs.getInt("readcount"));//default->0
		 * article.setRef(rs.getInt("ref"));//그룹번호->신규글과 답변글 묶어주는 번호
		 * article.setRe_step(rs.getInt("re_step"));//답변글의 순서
		 * article.setRe_level(rs.getInt("re_level"));//들여쓰기(답변의 깊이)
		 * article.setContent(rs.getString("content"));//글내용
		 * article.setIp(rs.getString("ip"));//글쓴이의 ip주소->request.getRemoteAddr()
		 */			 
        //추가
		


////추가3//////////////////////////////////////////////////////////////
//페이징 처리를 재조정해주는 메서드작성(ListAction 클래스에서 불러오기)
//1.화면에 보여주는 페이지 번호 2.화면에 출력할 레코드갯수
 public Hashtable pageList(String page,int count) {
		
	// 1. ListAction.java 소스코드를 BoardDAO로 이동
    // ListAction에서의 복잡한 페이징처리를 대신 처리
	
	//1.페이징 처리결과를 저장할 hashtable객체를 선언
	Hashtable<String,Integer> pgList = new Hashtable<String,Integer>();
	
       int pageSize=10;//PerPage->페이지당 보여주는 게시물수(=레코드수)->20개이상
       int blockSize=10;//pagePerBlock->블럭당 보여주는 페이지수
       
    //게시판을 맨 처음 실행시키면 무조건 1페이지부터 출력
    if(page==null){
    	page="1";//default(무조건 1페이지는 선택하지 않아도 보여줘야 되기때문에)
    }
    int currentPage=Integer.parseInt(page);//현재페이지->nowPage
    //시작레코드번호 ->limit ?,?
    //                  (1-1)*10+1=1,(2-1)*10+1=11,(3-1)*10+1=21
    int startRow=(currentPage-1)*pageSize+1;		
    int endRow=currentPage*pageSize;//1*10=10,2*10=20,3*10=30
    int number=0;//beginPerPage->페이지별 시작하는 맨 처음에 나오는 게시물 번호
    System.out.println("현재 레코드수(count)=>"+count);
    number=count-(currentPage-1)*pageSize;
    System.out.println("페이지별 ber=>"+number);
    
    //총페이지수,시작,종료페이지 계산
    int pageCount=count/pageSize+(count%pageSize==0?0:1);
       //2.시작페이지 
       //블럭당 페이지수 계산->10->10배수,3->3의 배수
       int startPage=0;//1,2,3,,,,10 [다음블럭 10],11,12,,,,,20
       if(currentPage%blockSize!=0){ //1~9,11~19,21~29,,,
    	   startPage=currentPage/blockSize*blockSize+1;
       }else{ //10%10 (10,20,30,40~)
    	   //             ((10/10)-1)*10+1=1
    	  startPage=((currentPage/blockSize)-1)*blockSize+1; 
       }
       int endPage=startPage+blockSize-1;//1+10-1=10
       System.out.println("startPage="+startPage+",endPage=>"+endPage);
       //블럭별로 구분해서 링크걸어서 출력
       if(endPage > pageCount) endPage=pageCount;//마지막페이지=총페이지수
    
    //페이징 처리에 대한 계산결과->Hasthtable->ListAction전달->request->list.jsp출력  
    //~DAO->실질적인 업무에 관련된 코딩->액션클래스로 전달->view(jsp)에 최종출력
    pgList.put("pageSize", pageSize);//<->pgList.get("pageSize")
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

//--중복된 레코드 한개를 담을 수 있는 메서드를 따로 만들어서 처리-------
private NoticeDTO makeNoticeFromResult() throws Exception{
	NoticeDTO article=new NoticeDTO();
	article.setNotice_no(rs.getInt("notice_no"));
	article.setNotice_title(rs.getString("notice_title"));
	article.setNotice_content(rs.getString("notice_content"));
	article.setNotice_count(rs.getInt("notice_count"));
	article.setNotice_date(rs.getTimestamp("notice_date"));
	article.setAdmin_id(rs.getString("admin_id"));
	return article ;
}

//----------게시판의 글쓰기 및 글 답변달기-----------------------------
public void insertArticle(NoticeDTO article) { //~(MemberDTO mem)
	

	//테이블에 입력할 게시물 번호를 저장할 변수
		/* int num=article.getNotice_no(); */
		int number=0; 
	try {
		conn=pool.getConnection();
		sql="select max(Notice_No) from Notice"; //최대값+1=실제 저장할 게시물번호
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()) {//현재 테이블에서 데이터가 한개라도 존재한다면
			number=rs.getInt(1)+1;
		}else { //맨 처음에 레코드가 한개라도 없다면 무조건 number=1
			number=1;
		}
		
		//12개->,reg_date,reacount(생략)->default->sysdate,now()<-mysql (?대신에)
		sql="insert into Notice(Notice_Title,Notice_Content,Notice_Date) values(?,?,?)";
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1, article.getNotice_title());
		pstmt.setString(2, article.getNotice_content());
		pstmt.setTimestamp(3, article.getNotice_date());
		
		int insert=pstmt.executeUpdate();
		
		System.out.println("게시판의 글쓰기 성공유무(insert)=>"+insert);
	}catch(Exception e) {
		System.out.println("insertArticle()메서드 에러유발=>"+e);
	}finally {
		pool.freeConnection(conn, pstmt,rs);
	}//finally
}
//글상세보기->list.jsp
	
	public NoticeDTO getArticle(int notice_no) {
		
		NoticeDTO article=null;
		
		try {
			
			conn=pool.getConnection();
			sql="update Notice set Notice_Count=Notice_Count+1 where Notice_No=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, notice_no);
			int update=pstmt.executeUpdate();
			 
			System.out.println("조회수 증가유무(update)=>"+update);
			
			sql="select * from Notice where Notice_No=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, notice_no);
			rs=pstmt.executeQuery();
			
			System.out.println("notice_no의 값 => "+notice_no);
			System.out.println("getArticle()의 sql => "+sql);
			
			if(rs.next()) {//레코드가 존재한다면
				article=makeNoticeFromResult();
				
			}
		}catch(Exception e) {
			System.out.println("getArticle()메서드 에러유발"+e);
		}finally {
			pool.freeConnection(conn, pstmt,rs);
		}
		return article;
	}
	
	
	//-----------중복된 레코드 한개를 담을 수 있는 메서드를 따로 만들어서 처리------------	
		private NoticeDTO makeArticleFromResult() throws Exception {
			NoticeDTO article=new NoticeDTO();
			article.setNotice_no(rs.getInt("setNotice_no"));
			article.setNotice_title(rs.getString("notice_title"));
			article.setNotice_content(rs.getString("notice_content"));
			article.setNotice_count(rs.getInt("notice_count"));
			article.setNotice_date(rs.getTimestamp("notice_date"));
			article.setAdmin_id(rs.getString("admin_id"));//default->0
			return article;
		}
	//-----------------------------------------------------------------------------
 //,글수정,
 //1)수정할 데이터를 찾을 메서드 필요=>select * from board where num=? =>조회수를 증가X
 public NoticeDTO updateGetArticle(int num) {
	NoticeDTO article=null;//ArrayList articleList=null;
	try {
		conn=pool.getConnection();
	  
		sql="select * from Notice where notice_no=?";//1,10
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs=pstmt.executeQuery();
		//글목록보기
		if(rs.next()) {//레코드가 최소 만족 1개이상 존재한다면
			   article=makeNoticeFromResult();
			   /*
			    article=new BoardDTO();//MemberDTO~
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));//오늘날짜->코딩 ->now()
				article.setReadcount(rs.getInt("readcount"));//default->0
				article.setRef(rs.getInt("ref"));//그룹번호->신규글과 답변글 묶어주는 역할
				article.setRe_step(rs.getInt("re_step"));//답변글이 나오는 순서(0,1,2,3,,오름차순)
				article.setRe_level(rs.getInt("re_level"));//들여쓰기(답변의 깊이)
				article.setContent(rs.getString("content"));//글내용
				article.setIp(rs.getString("ip"));//글쓴이의 ip주소
				*/
		}
	}catch(Exception e) {
		System.out.println("updateGetArticle() 메서드 에러유발"+e);
	}finally {
		pool.freeConnection(conn,pstmt,rs);
	}
	return article;
}

 // 공지 수정
public int updateArticle(String title, String content, int notice_no) { //~(MemberDTO mem)
	//테이블에 입력할 게시물 번호를 저장할 변수
		/* int num=article.getNotice_no(); */
		int update=0; 
	try {
		conn=pool.getConnection();
		//12개->,reg_date,reacount(생략)->default->sysdate,now()<-mysql (?대신에)
		sql="UPDATE Notice " + 
				"SET Notice_Title=? " + 
				", Notice_Content=? " +
				"WHERE Notice_No=?";
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setInt(3, notice_no);
		
		update=pstmt.executeUpdate();
		
		System.out.println("공지 수정 성공유무(update)=>"+update);
	}catch(Exception e) {
		System.out.println("updateArticle()메서드 에러유발=>"+e);
	}finally {
		pool.freeConnection(conn, pstmt,rs);
	}//finally
	return update;
}


public NoticeDTO deleteGetArticle(int num) {
	NoticeDTO article=null;//ArrayList articleList=null;
	try {
		conn=pool.getConnection();
	  
		sql="select * from Notice where notice_no=?";//1,10
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs=pstmt.executeQuery();
		//글목록보기
		if(rs.next()) {//레코드가 최소 만족 1개이상 존재한다면
			   article=makeNoticeFromResult();

		}
	}catch(Exception e) {
		System.out.println("deleteGetArticle() 메서드 에러유발"+e);
	}finally {
		pool.freeConnection(conn,pstmt,rs);
	}
	return article;
}


//글 삭제시켜주는 메서드
public int deleteArticle(int notice_no) {
	
	 int delete = 0;//게시물의 삭제성공유무 
	 try {
	            conn=pool.getConnection();
	    		 sql="delete from Notice where Notice_No=?";
	    		 pstmt=conn.prepareStatement(sql);
	    		 pstmt.setInt(1, notice_no);
	    		 delete=pstmt.executeUpdate();
	    		 System.out.println("게시판의 글삭제 성공유무(delete)="+delete);//1성공
	    		 
	 }catch(Exception e) {
		 System.out.println("deleteArticle()메서드 에러유발=>"+e);
	 }finally {
		pool.freeConnection(conn, pstmt, rs); //암호를 찾기 때문에
	 }
	 return delete;
}

	
}
	

	
	
