package diary;

// request를 전달받아서, 파일 업로드를 수행하고, DTO로 구성하여 반환하기
// 파일업로드를 수행하기 위해서는 MultipartRequest가 필요하다.
// MultipartRequest의 생성자에는 5개의 매개변수를 전달한다.
// request, saveDirectory, maxPostSize, encoding, policy


import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileUtil {
	
	private static FileUtil instance;
	
	private final String saveDirectory;
	private final int maxPostSize = 20 * 1024 * 1024;
	private final String encoding = "UTF-8";
	private final FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	public FileUtil(HttpServletRequest request) {
//		HttpSession session = request.getSession();  - 불필요한과정, 자료형 한 번 보라고 씀
		ServletContext application = request.getServletContext();
		saveDirectory = application.getRealPath("image");  // 현재위치 안에 있는 imgae폴더, 주소를 알려주는 것 (파일을  만들어주는건 아님), 그래서 밑에 파일 없을 경우 만들어라 있음
	}
	public static FileUtil getInstance(HttpServletRequest request) { // 외부에서 꺼내 쓸 수 있게 , 정의된 모양이랑 호출하는 모양이 같아야함(header)
		if(instance == null) {
			instance = new FileUtil(request); 
		}
		return instance;
	}
	
	public DiaryDTO getDiaryDTO(HttpServletRequest request) throws IOException {
		DiaryDTO dto = null;
		
		File dir = new File(saveDirectory);
		if(dir.exists() == false) {
			dir.mkdirs();
		}
		
		// 파일 업로드 완료
		MultipartRequest req = new MultipartRequest(
				request, saveDirectory, maxPostSize, encoding, policy
		);
		
		// content, pic, ipaddr 
		String content = req.getParameter("content");
		File pic = req.getFile("pic");
		dto = new DiaryDTO();
		dto.setContent(content);
		dto.setPic(pic.getName());
		dto.setIpaddr(request.getRemoteAddr());
//		addr : ip 주소
//		host : domain 주소
	
		
		return dto;
		
	}
	

}
