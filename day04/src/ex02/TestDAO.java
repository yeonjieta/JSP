package ex02;

import java.sql.*;

public class TestDAO {
	
	// 필드
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	private final String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private final String user = "c##itbank";
	private final String password = "it";
	// 바뀌는 값이 아니니까 final을 사용해서 데이터사용효율을 줄여준다.
	
	// 생성자 : 클래스 로딩과 데이터베이스 연결을 수행하여 초기화 작업을 수행하는 역할
	public TestDAO() throws ClassNotFoundException, SQLException { // 기본생성자, 초기 작동, 필드의 초기값 지정
		Class.forName("oracle.jdbc.driver.OracleDriver"); // 메모리를 불러오고
		conn = DriverManager.getConnection(url, user, password); 
		// SQLException : 데이터베이스 서버와의 연결에 실패하거나, 데이터베이스 URL 또는 사용자 정보가 잘못된 경우
	}
	// 기본생성자를 통해 연결을 준비
	
	// 메서드
	public String getVersion() throws SQLException{
		String version = null;
		String sql = "select banner from v$version";
		
		stmt = conn.createStatement();  // stmt가 정상일 때 쿼리문을 실행 
		rs = stmt.executeQuery(sql);
		
		// sql문을 불러오고
		
		while(rs.next()) {
			version = rs.getString("banner"); 
		} // 결과에서 배너를 꺼내서 저장, 배너를 컬럼이라고 생각하면 된다.
		
		rs.close();
		stmt.close();
//		conn.close();
		return version;
		// version을 반환해서 jsp에서 출력 
	}
	
	public void close() throws SQLException{
		conn.close();
	}
	// 다 썼으면 close 해라
	// 함수를 여러개 만들어놓고 원하는걸 불러오기만 하면됨 
	// 원하는 쿼리문 쓸 수 있나, 자바에서 클래스에 포함된 메서드 즉 함수 형태로 만들어 내야함
	
	
	

}
