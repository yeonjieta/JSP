// 가입과 로그인 
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
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
		}
	}
	
	public MemberDTO mapping(ResultSet rs) throws SQLException {
		MemberDTO login = new MemberDTO();
		login.setUserid(rs.getString("userid"));
		login.setEmail(rs.getString("email"));
		login.setIdx(rs.getInt("idx"));
		login.setUsername(rs.getString("username"));
		login.setUserpw(rs.getString("userpw"));
		
		return login;
	}
	
	// 가입 
	public int insert(MemberDTO dto) {
		int row = 0;
		String sql = "insert into member(userid, userpw, username, email) values (?, ?, ?, ?) ";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpw());
			pstmt.setString(3, dto.getUserpw());
			pstmt.setString(4, dto.getEmail());
			row=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close();}
		return row;
	}
	
	// 로그인
	public MemberDTO login(MemberDTO user) {
		MemberDTO login = null;
		String sql = "select * from member whrer userid=? and userpw=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserid());
			pstmt.setString(2, user.getUserpw());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				login = mapping(rs);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return login;
	}
	
	

}
