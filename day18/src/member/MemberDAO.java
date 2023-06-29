package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	// 커넥션풀
	// 싱글톤
	// Connection, PreaparedStatement, ResultSet
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	public static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	private MemberDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		
		} catch (Exception e) {} 
	}
	
	// 가입
	// 회원가입 수행 후 가입 성공여부를 반환, 가입 성공시 새로 추가된 행의 수를 반환
	public int insert(MemberDTO dto) {
		int row = 0;
		String sql = "insert into member(userid, userpw, username, email) values(?, ? ,?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpw());
			pstmt.setString(3, dto.getUsername());
			pstmt.setString(4, dto.getEmail());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close();}
		return row;
	}
	
	// 로그인
	// 사용자의 로그인을 확인하고 로그인된 사용자의 정보를 반환, 로그인 성공시 해당 회원정보를 담고있는 MemberDTO객체를 반환
	// 전달받은 user객체의 id와 pw를 사용해 로그인 처리, 로그인이 성공하면 
	// user에 입력받은 id, pw를 가지고있다.(form에서 입력받은 정보)
	// DB에서 정보를 조회하여 일치여부를 확인하고, 일치하는 경우 회원의 정보를 MemberDTO 객체(login)에 담아 반환
	public MemberDTO login(MemberDTO user) {
		MemberDTO login = null;
		String sql = "select * from member where userid=? and userpw=? ";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user.getUserid());
			pstmt.setString(2, user.getUserpw());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				login = new MemberDTO();
				login.setIdx(rs.getInt("idx"));
				login.setUserid(rs.getString("userid"));
				login.setUserpw(rs.getString("userpw"));
				login.setUsername(rs.getString("username"));
				login.setEmail(rs.getString("email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close();}
		return login;
	}
	
	

}
