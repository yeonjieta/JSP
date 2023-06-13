package test;

import java.sql.*;
import javax.sql.DataSource;

import oracle.jdbc.datasource.impl.OracleDataSource;

public class DBCP_Sample {
	public static void main(String[] args) throws SQLException {
		
		/* context.xml 에서 DataSource 객체를 준비하는 과정(불러오는 단계)*/
		// 주소를 지정하면 알아서 벤더사에 맞게 찾게끔 만들어져있음  ods = jdbc/oracle
		OracleDataSource ods = new OracleDataSource(); 
		// type="javax.sql.DataSource"
		// name = "jdbc/oracle"
		
		ods.setDriverType("oracle.jdbc.driver.OraleDriver");	
		ods.setURL("jdbc:oracle:thin:@192.168.1.100:1521:xe");
		ods.setUser("c##itbank");			
		ods.setPassword("it");				
		ods.setDatabaseName("jdbc/oracle");
		// xml
		// 미리 이객체는 준비돼있음
		
		// driverClassName=""
		// url = ""
		// username = ""
		// password=""
		
		/*** DAO 클래스에서 initialContext() 를 참조하여 객체를 필드에 불러오는 과정(단계) ***/
		
		DataSource ds = null;  // 슈퍼클래스(인터페이스)로 참조 가능 , OracleDataSource 얘가 서브클래스 , 생성자에서 일어난 일 
		ds = ods;     // ds = init.lookup("jdbc/oracle");
		
		String sql = "select banner from v$version";
		Connection conn = ds.getConnection(); // 커넥션이 여러개 들어있음 
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			System.out.println(rs.getString(1));
		}
		rs.close();
		pstmt.close();
		conn.close();
	}

}
