package phonebook;

import java.sql.*;
import java.util.*;

import javax.sql.*;
import javax.naming.*;

public class PhonebookDAO {
	
	private Connection conn; // 데이터베이스와의 연결을 위한 변수 선언
	private PreparedStatement pstmt; //  SQL 문장을 실행하고 결과를 받아오는데 사용
	private ResultSet rs;  // SQL 쿼리의 실행 결과를 담는 객체

	
	private Context init;
	private DataSource ds;
	
	public static PhonebookDAO instance = new PhonebookDAO();
	// 싱글톤 패턴에서 유일한 인스턴스를 제공하는 역할
	
	public static PhonebookDAO getInstance() {
		return instance;
	}
	//getInstance() 메서드를 통해 외부 코드는 instance 변수에 저장된 인스턴스를 얻을 수 있다.
	
	public PhonebookDAO() {
		try {
			init = new InitialContext();  // JNDI를 사용하여 데이터베이스 연결 정보를 검색하기 위해 초기 컨텍스트를 생성, 이를 통해 이후에 lookup() 메서드를 사용하여 JNDI에서 데이터 소스를 찾을 수 있다
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
			// JNDI(Java Naming and Directory Interface)를 사용하여 컨테이너 환경에서 관리되는 데이터 소스를 검색하는 방법
			// JNDI는 일반적으로 Object타입으로 검색 결과를 반환한다. 그래서 다운캐스팅하여 사용
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try { if(rs != null) 	rs.close();
			  if(pstmt != null) pstmt.close(); 	
			  if(conn != null) 	conn.close(); 	
		}
		catch(Exception e) {}
	}
	
	public String test() {
		String banner = "";
		String sql = "select banner from v$version";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				banner = rs.getString("banner");
			}
		} catch (SQLException e) {
			System.err.println(getClass().getSimpleName() + " : " + e);
		} finally {
			close();
		}
		return banner;
	}
	
	private PhonebookDTO mapping(ResultSet rs) throws SQLException {
		// ResultSet 객체에서 읽어온 데이터를 dto 객체의 각 멤버 변수에 설정하는 작업을 수행
		PhonebookDTO dto = new PhonebookDTO();
		// ResultSet으로부터 읽어온 데이터를 담을 용도로 사용
		dto.setIdx(rs.getInt("idx"));
		// rs에서 "idx"라는 컬럼의 값을 가져와서 PhonebookDTO 객체인 dto의 idx 변수에 설정
		dto.setName(rs.getString("name"));
		dto.setPnumber(rs.getString("pnumber"));
		dto.setFavorites(rs.getInt("favorites"));
		// rs.getString(columnName) - 열(컬럼)의 데이터를 가져온다.
		return dto;
	}
	
	// 전체목록
	public List<PhonebookDTO> selectAll(){
		ArrayList<PhonebookDTO> list = new ArrayList<PhonebookDTO>();
		String sql = "select * from phonebook order by favorites desc, idx";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			// executeQuery() 메서드를 사용하여 SQL 문장을 실행한 후, 
			// 그 결과를 ResultSet 형태로 반환받아 rs 변수에 저장
						
			
			while(rs.next()) {
				PhonebookDTO dto = mapping(rs);
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close();
		}
		return list;
	}
	
	// 단일조회
	public PhonebookDTO selectOne(int idx) {
		PhonebookDTO dto = null;
		String sql ="select * from phonebook where idx = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = mapping(rs);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		} finally {
			close();
		}
		return dto;
	}
	
	// 추가
	public int insert(PhonebookDTO dto) {
		int row = 0;
		String sql = "insert into phonebook(name, pnumber) values (?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPnumber());
			row= pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if (conn != null) rs.close();} catch(Exception e) {}
			try {if (pstmt != null) rs.close();} catch(Exception e) {}
		}
		return row;
	}
	
	// 수정
	public int modify(PhonebookDTO dto) {
		int row = 0;
		String sql ="update phonebook set name=?, pnumber=? where idx = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName() );
			pstmt.setString(2, dto.getPnumber() );
			pstmt.setInt(3, dto.getIdx() );
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if (conn != null) rs.close();} catch(Exception e) {}
			try {if (pstmt != null) rs.close();} catch(Exception e) {}
		}
		return row;
	}
	
	// 삭제
	public int delete(int idx) {
		int row = 0;
		String sql = "delete phonebook where idx = ?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {if (conn != null) rs.close();} catch(Exception e) {}
			try {if (pstmt != null) rs.close();} catch(Exception e) {}
			
		}
		
		return row;
	}
	
	// 즐겨찾기
	public int changefavorites(int idx){
		int row = 0;
		String sql = "update phonebook set favorites = decode(favorites, 1, 0, 0, 1) where idx = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {if (conn != null) rs.close();} catch(Exception e) {}
			try {if (pstmt != null) rs.close();} catch(Exception e) {}
		}
		
		return row;
	}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


