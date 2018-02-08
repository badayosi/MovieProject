<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/common.css">
<title>Insert title here</title>
<style>
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

#joinForm #jF p input {
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
	top: 5px;
	left: 340px;
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
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		var idCk = 0;
		$("#joinForm #jF p").each(function(i, obj) {
			$(obj).hover(function() {
				$(this).find("label").css("color", "black");
				$(this).find("input").css("border-color", "black");
				$(this).find("input").focus();
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
			location.href="index.jsp";
		})
		
		$("#checkId").click(function(){
			var id = $("#userId").val();
			 $.ajax({
					url:"idcheck.do",
					type:"get",
					data:{"id":id},
					dataType:"json",
					success:function(json){
						if(json == "false"){
							$("#id_check").text("이미 등록된 ID입니다.");
							$("#id_check").css("color","red");
						}else if(json =="true"){
							$("#id_check").text("사용 가능한 ID입니다.");
							$("#id_check").css("color","green");
							idCk = 1;
						}
						
					}
					
			})
		})
		
		$("#jF").submit(function(){
			var regId = /^[0-9A-Za-z]{6,14}$/;
			var regPw = /^[0-9A-Za-z]{8,16}$/;
			var regName = /^[가-힣]{2,6}$/;
			var regEmail = /^\w{4,12}@[a-z]{2,10}[\.]?(com|or.kr|net)$/;
			var regTel1 = /^[0-9]{3,4}$/;
			var regTel2 = /^[0-9]{4}$/;
			
			if(!regId.test($("input[name='id']").val()) || $("input[name='id']").val() ==""){
				$("#id_check").text("아이디를 잘못입력하셨습니다.");
				$("#id_check").css("color","red");
				return false;
			}else if(!regPw.test($("input[name='pw']").val()) || $("input[name='pw']").val() ==""){
				$("#pw_check").text("비밀번호를 잘못입력하셨습니다.");
				$("#pw_check").css("color","red");
				return false;
			}else if($("input[name='pwch']").val() =="" || $("input[name='pwch']").val() != $("input[name='pw']").val()){
				$("#pwch_check").text("비밀번호가 일치하지 않습니다.");
				$("#pwch_check").css("color","red");
				return false;
			}else if(!regName.test($("input[name='name']").val()) || $("input[name='name']").val() ==""){
				$("#name_check").text("이름를 잘못입력하셨습니다.");
				$("#name_check").css("color","red");
				return false;
			}else if(!regEmail.test($("input[name='email']").val()) || $("input[name='email']").val() ==""){
				$("#email_check").text("이메일을 잘못입력하셨습니다.");
				$("#email_check").css("color","red");
				return false;
			}else if(!regTel1.test($("input[name='tel2']").val()) || $("input[name='tel2']").val() ==""){
				$("#tel_check").text("휴대폰 번호를 잘못입력하셨습니다.");
				$("#tel_check").css("color","red");
				return false;
			}else if(!regTel2.test($("input[name='tel3']").val()) || $("input[name='tel3']").val() ==""){
				$("#tel_check").text("휴대폰 번호를 잘못입력하셨습니다.");
				$("#tel_check").css("color","red");
				return false;
			}else if($("input[name='zipcode']").val() == ""|| $("input[name='addr']").val()== ""){
				$("#addr_check").text("주소를 입력하세요");
				$("#addr_check").css("color","red");
				return false;
			}else if(!$("input[name='gender']").is(":checked")){
				$("#gender_check").text("성별을 선택하세요");
				$("#gender_check").css("color","red");
				return false;
			}
		})
	})
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div id="hiddenbg"></div>
	<div id="joinForm">
		<h2>회원정보입력</h2>
		<div id="joininputFrom">
			<form action="join.do" method="post" id="jF">
				<p>
					<label>아이디</label> <input type="text" name="id" id="userId" placeholder="6자이상 영문/숫자를 입력하세요"> <input
						type="button" value="중복체크" id="checkId">
					<span id="id_check"></span>
				</p>
				<p>
					<label>비밀번호</label> <input type="password" name="pw" placeholder="8자이상 영문/숫자를 입력하세요">
					<span id="pw_check"></span>
				</p>
				<p>
					<label>비밀번호 확인</label> <input type="password" name="pwch">
					<span id="pwch_check"></span>
				</p>
				<p>
					<label>이름</label> <input type="text" name="name">
					<span id="name_check"></span>
				</p>
				<p>
					<label>이메일주소</label> <input type="email" name="email">
					<span id="email_check"></span>
				</p>
				<p>
					<label>휴대폰 번호</label> <select name="tel1" id="telSelect">
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
					</select> <input type="tel" name="tel2" class="telinput"> <input
						type="tel" name="tel3" class="telinput">
						<span id="tel_check"></span>
				</p>
				<p id="radioP">
					<label>성별</label> <input type="radio" name="gender" value="여자"
						class="radioBtn" id="radio1"><span id="span1">여자</span> <input
						type="radio" name="gender" value="남자" class="radioBtn" id="radio2"><span
						id="span2">남자</span>
						<span id="gender_check"></span>
				</p>
	
				<p id="postWrap">
					<label>주소</label><input type="button"
						value="우편번호 검색" id="addrSearchBtn"><input type="tel"
						name="zipcode" id="zipcode"> <input type="text" name="addr"
						id="addr">
						<span id="addr_check"></span>
				</p>
				<p id="btnWrap">
					<input type="submit" value="회원가입" id="joinBtn"> <input type="button"
						value="취소" id="cencelBtn">
				</p>
	
				<div id="searchWarp">
					
					<p>
						<input type="text" placeholder="도로명입력" id="doro"> 
						<input type="button" value="검색" id="doroSearchWrap">
						<input type="button" id="search_cencel" value="취소">
					</p>
					<div id="resultAddrWrap">
						<div class="searchResult" id="zxc">
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