package schedule;

import java.util.*;
import java.sql.*;

public class ScheduleDAO {
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
	public ScheduleDAO() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}
	
	public List<ScheduleDTO> selectAll() throws SQLException {
		List<ScheduleDTO> list = new ArrayList<>();
		
		String sql = "select * from schedule order by sdate";
		
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			ScheduleDTO dto = new ScheduleDTO();
			dto.setIdx(rs.getInt("idx"));
			dto.setTitle(rs.getString("title"));
			dto.setMemo(rs.getString("memo"));
			dto.setSdate(rs.getString("sdate"));
			list.add(dto);
		}
		
		conn.close();
		stmt.close();
		rs.close();
		
		return list;
		
	}
	
	public int insert(ScheduleDTO dto) throws SQLException{
		int row=0;
		String sql = "insert into schedule(title, memo, sdate) values('%s', '%s', '%s')";
		sql = String.format(sql, dto.getTitle(), dto.getMemo(), dto.getSdate());
		
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		row = stmt.executeUpdate(sql);
		
		conn.close();
		stmt.close();
		
		
		return row;
		
	}
	
	public int delete(int idx) throws SQLException {
		int row = 0;
		String sql = "delete schedule where idx=" + idx;

		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		row = stmt.executeUpdate(sql);
		
		conn.close();
		stmt.close();
		
		
		return row;	
	}
			
	

}
