package date;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class	DateDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	public static DateDAO instance = new DateDAO();
	
	public static DateDAO getInstance() {
		return instance;
	}
	
	private DateDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private DateDTO mapping(ResultSet rs) throws SQLException {
		DateDTO dto = new DateDTO();
		dto.setTitle(rs.getString("title"));
		dto.setSdate(rs.getDate("sdate"));
		dto.setEdate(rs.getDate("edate"));
		dto.setDays(rs.getInt("days"));
		return dto;
	}
	
	// 전체목록
	public List<DateDTO> selectAll(){
		ArrayList<DateDTO> list = new ArrayList<DateDTO>();
		String sql = "select title, sdate, edate, edate - sdate + 1 as days from schedule2 order by sdate";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				DateDTO dto = mapping(rs);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) rs.close();
				if(conn != null) rs.close();
			} catch(Exception e) {}
		}
		
		return list;
	}
	
	
	
	
	

}
