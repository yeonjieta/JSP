package snack;

public class SnackDTO {
	
	//  private 필드(*)
	private String name;   // 상품이름
	private int price;			// 가격
	private String image;	// 이미지 파일 이름
	
	public SnackDTO() {}	// 기본생성자(매개변수를 받지 않고 객체 생성)

	
		// 매개변수 전달받는 생성자(생성자 오버로딩)
		// 객체를 생성 할 때 name, price, image를 인자로 받아 초기화 하는 역할	
	public SnackDTO(String name, int price, String image) {
		this.name = name;
		this.price = price;
		this.image = image;
	}

	// 메서드 (getter/setter) (*)
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


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}
	
	
	
	

}
