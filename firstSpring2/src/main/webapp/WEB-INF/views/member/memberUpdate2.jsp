<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<c:import url="../header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<style>
	.outer{
		width:600px;
		height:500px;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		padding:20px;
		border:1px solid white;
	}
	
	#idCheckBtn, #searchAddressBtn, #joinMainBtn, #joinBtn, #updateBtn, #deleteBtn{
		background:orangered;
		border-radius:5px;
		width:100px;
		height:25px;
		text-align:center;
		cursor:pointer;
	} 
	#joinMainBtn, #updateBtn, #deleteBtn{
		display:inline-block;
	}
	#searchAddressBtn, #updateBtn, #joinMainBtn{
		background:yellowgreen;
	}
</style>
<script>
	function memberJoin(){
		$("#joinForm").submit();		
	}
	
	function validate(){
		if($("#userPwd").val() != $("#userPwd2").val()){
			$("#passChkSpan").text("비밀번호가 일치하지 않습니다.");
			$("#userPwd2").focus();
			return false;
		}
		//다른 값들을 체크 하는 로직 추가(유효성 검사 로직 추가 영역)
		$("#tel").val($("#phone1").val() + "-" + $("#phone2").val() + "-" + $("#phone3").val());
		$("#address").val($("#zipcode").val() + ", " + $("#address1").val() + ", " + $("#address2").val());
		return true;
	}
	
	function openAddressPopup(){
		 new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if(data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
             	$("#zipcode").val(data.zonecode); //5자리 새우편번호 사용
             	$("#address1").val(fullAddr);

                // 커서를 상세주소 필드로 이동한다.
                $("#address2").focus();
            }
        }).open();
	}
	
	function updateMember(){
		$("#updateForm").submit();
	}
	
	function mainPage(){
		location.href="index.do";
	}
	
</script>
</head>
<body>
	<div class="outer">
		<h2 align="center">정보 수정</h2>
<!-- 		<form id="updateForm" method="post" action="/mwp/updateMember.do" --> 
		<form id="updateForm" method="post" action="updateMember.do" 
					onsubmit="return validate();" >
		<input type="hidden" name="phone" id="tel"/>
		<input type="hidden" name="address" id="address"/>
		<table>
			<tr>
				<td width="200px;"><span class="import">*</span>아이디</td>
				<td><input type="text" name="userid" id="userId" required value="${user.userid }" readonly/></td>
				<td width="200px"></td>
			</tr>		
			<tr>
				<td><span class="import">*</span>변경 비밀번호</td>
				<td><input type="password" name="password" id="userPwd" required/></td>
				<td></td>
			</tr>
			<tr>
				<td><span class="import">*</span>변경 비밀번호 확인</td>
				<td><input type="password" name="userPwd2" id="userPwd2" required/></td>
				<td><span id="passChkSpan"></span></td>
			</tr>
			<tr>
				<td><span class="import">*</span>이름</td>
				<td><input type="text" name="username" id="userName" value="${user.username }"/></td>
				<td></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="M" 
						<c:if test="${user.gender eq 'M' }">
							checked
						</c:if>
						> 남성
					<input type="radio" name="gender" value="F" 
						<c:if test="${user.gender eq 'F' }">
							checked
						</c:if>
						> 여성
				</td>
				<td></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" name="age" min="10" max="100" value="${user.age }"/></td>
				<td></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email" value="${user.email }"/></td>
				<td></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
					<input type="text" name="phone1" id="phone1" size="2"/>-
					<input type="text" name="phone2" id="phone2" size="2"/>-
					<input type="text" name="phone3" id="phone3" size="2"/>
				</td>
				<td></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><input type="text" name="zipcode" id="zipcode"/></td>
				<td><div id="searchAddressBtn" onclick="openAddressPopup();">주소 검색</div></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address1" id="address1"/></td>
				<td></td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td><input type="text" name="address2" id="address2"/></td>
				<td></td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
					<input type="checkbox" id="game" name="hobby" value="게임"/>
					<label for="game">게임</label>
					<input type="checkbox" id="climbing" name="hobby" value="등산"/>
					<label for="climbing">등산</label>
					<input type="checkbox" id="sing" name="hobby" value="노래"/>
					<label for="sing">노래</label>
					<input type="checkbox" id="board" name="hobby" value="보드"/>
					<label for="board">보드</label>
					<input type="checkbox" id="read" name="hobby" value="독서"/>
					<label for="read">독서</label>
					<input type="checkbox" id="etc" name="hobby" value="기타"/>
					<label for="etc">기타</label>
				</td>
				<td></td>
			</tr>
		</table>
		<br>
		<div class="btns" align="center">
			<div id="joinMainBtn" onclick="mainPage();">메인으로</div>		
			<div id="updateBtn" onclick="updateMember();">회원 수정</div>		
			<div id="deleteBtn" onclick="deleteMember();">회원 탈퇴</div>			
		</div>
		</form>
	</div>
	<script>
		$(function(){
			$("input:radio").each(function(){
				if($(this).val() == '${user.gender}') {
					$(this).prop("checked", true);
				}
			});
			
			var phones = '${user.phone}'.split('-');
			$("input[id*=phone]").each(function(index){
				$(this).val(phones[index]);
			});
			
			var addrArr = '${user.address}'.split(', ');
			$("#zipcode").val(addrArr[0]);
			$("#address1").val(addrArr[1]);
			$("#address2").val(addrArr[2]);
			
			var hobbies = '${user.hobby}'.split(',');
			$("input:checkbox").each(function(index){
				if(-1 < $.inArray($(this).val(), hobbies)) {
					$(this).prop("checked", true);
				}
			});
		});
		
		function deleteMember(){
			location.href = "deleteMember.do";
		}
	</script>
	<c:import url="../footer.jsp"/>
</body>
</html>










