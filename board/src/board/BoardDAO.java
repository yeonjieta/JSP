package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	public static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private BoardDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public List<BoardDTO> select(){
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
	
//		String sql = "	select m.userid, b.* from board b" + "	join member m" + "	on m.idx = b.writer";
//
//		String like = "	and %s like '%%' || ? || '%%' ";
//		column = column.equals("writer") ? "m.userid" : "b." + column;
//		like = String.format(like, column);
//
//		String order = "	order by b.idx desc";
//		boolean flag = "".equals(column) == false && "".equals(search) == false;
//
//		sql += flag ? like + order : order;
//		System.out.println(flag + "," + sql);
		return list;
	}

}
