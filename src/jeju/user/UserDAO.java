package jeju.user;

// 웹상에서 호출할 메소드를 작성
import java.sql.*; // DB사용
import java.text.SimpleDateFormat;
import java.util.*; // 자료구조 Collection(Vector, ArrayList 등)
import java.util.Date;

import controller.DBConnectionMgr;
import jeju.user.UserDTO;


public class UserDAO {
	
	// 1. 멤버변수에 연결할 클래스의 객체를 선언
	private DBConnectionMgr pool = null; // getConnection, freeConnection();
	
	// 2. 공통으로 접속할 경우 필요로 하는 멤버변수
	private Connection conn = null;
	private PreparedStatement pstmt = null; // sql 실행
	private ResultSet rs = null; // select 
	private String sql = ""; // 실행시킬 sql구문 저장
	
	SimpleDateFormat sdf = new SimpleDateFormat("MM/dd hh:mm:ss");
	Date dd = new Date();
	
	// 2. 생성자를 통해서 객체를 얻어오는 구문 작성
	public UserDAO() {
		try {
			pool = DBConnectionMgr.getInstance(); // 기본 정적 메소드 제공
			//System.out.println("pool : " + pool);
		} catch (Exception e) {
			//System.out.println("DB연결실패 : " + e); // e.toString()
		}
	} // 생성자
	
	// 1. 회원 로그인
		public String loginCheck(String id, String pw) {
			String name = "";
			
			try {
				// 1. DB연결
				conn = pool.getConnection(); // 만들어진 Connection 반환
				//System.out.println("conn : " + conn);

				// 2. SQL처리
				// 일반 회원 로그인
				sql = "select user.user_nickname, user.Activate, user.user_email, user.user_password " + 
						"from login, user " + 
						"where user.user_email = login.user_email and " + 
						"user.user_password = login.user_password and " + 
						"user.user_point = user.user_point and " + 
						"login.user_email=? and " + 
						"login.user_password=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, pw);

				// 관리자 로그인
				String sql2 = "select Admin_ID, Admin_PW from Admin where Admin_ID=? and Admin_PW=?";
				PreparedStatement pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1, id);
				pstmt2.setString(2, pw);
				
				rs=pstmt.executeQuery();
				ResultSet rs2=pstmt2.executeQuery(); // pstmt2 = 관리자 로그인

				if(rs.next())
					name = rs.getString("user.user_nickname");
				if(rs2.next()) {
					name = "관리자";
				}
				boolean check = rs.next(); // 불러올 데이터가 존재하면 true, 없으면 false
				System.out.println("로그인 성공");
			} catch (Exception e) {
				System.out.println("loginCheck() 호출 실패 : " + e);
			} finally {
			// 3. 메모리 해제
				pool.freeConnection(conn, pstmt, rs);
				// conn.close(), pstmt.close(), rs.close()
			}	
			return name;
		}
		
		// 2. 중복 id를 체크해주는 메소드
		public int checkId(String user_email) {
			int check = 0;
			String sql2;
			PreparedStatement pstmt2;
			ResultSet rs2;
			try {
				// 1. DB연결
				conn = pool.getConnection(); // 만들어진 Connection 반환
				System.out.println("conn : " + conn);

				// 2. SQL처리
				sql = "select user_email from user where user_email=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user_email);
				rs=pstmt.executeQuery();
				
				// 2. SQL처리(관리자 처리)
				sql2 = "select Admin_ID from Admin where Admin_ID=?";
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1, user_email);
				rs2=pstmt2.executeQuery();
				
				if(rs.next() || rs2.next()) {
					check = 1;
				}else {
					check = 0;
				}
			} catch (Exception e) {
				System.out.println("checkId() 호출 실패 : " + e);
			} finally {
			// 3. 메모리 해제
				pool.freeConnection(conn, pstmt, rs);
				// conn.close(), pstmt.close(), rs.close()
			}	
			return check;
		}
		
		// 2. 별명 중복 체크 메소드
		public int checkNick(String user_nickname) {
			int check= 0; 
			
			try {
				// 1. DB연결
				conn = pool.getConnection(); // 만들어진 Connection 반환
				System.out.println("conn : " + conn);

				// 2. SQL처리
				sql = "select user_nickname from user where user_nickname=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user_nickname);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					check = 1; // 데이터 有, 사용X
				}else {
					check = 0;
				} 
			} catch (Exception e) {
				System.out.println("checkId() 호출 실패 : " + e);
			} finally {
			// 3. 메모리 해제
				pool.freeConnection(conn, pstmt, rs);
				// conn.close(), pstmt.close(), rs.close()
			}	
			return check;
		}
	
	// 회원가입
	public boolean userInsert(UserDTO user) {
		boolean check = false; // 회원가입 성공 유무
		
		try {
			conn = pool.getConnection();
			conn.setAutoCommit(false);
			
			// 2. SQL 처리
			// 순서: 이메일, 이름, 별명, 비밀번호, 전화번호, 생일, 성별, 포인트, 자기소개
			sql = "insert into user values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUser_email());
			pstmt.setString(2, user.getUser_name());
			pstmt.setString(3, user.getUser_nickname());
			pstmt.setString(4, user.getUser_password());
			pstmt.setString(5, user.getUser_phone());
			pstmt.setString(6, user.getUser_birth());
			pstmt.setString(7, user.getUser_gender());
			pstmt.setInt(8, 0); // 포인트 회원가입시에는 0
			pstmt.setString(9, user.getUser_intro());
			pstmt.setString(10, user.getAccess()); // 포인트 회원가입시에는 0
			pstmt.setString(11, "N"); // 기본으로 N 값을 준다(인증 ㄴㄴ)
			
			int insert = pstmt.executeUpdate();
			System.out.println("userInsert(데이터 입력 유무) : " + insert);
			
			conn.commit();
			
			if(insert > 0) { // if(insert == 1)
				check=true;  // 데이터 성공 확인
			}
			
			
		} catch (Exception e) {
			System.out.println( sdf.format(dd)+"\nuserInsert() 메소드 에러발생\n" + e);
		} finally {
			pool.freeConnection(conn, pstmt);
		}
		return check;
	}
	
	// 회원가입 시 로그인 테이블에 값 넣기
	public boolean loginInsert(LoginDTO login) {
		boolean check = false; // 로그인 테이블에 값 넣기 성공 유무
		
		try {
			conn = pool.getConnection();
			conn.setAutoCommit(false);
			
			// 2. SQL 처리
			// 순서: 이메일, 이름, 별명, 비밀번호, 전화번호, 생일, 성별, 포인트, 자기소개
			sql = "insert into login values(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, login.getUser_email());
			pstmt.setString(2, login.getUser_password());
			pstmt.setInt(3, 0); // 포인트 회원가입시에는 0
			
			int insert = pstmt.executeUpdate();
			System.out.println("insert(데이터 입력 유무) : " + insert);
			
			conn.commit();
			
			if(insert > 0) { // if(insert == 1)
				check=true;  // 데이터 성공 확인
			}
		} catch (Exception e) {
			System.out.println(login.getUser_email() + ", " + login.getUser_password());
			System.out.println("loginInsert() 메소드 에러발생" + e);
		} finally {
			pool.freeConnection(conn, pstmt);
		}
		return check;
	}
	
	public String[] ActivateSelect(String user_Email) {
		String user[] = new String[2]; // 로그인 테이블에 값 넣기 성공 유무
		
		try {
			conn = pool.getConnection();
			
			sql = "select user.Activate, user.User_Email from login, user " + 
					"where user.user_email = login.user_email " + 
					"And login.user_email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_Email);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user[0] = rs.getString("user.User_Email");
				user[1] = rs.getString("user.Activate");
			}
			
		} catch (Exception e) {
			System.out.println("ActivateSelect() 메소드 에러발생" + e);
		} finally {
			pool.freeConnection(conn, pstmt);
		}		
		return user;
	}
	
	public int ActivateUpdate(String user_Email) {
		int check = 0; // 로그인 테이블에 값 넣기 성공 유무
		
		try {
			conn = pool.getConnection();
			conn.setAutoCommit(false);
			
			// 2. SQL 처리
			// 순서: 이메일, 이름, 별명, 비밀번호, 전화번호, 생일, 성별, 포인트, 자기소개

			sql = "update user set Activate='Y' where user_Email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_Email);
			check = pstmt.executeUpdate();

			conn.commit(); // update했기 때문에 Commit
			
		} catch (Exception e) {
			System.out.println("ActivateUpdate() 메소드 에러발생" + e);
		} finally {
			pool.freeConnection(conn, pstmt);
		}		
		return check;
	}
	// 비밀번호 확인
	public String passwordConfirm(String email) {
		String check = "";

		try {
			conn = pool.getConnection();
			sql = "SELECT User_Password FROM login " + 
					"WHERE login.User_Email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				check = rs.getString("User_Password");
			}
		} catch(Exception e) {
			System.out.println("passwordConfirm() 메소드 에러발생" + e);
		} finally {
			pool.freeConnection(conn, pstmt,rs);
		}		
		return check;
	}
	
	// user 비밀번호 변경
	public int passwordUpdate(String table,String update_pwd, String user_Email) {
		int check = 0; // user테이블에 비밀번호 변경 성공 유무
		
		try {
			conn = pool.getConnection();
			conn.setAutoCommit(false);
			
			// 2. SQL 처리
			sql = "UPDATE " + table + " SET User_Password=? WHERE User_Email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, update_pwd);
			pstmt.setString(2, user_Email);
			check = pstmt.executeUpdate();
			
			conn.commit(); // update했기 때문에 Commit
			
		} catch (Exception e) {
			System.out.println("passwordUpdate() 메소드 에러발생" + e);
		} finally {
			pool.freeConnection(conn, pstmt);
		}		
		return check;
	}
	
	// 비밀번호 임시 발급
	public String passwordTemp(String table,String update_pwd, String user_Email) {
		return "";
	}
	
}
