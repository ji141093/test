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
<meta charset="UTF-8">
<title>공지사항 작성</title>
<style>
	.outer{
		width:800px;
		height:900px;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		padding:20px;
	}
	#summernote{
		color:black;
	}
	input{
		color:black;
	}
</style>
<script>
	$(function(){
		/* $(document).ready(function() { */
		  $('#summernote').summernote({
			  height: 600,
			  lang: 'ko-KR'
		  });
		/* 	}); */
	});
</script>
</head>
<body>
	<div class="outer">
		<h2 align="center">공지사항 작성</h2>
		<div class="tableArea" align="center">
			<form method="post" action="writeNotice.do" enctype="multipart/form-data">
				<input type="hidden" name="writer" value="<c:out value='${user.userid}'/>"/>
				<table>
					<tr>
						<th>제목</th>
						<td colspan="3"><input type="text" name="title" size="33"/></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="3"><input type="file" name="file"/></td>
					</tr>
					<tr>
						<th>내용</th>
					</tr>
					<tr>
						<td colspan="4">
							<textarea id="summernote" name="content"></textarea>
						</td>
					</tr>
				</table>
				<div align="center">
					<input type="submit" value="작성하기"/>
					<input type="button" value="취소" onclick="noticePage();"/>
				</div>
			</form>
		</div>
	</div>
	<c:import url="../footer.jsp"/>

</body>
</html>