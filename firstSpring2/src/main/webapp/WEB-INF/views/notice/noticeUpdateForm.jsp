<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="../header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<script src="resources/js/summernote-ko-KR.js"></script>
<meta content="text/html; charset=UTF-8">
<title>수정하기정보조회</title>
<style>
/* 	.outer{
		border:2px solid black;
		width:800px;
		height:420px;
		margin-left:auto;
		margin-right:auto;
		border-radius: 5px;
		
	}
	.inner{
	margin-left:auto;
	margin-right:auto;
	border:1px solid white;
	width:700px;
	height:300px;
	}
	
	#textarea{
	resize:none;
	}
	
	#btn1, #btn2{
	display: inline-block;
	}
	
	#btn1:hover, #btn2:hover{
	border-radius: 5px;
	 background:#0d0d26;
		color:white;
		transition:0.5s;
		cursor:pointer;
	} */
	
	.outer{
		width:800px;
		height:900px;
		background:black;
		color:white;
		padding:10px;
		margin-top:-110px;
		margin-left:auto;
		margin-right:auto;
		/*border:1px solid white;*/
	}
	.tableArea{
		width:800px;
		height:300px;
		margin-left:auto;
		margin-right:auto;
	}
	table td{
		text-align:center;
	}
	.searchArea{
		width:650px;
		margin-left:auto;
		margin-right:auto;
	}
	a{
		/*text-decoration:none;*/
		color:white;
	}
	
	#btn1, #btn2, , #btn3{
		color:white;
		display:inline-block;
	}
	
	#btn1:hover, #btn2:hover, #btn3:hover{
		background:white;
		color:black;
		cursor:pointer;
		border-radius:5px;
	}
	#summernote{
		color:black;
	}
	input{
		color:black;
	}
	
</style>
<script>
	function returnNoticeList(){
		
		location.href = "noticeList.do?currentPage=<c:out value='${param.currentPage }'/>";
	}
	
	function rewriteOk(){
		$("#rewriteNotice").submit();
	}
	
	function deleteNotice(){
		$("#noticeForm").attr("action", "deleteNotice.do");
		$("#noticeForm").submit();
	}
		
	$(function(){
		  $('#summernote').summernote({
			  height: 600
		  });
	});
</script>
</head>
<body>

<br>
<br>
<br>
<br>
<br>
<div class = "outer">
<h3 align = "center">공지사항 수정</h3>
	<div class = "inner" align = "center">
	<br>
		<form id = "rewriteNotice" method = "post" action = "updateNotice.do"  enctype="multipart/form-data">
			<input type = "hidden" name = "writer" value = "<c:out value='${user.userid }'/>"/>
			<%-- <input type = "hidden" name = "currentPage" value = "<c:out value='${param.currentPage }'/>"/> --%>
			<input type = "hidden" name = "no" value = "<c:out value='${notice.no }'/>"/>
			<input type = "hidden" name = "attach" value = "<c:out value='${notice.attach }'/>"/>
			
				<table>
				<tr>
					<th>제목</th>
					<td colspan = "3"><input type = "text" name = "title" size = "50" value = "<c:out value='${notice.title }'/>"/><td>				
				</tr>
				<c:if test="${!empty notice.attach }">
					<tr>
						<th>첨부파일</th>
						<td colspan="3">
								<a href="resources/upload/<c:out value='${notice.attach }'/>" target="_blank"><c:out value='${notice.attach }'/></a>
								<a href="/firstSpring/resources/upload/<c:out value='${notice.attach }'/>" download><button>다운로드</button></a>
						</td>
					</tr>
				</c:if>
				<tr>
					<th>변경파일</th>
					<td colspan="3"><input type="file" name="addedFile"/></td>
				</tr>
				<tr>
					<td colspan = "4">
						<textarea name = "content" id="summernote"><c:out value='${notice.content }' escapeXml="false"/></textarea>
					</td>
				</tr>
			</table>
			<br>
			<div align = "center" id = "writeBtn">
				<div id = "btn1" onclick = "rewriteOk();">작성완료</div>&emsp;
				<div id = "btn2" onclick = "returnNoticeList();">돌아가기</div>
				<div id = "btn3" onclick = "deleteNotice();">삭제하기</div>
				
			</div>
			</form>
	</div>
</div>
<c:import url="../footer.jsp"/>
</body>
</html>