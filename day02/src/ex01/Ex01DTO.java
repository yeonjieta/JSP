package ex01;

// Data Transfer Object
// 자바 빈즈 규약대로 클래스를 작성한다.

// 1) private 멤버 필드
// 2) public getter/setter
// 3) 기본생성자(오버로딩도 가능, 그러나 기본생성자는 반드시 존재해야 한다.)

public class Ex01DTO {
	// 여러 파라미타를 한 번에 캡슐화해주기 위해 
	
	private String name;
	private int age;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	

}
