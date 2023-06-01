package ex03;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class StudentDAO {
	
	// 필드
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	private final String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private final String user = "c##itbank";
	private final String password = "it";
	
	// 생성자 : 클래스의 이름과 동일하고, 반환형을 지정하지 않는 특수한 함수
	public StudentDAO() throws ClassNotFoundException, SQLException { // 기본생성자, 초기 작동, 필드의 초기값 지정
		Class.forName("oracle.jdbc.driver.OracleDriver"); // 메모리를 불러오고
		conn = DriverManager.getConnection(url, user, password); 
	}
	
	// 메서드
	public  ArrayList<StudentDTO> selectAll() throws SQLException{ 	// 모든 학생을 불러온다. 
		ArrayList<StudentDTO> list = new ArrayList<>();
		// 먼저 메서드와 같은 자료형으로 객체를 생성해주고 return을 적어준다. 그러고 중간에 채워넣기 
		
		String sql = "select * from student order by name";
		
		// conn = 생성자에서 이미 처리됨
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {  // 아직 처리하지 않은 다음 row가 있다면
			StudentDTO dto = new StudentDTO(); // 비어있는 객체를 생성해서
			
			String name = rs.getString("name");   // 컬럼이름을 지정하여
			int age = rs.getInt("age");					 // 데이터를 원하는 자료형으로
			String gender = rs.getString("gender");	// 불러온 다음
			
			dto.setName(name); // 비어있는 객체에 값을 채워준다.
			dto.setAge(age);
			dto.setGender(gender);
			// 묶어주는거 
			
			list.add(dto);  // 준비된 객체를 리스트에 추가한다.
		}
		rs.close();
		stmt.close();
		conn.close();
		return list;   // 만들어진 리스트를(jsp에게 ) 반환
		
		
	}

}
