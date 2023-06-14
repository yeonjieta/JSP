package member;

public class MemberDTO {
	
//	create table member(
//		    idx             number              default member_seq.nextval primary key,
//		    userid          varchar(100)        unique,
//		    userpw          varchar(255)        not null,
//		    username        varchar(100),
//		    email           varchar(100)
//		);
	
	private int idx;
	private String userid;
	private String userpw;
	private String username;
	private String email;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
