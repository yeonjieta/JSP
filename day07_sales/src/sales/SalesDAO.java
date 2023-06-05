package sales;

import java.util.*;

import com.sun.xml.internal.bind.v2.runtime.Name;

import java.sql.*;

public class SalesDAO {
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	private String url="jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user="c##itbank";
	private String password="it";
	
	public SalesDAO() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}
	
	public List<SalesDTO> selectAll() throws SQLException {
		List<SalesDTO> list = new ArrayList<>();
		
		String sql ="select * from sales";
		
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			SalesDTO dto = new SalesDTO();
			dto.setIdx(rs.getString("idx"));
			dto.setName(rs.getString("name"));
			dto.setPrice(rs.getInt("price"));
			dto.setCnt(rs.getInt("cnt"));
			dto.setStatus(rs.getInt("status"));
			list.add(dto);
		}
		
		conn.close();
		stmt.close();
		rs.close();
		
		return list;
	}
	
	public int  insert(SalesDTO dto) throws SQLException {
		int row =0;
		String sql = "insert into sales(name, price, cnt) values('%s', %d, %d) ";
		sql = String.format(sql, dto.getName(), dto.getPrice(), dto.getCnt());
		
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		row = stmt.executeUpdate(sql);
		
		stmt.close();
		conn.close();
	
		return row;
	}
	
	public int changeStatus(String idx) throws SQLException {
		int row = 0;
		String sql = "update sales set status = decode(status, 1, 0, 0, 1) where idx = '%s'";
		sql = String.format(sql, idx);
	
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		row = stmt.executeUpdate(sql);
		
		stmt.close();
		conn.close();
	
		return row;
	}
	

}
