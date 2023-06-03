package ex07;

import java.sql.*;
import java.util.*;

// DAO : Data Access Object, jdbc 기본연결
// 저장된 데이터에 접근하여(데이터베이스에 접근하여)
// 조회, 추가, 수정, 삭제 등을 수행하는 객체
// 각 기능은 함수로 구현한다.
// DB에 접근할 수 있는 JDBC요소가 포함되어야 한다.
// 기계 팔 : 넣을수도 꺼낼수도 있다.

public class StudentDAO {
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
	public StudentDAO() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}
	
	// 접속 확인(데이터베이스 버전 확인)
	public String test() throws SQLException{
		String result = null;
		//v$version" 뷰에서 조회된 결과인 "banner" 열의 값을 저장하기 위한 변수
		
		String sql = "select banner from v$version";
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			result = rs.getString("banner");
		}
		// banner은 Oracle의 v$version 뷰에서 반환되는 컬럼 이름
		rs.close();
		stmt.close();
		conn.close();
		return result;
	}
	
	
	// 검색 목록 불러오기
	public List<StudentDTO>search(String param) throws SQLException{ // 반환하는 selectAll()
		ArrayList<StudentDTO> list = new ArrayList<>();
		// ArrayList 생성 후 list로 반환
		String sql = "select * from student "
					+ "where name like '%%%s%%' "   // 검색어가 앞뒤 상관없이 이름을 포함할 경우 
					+ "order by name";
		
		sql = String.format(sql, param);
		
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		
		// 3번 반복
		while(rs.next()) { //  rs가 next를 호출하지 않으면   getString, getInt 호출 못함
			// 다음행이 있을 경우 true를 반환(모든 행을 순회)
			StudentDTO dto = new StudentDTO(); // 빈통을 만들어주고
			String name = rs.getString("name");
			// rs.getString(columnName)
			// 현재 행에서 지정된 이름의 열 값을 가져온다. 
			// 여기선 name 열 값을 가져오고, String타입으로 반환
			int age = rs.getInt("age");
			String gender = rs.getString("gender");
			dto.setName(name);
			// 가져온 이름을 StudentDTO 객에 설정, 
			// setName은 StudentDTO 클래스에 정의된 메서드로, 해당 필드 값을 설정하는 역할
			dto.setAge(age);
			dto.setGender(gender);
			list.add(dto);
			// StudentDTO 객체를 리스트에 추가
		} // 결과 세트의 모든 행을 순회하면서 'StudentDTO' 객체들이 생성되고 리스트에 추가된다.
		rs.close();
		stmt.close();
		conn.close();
		return list;
	} // 결과 세트에서 각 행을 반복하면서 이름, 나이, 성별 값을 가져노아서
	   // 'StudentDTO'객체를 생성하고 설정한 후, 이를 리스트에 추가하는 과정
	  // 리스트에 저장된 StudentDTO 객체들은 DB에서 조회한 학생 정보를 나타냄 

	
	
}
