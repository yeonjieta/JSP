'use strict';

function loginCheck(){
			if(login == ''){
				if(confirm('댓글 작성을 위해 로그인합니다.')){
					textarea.blur()		// blur, focus를 잃는 상황
					location.href = cpath + '/member/login.jsp'
				}
				else {
					textarea.disabled = 'disabled'
					textarea.placeholder = '로그인 한 사용자만 댓글을 작성할 수 있습니다.'
				}
			}
		}
		
function confirmHandler(event){
			event.preventDefault() // 이벤트 대상 요소의 기본 작동을 막는다.(<a href="${cpath }/board/delete.jsp?idx=${dto.idx}">) 이 기능이 방지된다.
			let target = event.target                 // <a href="...">
			while(target.tagName != 'A'){         // 	<button>수정</button>  
				target = target.parentNode			// </a>
			}
			

//			const writer = '${dto.userid}'		// 게시글 작성자의 userid
			const writer = document.querySelector('span.writer').innerText
			const task = target.querySelector('button').innerText // 버튼의 내부글자('수정' / '취소')
			
			if(login != writer){									// 일치하지 않으면
				alert('본인의 게시글만' + task + '할 수 있습니다☠️')	// 경고를 출력한다.
				return						// 이벤트 함수 종료 ( 더이상 진행하지 않는다. )
			}
			
			if(confirm('정말' + task + '하시겠습니까?🥲')){	// 일치하면 삭제여부를 다시 확인하고
				location.href = target.href		// 링크의 주소대로 이동시킨다.
			}
			
		} // end of deleteHandler
						