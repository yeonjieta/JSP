package product;

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

public class ProductDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	public static ProductDAO instance = new ProductDAO();
	
	public static ProductDAO getInstance() {
		return instance;
	}
	
	private ProductDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if ( rs != null) rs.close();
			if ( pstmt != null) pstmt.close();
			if ( conn != null) conn.close();
		}
		catch(Exception e) {}
	}
	
	// 목록
	public List<ProductDTO> selectAll() {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from prodcut";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		}finally {
			close();
		}
		
		
		return list;
	}
	
	// 추가
	public int insert(ProductDTO dto) {
		int row = 0;
		String sql = "insert into product (name, price) values(?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getPrice());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		return row;
	}
	
	

}
