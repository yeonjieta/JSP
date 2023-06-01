package ex01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import oracle.jdbc.OracleDriver;

public class Test1 {
	static String getVersion() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{
		String version = null;
		
		String sql = "select banner from v$version";
		String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
		String user = "c##itbank";
		String password = "it";
		
		Class<?> driverClass = Class.forName("oracle.jdbc.driver.OracleDriver");
		OracleDriver driverInstance = (OracleDriver) driverClass.newInstance();
		// 클래스 정보를 불러와서, 클래스의 기본 생성자를 호출하여 객체를 생성하는 코드
		//여기서는 샘플로만 활용. 이후 jsp model 2에서 실제로 활용한다.
//		Class.forName("oracle.jdbc.driver.OracleDriver");  // jdbc 추가한거 불러와서 , 이 방식으로 접근 안될 땐 driver 지워서 해보기 
		System.out.println(driverInstance);
		
		Connection conn = DriverManager.getConnection(url, user, password); // 뭔가 하나 잘못됐으면 sqlexception 발생
		Statement stmt = conn.createStatement();  // 접속상태가 정상이면 
		ResultSet rs = stmt.executeQuery(sql);	 // 쿼리문 실행
		
		while(rs.next()) {
			version = rs.getString("banner");
		}
		rs.close();
		stmt.close();
		conn.close();
		return version;
	}
	
	public static void main(String[] args) throws Exception{
		String version = getVersion();
		System.out.println(getVersion());
	}

}
