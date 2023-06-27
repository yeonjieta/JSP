package diary;

import java.sql.Date;

public class DiaryDTO {
	
//	create table diary (
//			idx		number		default diary_seq.nextval primary key,
//			pic 		varchar2(255)	not null,
//			content		varchar2(2000)	not null,
//			writeDate	date 		default sysdate,
//			ipaddr		varchar2(50)	not null
//		);
	
	private int idx;
	private String pic;
	private String content;
	private Date writeDate;
	private String ipaddr;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
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
	
	

}
