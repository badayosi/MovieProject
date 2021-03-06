<%@page import="movie.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<title>Insert title here</title>
<%
	User user= (User)request.getAttribute("item");
	String phone = user.getPhone();
	String phone1 = phone.substring(0, 2);
	String phone2 = phone.substring(4, 8);	
	String phone3 = phone.substring(9);
	
	
	String gender = user.getGender();
%>
<style>
@import url("/MovieProject/css/common.css");
#joinForm {
	width: 1024px;
	min-height: 600px;
	margin: 0 auto;
}

#joinForm h2 {
	margin-bottom: 20px;
	border-bottom: 3px solid black;
}

#jF {
	position: relative;
}

#joinForm #jF p {
	margin-bottom: 20px;
	padding: 10px;
	border-bottom: 1px solid #ccc;
}

#joinForm #jF p label {
	width: 150px;
	display: inline-block;
	font-size: 20px;
	line-height: 20px;
	color: #ccc;
}

#joinForm #jF p input,select {
	width: 300px;
	height: 40px;
	font-size: 20px;
	border: 2px solid #ccc;
}
.radioBtn {
	width: 25px !important;
	position: absolute;
}

#radioP {
	position: relative;
}

#radioP span {
	font-size: 20px;
	position: absolute;
}

#span1 {
	top: 5px;
	left: 200px;
}

#span2 {
	top: 5px;
	left: 290px;
}

#radio1 {
	top: 0px;
	left: 160px;
}

#radio2 {
	top: 0px;
	left: 250px;
}

#checkId {
	width: 80px !important;
	height: 50px !important;
	font-size: 14px !important;
	background: #333333;
	color: #fff;
	border-radius: 5px;
}

#telSelect {
	width: 80px;
	height: 44px;
	font-size: 20px;
	border: 2px solid black;
}

input:FOCUS {
	outline: none;
}

.telinput {
	width: 102px !important;
}

#addrSearchBtn {
	width: 100px !important;
	height: 49px !important;
	background: #333333;
	color: #fff;
	border-radius: 5px;
	margin-right:8px !important;
	font-size: 13px !important;
}

#zipcode {
	width: 100px !important;
	height: 40px !important;
}

#addr {
	width: 350px !important;
	height: 40px !important;
}

#searchWarp {
	position: absolute;
	top: 180px;
	left: 200px;
	width: 600px;
	height: 400px;
	border: 2px solid #333333;
	z-index: 9999;
	background: #fff;
	display: none;
	overflow-y: none;
}

#searchWarp>p {
	margin-left: 5px;
	margin-top: 5px;
	text-align: right;
}

#searchWarp #doro{
	width: 150px !important;
	height: 35px !important;
	font-size: 14px !important;
}

#searchWarp #doroSearchWrap , #searchWarp #search_cencel {
	width: 70px !important;
	height: 35px !important;
	font-size: 14px !important;
	background: #333333;
	color: #FFF;
}

#searchWarp .searchResult {
	width: 90%;
	margin: 0 auto;
	border-top: 2px solid black;
	overflow: hidden;
}

#searchWarp .searchResult .seacrch_zipcode, #searchWarp .searchResult .seacrch_addr
	{
	float:left;
	font-size: 15px;
	border: none;
	line-height: 35px;
	height: 35px;
	margin-bottom: 8px !important;
}

#searchWarp .searchResult .seacrch_zipcode {
	width: 20%;
	text-align: center;
	margin-right:10px !important;
	border-right: 1px solid #ccc;
}

#searchWarp .searchResult .seacrch_addr {
	text-align: right;
	width: 70%;
	border-right: 1px solid #ccc;
}

#hiddenbg {
	background: rgba(0, 0, 0, 0.65);
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 9998;
	display: none;
}

#resultAddrWrap {
	width: 100%;
	height: 300px;
	overflow-y: scroll;
}
#id_check,#pw_check,#pwch_check,#name_check{
	font-weight: bold;
}
::placeholder { 
    color: #ccc;
    opacity: 1;
    font-size:14px;
}
#gender_check{
	position: absolute;
	
}
#radioCheckImg{
	position: absolute;
	top: 0px;
	left: 330px;
	
}
#joinBtn,#cencelBtn{
	width:100px !important;
	height: 40px !important;
	background: #333333;
	color: #FFF;
	font-size:14px !important;
}
#btnWrap{
	text-align: center;
	margin:0;
}
#postWrap{
	margin-bottom: 0 !important;
}

#successWrap{
		width:60%;
		overflow: hidden;
		margin-top:150px;
	}
	#successWrap #successWrap_imgWrap{
		float:left;
	}
	#successWrap #successWrap_textWrap{
		float:left;
		margin-top:20px;
		
	}
	#successWrap #successWrap_textWrap #bluetext{
		color:#157efb;
	}
	#successWrap #successWrap_textWrap h2{
		border:none !important;
	}
	#successWrap #successWrap_textWrap .loginBtn{
		background: #333333;
		color:#fff;
		width:100px;
		height: 40px;
		font-size:14px;
	}
.checkimg{
}
#radioCheckImg{
	display: inline-block;
}
#addrUser{
	margin-left:258px;
	width:461px !important
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		var zipcode = $("#userAddr").val().substring(1,6);
		var userAddr = $("#userAddr").val().substring(7,$("#userAddr").val().indexOf("/"));
		var addrUser = $("#userAddr").val().substring($("#userAddr").val().indexOf("/")+1,$("#userAddr").val().length);
		$("#zipcode").val(zipcode);
		$("#addr").val(userAddr);
		$("#addrUser").val(addrUser);
		if("여자"=="<%=gender%>"){
			$("#radio1").attr("checked","checked");	
		}else if("남자"=="<%=gender%>"){
			$("#radio2").attr("checked","checked");	
		}
		$("#joinForm #jF p").each(function(i, obj) {
			$(obj).hover(function() {
				$(this).find("label").css("color", "black");
				$(this).find("input").css("border-color", "black");
			}, function() {
				$(this).find("label").css("color", "#cccccc");
				$(this).find("input").css("border-color", "#cccccc");
			})
		})
		$("input").each(
				function(i, obj) {
					$(this).focus(
							function() {

								$(this).closest("p").find("label").css("color",
										"black");
								$(this).closest("p").find("input").css(
										"border-color", "black");

							})
					$(this).blur(
							function() {

								$(this).closest("p").find("label").css("color",
										"#cccccc");
								$(this).closest("p").find("input").css(
										"border-color", "#cccccc");
					})
				})
		$("#addrSearchBtn").click(function(){
			$("#hiddenbg").css("display","block");
			$("#searchWarp").css("display","block");
			$("#resultAddrWrap div").not("#zxc").remove();
		})
		 $("#searchWarp #search_cencel").click(function(){
			$("#hiddenbg").css("display","none");
			$("#searchWarp").css("display","none");
			$("#doro").val("");
		 })
		$("#doroSearchWrap").click(function(){
			 searchDoro();
		 })
		$("#doro").keydown(function(e){
			if(e.keyCode==13){
				searchDoro();
				e.preventDefault();
				
			}
		})
		$(document).on("mouseover",".hoverResult",function(){
			$(this).css("background","#D7FFF1")
		})
		$(document).on("click",".hoverResult",function(){
			$("#zipcode").val($(this).find(".seacrch_zipcode").text());
			$("#addr").val($(this).find(".seacrch_addr").text());
			$("#hiddenbg").css("display","none");
			$("#searchWarp").css("display","none");
			$("#doro").val("");
		})
		$(document).on("mouseout",".hoverResult",function(){
			$(this).css("background","none");
		})
		$("#cencelBtn").click(function(){
			location.href="userList.do";
		})
		
		
		$("#jF").submit(function(){	
			var ex = 0;
			$("#jF>p input[type='text']").each(function(i, obj) {
				if($(this).val() ==""){
					ex = 1;
				}
			})
			if(ex == 1){
				alert("공백을 입력해주세요");
				return false;
			}
		})
	})
function searchDoro(){
		var doro = $("#doro").val();
		 if(doro ==""){
			 alert("도로명을 입력해주세요");
			 return false;
		 }
		 $("#resultAddrWrap div").not("#zxc").remove();
		 
		 $.ajax({
				url:"joinaddr.do",
				type:"get",
				data:{"doro":doro},
				dataType:"json",
				success:function(json){
					console.log(json)
					if(json.length==0){
						var div = "<div class='searchResult hoverResult'>";
						var zipcode = "<p class='seacrch_zipcode'></p>";
						var addr ="<p class='seacrch_addr'>검색 결과가 없습니다.</p>";
						div += zipcode+addr +"</div>";
						$("#resultAddrWrap").append(div);
						return;
					}
					for(var i=0; i<json.length; i++){
						var div = "<div class='searchResult hoverResult'>";
						var zipcode = "<p class='seacrch_zipcode'>"+json[i].addrNo+"</p>";
						var addr ="<p class='seacrch_addr'>"+json[i].sido+" "+json[i].sigungu+" "+json[i].doro
								+" "+json[i].building1+json[i].building2+"</p>";
						div += zipcode + addr +"</div>";
						$("#resultAddrWrap").append(div);
					}
				}
				
		})
		
		
}
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<input type="hidden" value="${item.addr }" id="userAddr">
	<div id="hiddenbg"></div>
	<div id="joinForm">
		<h2 id="h2text">회원정보수정</h2>
		<div id="joininputFrom">
			<form action="userUpdate.do" method="post" id="jF">
				<p>
					<label>아이디</label> 
					<input type="text" name="id" id="userId" value="${item.userId }" readonly="readonly"> 
				</p>
				
				<p>
					<label>이름</label>
					<input type="text" name="name" id="userName" onkeyup="this.value=this.value.replace(/[^가-힣]/g,'');" value="${item.name }"  readonly="readonly">
					
				</p>
				<p>
					<label>이메일주소</label> 
					<input type="email" name="email" id="userEmail" value="${item.email }">
				</p>
				<p>
					<label>휴대폰 번호</label> <select name="tel1" id="telSelect" value="<%=phone1%>">
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
					</select>
					<input type="tel" name="tel2" class="telinput" id="userTel" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="<%=phone2%>"> 
					
					<input type="tel" name="tel3" class="telinput" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"value="<%=phone3%>">
						
						
				</p>
				<p>
					<label>포인트</label> 
					<input type="text" name="point" id="point" value="${item.point }"> 
				</p>
				<p>
					<label>등급</label> 
					
					<select name="userRank" id="userRank" value="${item.userRank}" >
						<option value="관리자">관리자</option>
						<option value="일반등급">일반등급</option>
						<option value="탈퇴회원">탈퇴회원</option>
					</select>
					
				</p>
				<p id="radioP">
					<label>성별</label> 
						<input type="radio" name="gender" value="여자"	class="radioBtn" id="radio1">
						<span id="span1">여자</span> 
						<input	type="radio" name="gender" value="남자" class="radioBtn" id="radio2">
						<span id="span2">남자</span>
						
				</p>
	
				<p id="postWrap">
					<label>주소</label><input type="button"
						value="우편번호 검색" id="addrSearchBtn"><input type="tel"
						name="zipcode" id="zipcode"> <input type="text" name="addr"
						id="addr" id="userAddr">
						<input type="text" name="addrUser" id="addrUser" value="">
						
				</p>
				<p id="btnWrap">
					<input type="submit" value="수정" id="joinBtn"> 
					<input type="button" value="취소" id="cencelBtn">
				</p>
	
				<div id="searchWarp">
					<p>
						<input type="text" placeholder="도로명입력" id="doro"> 
						<input type="button" value="검색" id="doroSearchWrap">
						<input type="button" id="search_cencel" value="취소">
					</p>
					<div id="resultAddrWrap">
						<div class="searchResult" id="zxc" >
							<p class="seacrch_zipcode">우편번호</p>
							<p class="seacrch_addr">주소명</p>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>