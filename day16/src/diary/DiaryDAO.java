package diary;

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


public class DiaryDAO {
	
	private Connection conn; // DB연결(DriveManager.getConnection(url, user, password)) - context.xml에 다 들어가 있음
	private PreparedStatement pstmt; // 연결 상태가 정상이라면 쿼리문을 전달하여 실행하기 위한 객체
	private ResultSet rs;		// 쿼리가 select인 경우, 결과셋을 저장하기 위한 객체
	
	private Context init;  // context.xml에 정의된 객체를 담고 있는 객체 컨테이너
	private DataSource ds;	  // 여러 connection 객체를 가지고 있는 DataSource
	
	// 필드
	public static DiaryDAO instance = new DiaryDAO(); 
	// 생성자에 별도의 매개변수가 없어서 바로 만들어도 된다.
	// 필드를 밑에 내려도 상관없음. 배치 순서는 상관없음
	
	// 메서드
	public static DiaryDAO getInstance() {
		return instance;
	}
	
	// 생성자 
	private DiaryDAO() {
		try {
			init = new InitialContext(); // 프로젝트 초기 작동에 정의된 컨텍스트를 받아오는 것 
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		catch(Exception e) {}
	}
	
	// 전체목록
	public List<DiaryDTO> selectAll(){
		ArrayList<DiaryDTO> list = new ArrayList<DiaryDTO>();
		String sql = "select * from diary order by idx";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				DiaryDTO dto = new DiaryDTO();
				dto.setIdx(rs.getInt("idx"));
				// rs에서 현재행의 "idx"의 컬럼 값을 가져와 
				dto.setPic(rs.getString("pic"));
				dto.setContent(rs.getString("content"));
				dto.setWriteDate(rs.getDate("writeDate"));
				dto.setIpaddr(rs.getString("ipaddr"));
				list.add(dto);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	
	// 추가 
	public int insert(DiaryDTO dto) { // int를 반환하는 insert 함수는 DiaryDTO dto를 전달 받는다.
		int row = 0;
		String sql = "insert into diary(pic, content, ipaddr) values (?, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPic());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getIpaddr());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return row;
		
	}
	
	// 삭제
	public int delete(int idx) {
		int row = 0;
		String sql = "delete diary where idx = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;
	}
}
