package ex03;

import java.sql.*;
import java.util.*;
import java.util.ArrayList;

import javax.sql.*;
import javax.naming.*;

public class MemberDAO {
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}

	
	private MemberDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
														// 고정 접두사(환경요소로 미리 설정돼있는거) 
			// java:comp/env/jdbc/oracle 를 불러와서
		} catch(NamingException e) {
			System.err.println("DAO 생성자 예외 발생 : " + e);
//			e.printStackTrace();
		}
	}
	
	// 전체목록 불러오기
	public List<MemberDTO> selectAll(){
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		String sql ="select * from member1 order by idx";
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setAge(rs.getInt("age"));
				dto.setBirth(rs.getInt("birth"));
				dto.setEmail(rs.getString("email"));
				dto.setGender(rs.getString("gender"));
				dto.setIdx(rs.getInt("idx"));
				dto.setUserid(rs.getString("userid"));
				dto.setUsername(rs.getString("username"));
				dto.setUserpw(rs.getString("userpw"));
				list.add(dto);
			} 
		}catch(SQLException e) {
				e.printStackTrace();
		} finally {
				try { if (rs != null) rs.close(); }  catch (Exception e) {}
				try { if (stmt != null) stmt.close(); }  catch (Exception e) {}
				try { if (conn != null) conn.close(); }  catch (Exception e) {}
			}
		return list;
	}

}
