package login;

public class LoginDAO {
	
	public static LoginDAO instance = new LoginDAO();
	
	public static LoginDAO getInstance() {
		return instance;
	}
	
	private LoginDAO() {}
	
	private String[][] arr = {
					{ "test", "admin", "itbank" }, 
					{ "1234", "1", "it" }, 
					{ "테스트", "관리자", "아이티뱅크" }, 
					};
	
	public LoginDTO login(LoginDTO user) {
		LoginDTO dto = null;
		for(int i = 0; i < 3; i++){
			if(arr[0][i].equals(user.getUserid())){
				if(arr[1][i].equals(user.getUserpw())){
					dto = new LoginDTO();
					dto.setUserid(arr[0][i]);
					dto.setUserpw(arr[1][i]);
					dto.setUsername(arr[2][i]);
					break;
				}
			}
		}
		return dto;
	}

}
