package product;

public class ProductDTO {
	
//		  idx                number           default product_seq.nextval primary key,
//      name            varchar2(100)    not null,
//      price             number           check(price > 0)
	
	
	private int idx;
	private String name;
	private int price;
	
	
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	

}
