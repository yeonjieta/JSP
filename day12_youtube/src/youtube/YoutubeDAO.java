package youtube;

import java.sql.*;
import java.util.*;

import javax.sql.*;
import javax.naming.*;

public class YoutubeDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	public static YoutubeDAO instance = new YoutubeDAO();
	
	public static YoutubeDAO getInstance() {
		return instance;
	}
	
	public YoutubeDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try { if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
		
		} catch(Exception e) {}	
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
	
	private YoutubeDTO mapping(ResultSet rs) throws SQLException {
		YoutubeDTO dto = new YoutubeDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setTitle(rs.getString("title"));
		dto.setChannel(rs.getString("channel"));
		dto.setThumbnail(rs.getString("thumbnail"));
		dto.setIframe(rs.getString("iframe"));
		return dto;
	}
	
	// 전체목록 
	public List<YoutubeDTO> selectAll(){
		ArrayList<YoutubeDTO> list = new ArrayList<YoutubeDTO>();
		String sql = "select * from youtube_list";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				YoutubeDTO dto = mapping(rs);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	
	// 최근목록만 불러오기
	public ArrayList<YoutubeDTO> selectList(String recent) {
		ArrayList<YoutubeDTO> list = new ArrayList<YoutubeDTO>();
		if(recent.equals("")) {
			return list;
		}
		
		recent = recent.replace(" ", " ");
		String[] arr = recent.split(",");
		System.out.println(Arrays.toString(arr));
		
		for(int i = 0; i < arr.length; i++) {
			String idx = arr[i];
			list.add(select(Integer.parseInt(idx)));
		}
		return list;
	}
	
	// 단일조회
	public YoutubeDTO select(int idx) {
		YoutubeDTO dto = null;
		String sql = " select * from youtube_list where idx = ?";
		
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
	public int insert(YoutubeDTO dto) {
		String title = dto.getIframe().substring(dto.getIframe().indexOf("title=\""));
		title =  title.replace("title=\"", "");
		title = title.substring(0, title.indexOf("\""));
		dto.setTitle(title);
		
		int row = 0;
		String sql = "insert into youtube_list(title, channel, thumbnail, iframe) values ( ?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, dto.getChannel());
			pstmt.setString(3, dto.getThumbnail());
			pstmt.setString(4, dto.getIframe());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;
	}
	

	}
































