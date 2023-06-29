package reply;

import java.sql.Date;

public class ReplyDTO {
	
//	create table reply (
//		    idx         number          default reply_seq.nextval primary key,
//		    board       number          not null,
//		    writer      number          not null,
//		    content     varchar2(1500)  not null,
//		    writeDate   date            default sysdate,
//		    ipaddr      varchar2(50)    not null,
//		    userAgent   varchar2(500)   not null,
//		);
	
	private int idx;  // 자동으로 들어오고
	private int board;
	private int writer; // session에서 불러오고
	private String content;
	private Date writeDate; //  request해서 꺼내오고 
	private String ipaddr; //  ''
	private String userAgent; // '' 
	
	private String userid;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getBoard() {
		return board;
	}
	public void setBoard(int board) {
		this.board = board;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getIpaddr() {
		return ipaddr;
	}
	public void setIpaddr(String ipaddr) {
		this.ipaddr = ipaddr;
	}
	public String getUserAgent() {
		return userAgent;
	}
	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
	
	

}
