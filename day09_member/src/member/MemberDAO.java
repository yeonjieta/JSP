package member;

import java.sql.*;

import java.util.*;

import javax.sql.*;
import javax.naming.*;

//1) 싱글톤 구현
//2) 커넥션 풀 연결
//3) pstmt 사용하기 : SQL에서 파라미터가 많이 사용될 경우, 순서대로 값을 넣어주는 객체

/*
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		pstmt = conn.prepareStatement(sql);  // (자료형에 다라 쿼리문을 다르게 만들어준다.)
		pstmt.setString(1, dto.getName());  // 문자열은 자동으로 따옴표로 묶어준다.
		pstmt.setInt(2, dto.getAge());		  // 숫자는 그냥 입력한다.
		rs = pstmt.executeQuery();               // 이미 쿼리문을 전달했기 때문에 인자를 추가로 전달하지 않는다.
*/

public class MemberDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private Context init;
	private DataSource ds;
	
	
	// 싱글톤 
	// 인스턴스 직접 생성, 멤버변수 보호를 위해 private 접근제어자 사용, 
	// 인스턴스 생성없이 접근가능하도록 static 키워드 사용 
	private static MemberDAO instance = new MemberDAO();

	// 생성자 대신 객체를 받는 함수 작성(객체가 없는 상태에서 객체를 받아야 하니 static으로 처리)
	public static MemberDAO getInstance() {
		return instance;
	}
	
	
	private MemberDAO() {   // 외부에서 생성자를 호출 못하게 private으로 변경
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");

		} catch (NamingException e) {
			System.err.println("DAO 생성자 예외 발생 : " + e);
		}
	}
	
	
	
	public String test() {
		String banner="";
		String sql =" select banner from v$version";
		try {
			conn = ds.getConnection();
			
//			stmt = conn.createStatement();
			pstmt = conn.prepareStatement(sql); // 미리 준비한 SQL을 넣어서 pstmt를 받는다.
			
//			rs = stmt.executeQuery(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				banner = rs.getString("banner");
			}
		} catch ( SQLException e) {
			System.err.println(getClass().getSimpleName() + " : "  + e);
		} finally {
			close();
		}
		return banner;
	}

	// rs를 전달받아서, MemberDTO 하나를 반환하는 함수(내부에서만 사용)
	private MemberDTO mapping(ResultSet rs) throws SQLException{
		MemberDTO dto = new MemberDTO();
		dto.setAge(rs.getInt("age"));
		dto.setBirth(rs.getString("birth"));
		dto.setEmail(rs.getString("email"));
		dto.setGender(rs.getString("gender"));
		dto.setIdx(rs.getInt("idx"));
		dto.setUserid(rs.getString("userid"));
		dto.setUsername(rs.getString("username"));
		dto.setUserpw(rs.getString("userpw"));
		return dto;
	}
	
	// 연결해제(내부사용)
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}
	}
	
	// 전체목록
	public List<MemberDTO> selectAll() {
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		String sql = "select * from member1 order by idx";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDTO dto = mapping(rs);
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close();
		}
		return list;
	}
	
	// 회원가입(추가)
	public int insert(MemberDTO dto) {
		int row = 0;
		String sql = "insert into member1"
					+ "(userid, userpw, username, email, birth, gender, age)"
					+ "values(?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn =ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpw());
			pstmt.setString(3, dto.getUsername());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getBirth());
			pstmt.setString(6, dto.getGender());
			pstmt.setInt(7, dto.getAge());
			row = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally { close();}
		return row;
	}
	
	// idx로 단일 회원 조회하기
	public MemberDTO selectOne(int idx) {
		MemberDTO dto = null; // 조건에 맞는 객체가 없다는걸 타나내고 싶어서 null , new MemberDTO();
		String sql = "select * from member1 where idx = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {  // if만 쓴건, 조건에 맞는 하나만 처리하겠다. 
				dto = mapping(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	// 회원탈퇴
	public int delete(int idx) {
		int row = 0;
		String sql = "delete member1 where idx = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
			
		} finally {
			close();
		}
		
		return row;
	}
	
	// 회원 수정
	public int modify(MemberDTO dto) {
		int row = 0;
		String sql ="update member1 "
					+ "set  userpw= ?, username=?, birth=?, email=?, gender=?, age=?"
					+ "where userid=?";
		try {
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getUserpw());
		pstmt.setString(2, dto.getUsername());
		pstmt.setString(3, dto.getBirth());
		pstmt.setString(4, dto.getEmail());
		pstmt.setString(5, dto.getGender());
		pstmt.setInt(6, dto.getAge());
		pstmt.setString(7, dto.getUserid());
		row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return row;
	}
	

}
