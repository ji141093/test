<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="../header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>노티스 리스트</title>
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<style>
	/* .outer{
		border:2px solid black;
		width:800px;
		height:450px;
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
	border-bottom: 2px groove black;
	}
	
	#title{
	display: inline-block; width: 280px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
	}
	
	.noticeBtn{
	float:right;
	  margin-top:-10px; 
	 margin-right:20px;
	 cursor:pointer;
	 
	
	}
	 #write:hover{
	 border-radius: 5px;
	 background:#0d0d26;
		color:white;
		transition:0.5s;
	 }
	 
	 #pageBtn, #pageNumBtn{
	background-color: white;
    color: black;
    border: 2px solid #0d0d26;
    border-radius: 10px;
    outline: none;
    cursor:pointer;
	}
	
	#pageNumBtn{
	font-size: 16px;
	} */
	
	.outer{
		width:800px;
		height:500px;
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
</style>
<script>

$(function(){
	$(".inner td").mouseenter(function(){		
		
		$(this).parent().css("cursor", "pointer");
		$(this).parent().css("background", "white");
		$(this).parent().css("color", "black");
		$(this).parent().css("transition", "0.2s");
	}).mouseleave(function(){
		$(this).parent().css("background", "black");
		$(this).parent().css("color", "white");
		
	}).click(function(){
		var noticeNo = $(this).parent().children().eq(0).text();
		location.href = "noticeDetail.do?no=" + noticeNo/* +"&currentPage=<c:out value='${pi.currentPage }'/>" */;
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
<div class = "outer" align = "center">
	<h2 align = "center">공지사항</h2>
	<div class = "inner" align = "center">
		<table align = "center" style = "table-layout:fixed">
			<tr>
				<th width = "50">번호</th>
				<th width = "100">작성자</th>
				<th width = "300">제목</th>
				<th width = "100">작성일</th>
				<th width = "50">조회수</th>
			</tr>
			<%-- <%if(list.size() ==0){ %> --%>
			<c:if test="${null eq list }">
			<tr>
				<td colspan = "5" align = "center">게시된 공지글이 없습니다</td>
			</tr>
			<%-- <%}else{ %> --%>
			</c:if>
			<c:if test="${null ne list }">
				<%-- <%for(NoticeVo n:list){ %> --%>
				<c:forEach var="n" items="${list }" varStatus="status">
				<tr>
					<td align = "center"><c:out value="${n.no }"/></td>
					<td align = "center"><c:out value="${n.writer }"/></td>
					<td align = "center" id ="title"><c:out value="${n.title }"/></td>
					<td align = "center"><c:out value="${n.date }"/></td>
					<td align = "center"><c:out value="${n.count }"/></td>
				</tr>
				</c:forEach>
				<%-- <%} %> --%>
			<%-- <%} %> --%>
			</c:if>
		</table>
	</div>
	<br>
	
<%-- 	<div class="pageArea" align="center">
			<button onclick="movePage(1);"> << </button>
			<c:forEach begin="${pi.startPage }" end="${pi.endPage }" varStatus="status">
				<c:if test="${status.index eq pi.currentPage }">
					<button disabled><c:out value="${status.index }"/></button>
				</c:if>
				<c:if test="${status.index ne pi.currentPage }">
					<button onclick="movePage(<c:out value='${status.index }'/>);"><c:out value="${status.index }"/></button>
				</c:if>
			</c:forEach>
			<button onclick="movePage(<c:out value='${pi.maxPage }'/>);"> >> </button>
		</div>
		 --%>
		<div style="margin-top:10px;">
			<c:if test="${!empty user && user.userid eq 'admin' }">
				<input type="button" onclick="writeNotice();" value="작성하기"/>
			</c:if>
		</div>
</div>
<script>
function writeNotice(){
	location.href = "writeNoticeForm.do";
}

function movePage(pageNum){
	location.href = "/mwp/noticeList.do?currentPage="+pageNum;
}
</script>

<c:import url="../footer.jsp"/>
</body>
</html>