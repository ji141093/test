<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="../header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<style>
	.outer{
		width:800px;
		height:500px;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		padding:20px;
	}
	.tableArea{
		width:600px;
		height:400px;
		margin-left:auto;
		margin-right:auto;
		border:1px solid white;
	}
	
</style>
<script>
	function updateNoticePage() {
		// get방식
		// 쿼리 스트링
		location.href = "updateNoticeForm.do?no=<c:out value='${notice.no}'/>";
	}
	
	function deleteNotice(){
		location.href = "deleteNotice.do?no=<c:out value='${notice.no}'/>";
	}
</script>
</head>
<body>
	<div class="outer">
		<h2 align="center">공지사항 내용</h2>
		<div class="tableArea">
			<table>
				<tr>
					<th>제목 : </th>
					<td colspan="3"><c:out value='${notice.title}'/></td>
				</tr>
				<tr>
					<th>작성자 : </th>
					<td><c:out value='${notice.writer}'/></td>
					<th>작성일 : </th>
					<td><c:out value='${notice.date}'/></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="3">
						<!-- <div class="titleImageArea" align="center"> -->
							<%-- <img src="resources/upload/<c:out value='${notice.attach }'/>}"/><br> --%>
							<a href="resources/upload/<c:out value='${notice.attach }'/>" target="_blank">파일 미리보기</a>
							<%-- <a href="resources/upload/<c:out value='${notice.attach }'/>" download><button>다운로드</button></a> --%>
							<a href="/firstSpring/resources/upload/<c:out value='${notice.attach }'/>" download><button>다운로드</button></a>
						<!-- </div> -->
					</td>
				</tr>
				<tr>
					<th>내용</th>
				</tr>
				<tr>
					<td colspan="4" style="width:600px;"><c:out value='${notice.content}' escapeXml="false"/></td>
				</tr>
			</table>
			<div align="center">
				<button onclick="noticePage();">목록으로</button>
				<c:if test="${!empty user && user.userid eq 'admin'}">
					<button onclick="updateNoticePage();">수정하기</button>
					<button onclick="deleteNotice();">삭제하기</button>
				</c:if>
			</div>
		</div>
	
	</div>
	
	<c:import url="../footer.jsp"/>
</body>
</html>