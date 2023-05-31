<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="snack.SnackDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<style>
	#root{
			display : flex;
			flex-flow:wrap;
			width: 700px;
			margin: 20px auto;
			border: 2px solid black;
	}
	.item{
			box-sizing: border-box;
			width:150px;
			margin: 10px;
			padding : 10px;
			cursor: pointer;
			
			display: flex;
			flex-direction : column;
			jutify-content : center;
			
			text-align : center;
	}
	.item:hover {
		background-color: #eee;
	}
	.image > img {
			width: 100px;
	}
	#menu{
			width: 700px;
			margin: 20px auto;
			display: flex;
			justify-content: space-between;
			align-items:center;
	
	}
</style>
</head>
<body>

<h1>상품관리(대문페이지)</h1>
<hr>
<% 
		List<SnackDTO> list = null;
		Object tmp = application.getAttribute("list");  // application이 젤 크니까
		// application객체에서 list라는 이름의 속성(attribute) 값을 가져와서 tmp라는 변수에 저장.
		
		if(tmp != null){	// 이미 사용중인 리스트가 있으면 기존 리스트를 불러와서 list에 저장한다.
			list = (List<SnackDTO>) tmp;
		// tmp에 저장된 값을 List<SnackDTO>타입으로 형변환하여 list변수에 할당
		}
		else {  // 기존 사용중인 리스트가 없으면 새로 만들고 더미 데이터를 추가한다.
			list = new ArrayList<SnackDTO>();
			list.add(new SnackDTO("감자칩", 1400, "감자칩.jpg"));   // 생성자에다가 추가
			list.add(new SnackDTO("빈츠", 2000, "빈츠.jpg"));
			list.add(new SnackDTO("수미칩", 1200, "수미칩.jpg"));
			list.add(new SnackDTO("카스타드", 3000, "카스타드.jpg"));
			list.add(new SnackDTO("팝콘", 1800, "팝콘.jpg"));
			application.setAttribute("list", list);
			// 새로 만든 리스트를 application에 등록한다.
		}
%>

<div id="menu">
		<!-- 왼쪽  -->
		<div>
				<form>
					<p>
						<input type="search" name="search" placeholder="검색">
						<input type="submit"  value="검색">
					</p>
				</form>
		</div>
		
		<!-- 오른쪽 -->
		<div></div>
		<div>
			<a href="add.jsp"><button>추가</button></a>
		</div>
</div>

<div id="root">
	<% for(SnackDTO dto : list) { %>
	<div class="item">6
		<div class="image"><img src="img/<%=dto.getImage() %>"></div>
		<div class="name"><%=dto.getName() %></div>
		<div class="price"><%=String.format("%,d", dto.getPrice()) %>원</div>
		</div>
		<% } %>
</div>
<div id="contextMenu" style="background-color: skyblue;
											 position : absolute;
											 display: none;
											 width : 120px;
											 margin : 20px; 
											 padding:10px;
											 text-align: center;" >
	<a href="delete.jsp"><button>삭제</button></a>
</div>

<script>
	const itemList = document.querySelectorAll('div.item')
	const contextMenu = document.getElementById('contextMenu')
	
	const contextMenuHandler = function(event){  // 우클릭 이벤트
		event.preventDefault()	// 기본작동을 막는다(원래 뜨는 브라우저 메뉴 막기)
		contextMenu.style.display='block'	// 숨겨뒀던 메뉴를 보여준다.
		contextMenu.style.top = event.clientY + 'px' // 위치를 수정한다.(마우스 클릭 위치)
		contextMenu.style.left = event.clientX + 'px' 
		
		let target = event.target  // 우클릭 대상(div.item or .name or .price or .image)
		while(target.classList.contains('item') == false){ // 대상이 div.item이 아니면
			target = target.parentNode // div.item이 될때까지 상위 노드를 대입한다.
		}
		const name = target.querySelector('div.name').innerText // 상품이름 글자를 문자열 저장
		contextMenu.querySelector('a').href = 'delete.jsp?name=' + name // a태그의 속성에 추가
		}
	
	                                    // 오른쪽으로 클릭하면          함수 발생
	itemList.forEach(item => item.oncontextmenu = contextMenuHandler)
	document.body.onclick = () => contextMenu.style.display = 'none'
</script>

</body>
</html>