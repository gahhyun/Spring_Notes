<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2>CommentTest</h2>
    <button id="sendBtn">SEND</button>
	<div id="commentList"></div>
	
	
	<script type="text/javascript">
	
		let bno = 338
		
		  $(document).ready(function() {
			$("#sendBtn").click(function() {
				showList(bno)
			})
			
		})
		
		let showList = function(bno) {
			
			$.ajax({
				type:'GET', 								//요청 메서드
				url : '/korea/comments?bno='+bno,			//요청 uri
				success: function(result) {
					$("#commentList").html(toHtml(result))			//result는 서버가 전송한 데이터
				},
				error: function() {alert("error")}
			})	
		}
	

		
					let toHtml = function(comments) {
				let tmp = "<ul>"
				
				comments.forEach(function(comment) {
					tmp += '<li data-cno=' + comment.cno
					tmp += ' data-pcno=' + comment.pcno
					tmp += ' data-bno=' + comment.bno +'>'
					tmp += ' comment=<span class="comment">' + comment.commnet + '</span>'
					tmp += ' commenter=<span class="commenter">' + comment.commneters + '</span>'
					
					
					tmp += '</li>'
				})
				
				
				return tmp + "</ul>"
			}
		
	</script>
	
	
</body>
</html>