package phonebook;

public class PhonebookDTO {

//			create table		 phonebook (
//			idx     			     number           default schedule_seq.nextval primary key,
//			name       			 varchar(1000)     not null,
//			pnumber  		     varchar(1000)     not null, 
//			favorites   			 number(1)        default 1 check(favorites in (1, 0)) 
//			);
	
	private int idx;
	private String name;
	private String pnumber;
	private int favorites;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPnumber() {
		return pnumber;
	}
	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}
	public int getFavorites() {
		return favorites;
	}
	public void setFavorites(int favorites) {
		this.favorites = favorites;
	}
	
	
	
	

}
