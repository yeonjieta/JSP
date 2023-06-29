<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<main>
<h3>게시판</h3>


<table id = "boardList">
		<thead>
				<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일자</th>
						<th>IP</th>
				</tr>
		</thead>
		
		<tbody>
		<c:set var="list" value="${boardDAO.select(param.column, param.search) }" />
		<c:forEach var="dto" items="${list }">
				<tr>
						<td>${dto.idx }</td>
						<td><a href="${cpath }/board/view.jsp?idx=${dto.idx}">${dto.title }</a>
						<c:if test="${not empty dto.fileName }">
								<span class="fileIcon">💾</span>
						</c:if>
						</td>
<!-- 						?idx=${dto.idx} :  단일조회 할 때 프라이머리 키 쓰기때문에(정확하게 하나의 레코드만 불러 올 수 있다.) -->
						<td>${dto.userid }</td>
						<td>${dto.writeDate }</td>
						<td>${dto.ipaddr }</td>
				</tr>
		</c:forEach>	
		</tbody>
</table>

<div class="flex">
		<div>
				<form>
						<p>
								<select name="column">
										<option ${param.column == 'title' ? 'selected' : ' ' }value="title"> ===제목으로 검색===</option>
										<option ${param.column == 'writer' ? 'selected' : ' ' }value="writer"> ===작성자로 검색===</option>
										<option ${param.column == 'content' ? 'selected' : ' ' }value="content"> ===내용으로 검색===</option>
								</select>
								<input type="search" name="search" 
										   placeholder="검색어를 입력하세요" autocomplete="off"
										   value="${param.search }">
<!-- 										   input type이 파일이면 value를 지정할 수 없다.  -->
								<button>검색</button>
						</p>
				</form>
		</div>
		<div>
				<a href="${cpath }/board/write.jsp"><button>새 글 쓰기</button></a>
		</div>
</div>
</main>

<script>
		const search = '${param.search}'
		
			if(search != ''){
				const table = document.getElementById('boardList')
				const titleList = table.querySelectorAll('tbody > tr > td:nth-child(2) > a')
				const writerList = table.querySelectorAll('tbody > tr > td:nth-child() ')
				
				const arr = []
				
				titleList.forEach(a => arr.push(a))
				writerList.forEach(td => arr.push(td))
				
				arr.forEach(e => {
					let text = e.innerText
					text = text.replace(search, '<span class="search">' + search + '</span>')
					e.innerHTML = text	
				})
				}
		
// 		if(search != ''){
// 			const table = document.getElementById('boardList')
// 			const titleList = table.querySelectorAll('tbody > tr > td:nth-child(2) > a')
// 			console.log(titleList)
			
// 			titleList.forEach(title => {
// 				let text = title.innerText
// 				text = text.replace(search, '<span class="search">' + search + '</span>')
// 				title.innerHTML = text
// 			})
			
// 		}
		
</script>
</body>
</html>