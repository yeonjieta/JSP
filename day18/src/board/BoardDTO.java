package board;

import java.sql.Date;

public class BoardDTO {
	
//	create table board (
//		    idx             number              default board_seq.nextval primary key,
//		    title           varchar(100)        not null,
//		    writer          number              not null,
//		    content         varchar(2000)       not null,
//		    fileName        varchar(255),
//		    writeDate       date                default sysdate,
//		    ipaddr          varchar(50)         not null,
//		    userAgent       varchar(500)        not null,
	
	private int idx;
	private String title;
	private int writer;
	private String content;
	private String fileName;
	private Date writeDate;
	private String ipaddr;
	private String userAgent;
	
	private String userid; // member.userid
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
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
