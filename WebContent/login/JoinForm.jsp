<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/common.css">
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
		var idCk = 0;
		var falseImgsrc = "../images/join_else_icon.png";
		var trueImgsrc = "../images/join_icon.png";
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
			$("#zipcode").nextAll(".checkimg").css("display","inline-block");
			$("#zipcode").nextAll(".checkimg").attr("src",trueImgsrc);
		})
		$("#searchWarp #search_cencel").click(function(){
			$("#hiddenbg").css("display","none");
			$("#searchWarp").css("display","none");
			$("#doro").val("");
			$("#zipcode").nextAll(".checkimg").attr("src",falseImgsrc);
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
						console.log(json);
						if(json == "false"){
							alert("중복된 아이이디입니다.");
							$("#userId").nextAll(".checkimg").attr("src",falseImgsrc);
						}else if(json =="true"){
							var reg =/^(?=.*[A-Za-z])[A-Za-z0-9]{6,12}$/;
						    var reg2 = /^[A-Za-z]{6,12}$/;
							if(reg.test(id) || reg2.test(id)){
								$("#userId").nextAll(".checkimg").attr("src",trueImgsrc);
							}else{
								alert("6자이상 영문/숫자를 입력해주세요");
							}
						}
					}
			})
		})
		$("input[name='pw']").keyup(function(){
			var reg =/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
			
			if(reg.test($(this).val())){
				$("#userPw").nextAll(".checkimg").attr("src",trueImgsrc);
			}else{
				$("#userPw").nextAll(".checkimg").attr("src",falseImgsrc);
			}
		})
		$("input[name='pwch']").keyup(function(){
			if($(this).val() != $("input[name='pw']").val()){
				$("#userPwch").nextAll(".checkimg").attr("src",falseImgsrc);
			}else{
				$("#userPwch").nextAll(".checkimg").attr("src",trueImgsrc);
			}
		})
		$("input[name='name']").keyup(function(){
			var regName =/^[가-힣]{2,10}$/;
			if(!regName.test($(this).val())){
				$("#userName").nextAll(".checkimg").css("display","inline-block");
				$("#userName").nextAll(".checkimg").attr("src",falseImgsrc);
			}else{
				$("#userName").nextAll(".checkimg").css("display","inline-block");
				$("#userName").nextAll(".checkimg").attr("src",trueImgsrc);
			}
		})
		$("input[name='email']").keyup(function(){
			var regEmail = /^\w{4,12}@[a-z]{2,10}[\.]?(com|or.kr|net)$/;
			if(!regEmail.test($(this).val())){
				$("#userEmail").nextAll(".checkimg").css("display","inline-block");
				$("#userEmail").nextAll(".checkimg").attr("src",falseImgsrc);
			}else{
				$("#userEmail").nextAll(".checkimg").css("display","inline-block");
				$("#userEmail").nextAll(".checkimg").attr("src",trueImgsrc);
			}
		})
		
		$("input[name='tel2'],input[name='tel3']").keyup(function(e){
			var regTel1 = /^[0-9]{3,4}$/;
			var regTel2 = /^[0-9]{4}$/;
			if($("input[name='tel2']").val().length==4){
				$("#userTel").nextAll("input").focus();
			}
			if(!regTel1.test($("input[name='tel2']").val()) || !regTel2.test($("input[name='tel3']").val())){
				$("#userTel").nextAll(".checkimg").attr("src",falseImgsrc);
			}else{
				$("#userTel").nextAll(".checkimg").attr("src",trueImgsrc);
			}
		})
		$("input[name='gender']").click(function(){
			$("#radio2").nextAll(".checkimg").attr("src",trueImgsrc);
		})
		
		
		$("#jF").submit(function(){	
			var bl = true;
			$(".checkimg").each(function(i, obj) {
				if($(obj).attr("src") == falseImgsrc){
					$(obj).siblings('input').focus();
					bl = false;
				}
			})
			if(!bl){
				alert("x표시를 다시 입력하세요");
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
	<div id="hiddenbg"></div>
	<div id="joinForm">
		<h2 id="h2text">회원정보입력</h2>
		<div id="joininputFrom">
			<form action="join.do" method="post" id="jF">
				<p>
					<label>아이디</label> 
					<input type="text" name="id" id="userId" placeholder="6자이상 영문/숫자를 입력하세요" onkeyup="this.value=this.value.replace(/[^A-Za-z0-9]/g,'');"> 
					<input type="button" value="중복체크" id="checkId">
					<img src="../images/join_else_icon.png" class="checkimg">
				</p>
				<p>
					<label>비밀번호</label> <input type="password" name="pw" placeholder="8자이상 영문/숫자/특수문자를 조합하세요" id="userPw">
					
					<img src="../images/join_else_icon.png" class="checkimg">
				</p>
				<p>
					<label>비밀번호 확인</label> <input type="password" name="pwch" id="userPwch">
					
					<img src="../images/join_else_icon.png" class="checkimg">
				</p>
				<p>
					<label>이름</label> <input type="text" name="name" id="userName" onkeyup="this.value=this.value.replace(/[^가-힣]/g,'');">
					
					<img src="../images/join_else_icon.png" class="checkimg">
				</p>
				<p>
					<label>이메일주소</label> <input type="email" name="email" id="userEmail">
					
					<img src="../images/join_else_icon.png" class="checkimg">
				</p>
				<p>
					<label>휴대폰 번호</label> <select name="tel1" id="telSelect">
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
					</select> <input type="tel" name="tel2" class="telinput" id="userTel" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"> <input
						type="tel" name="tel3" class="telinput" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
						<img src="../images/join_else_icon.png" class="checkimg">
						
				</p>
				<p id="radioP">
					<label>성별</label> <input type="radio" name="gender" value="여자"
						class="radioBtn" id="radio1"><span id="span1">여자</span> <input
						type="radio" name="gender" value="남자" class="radioBtn" id="radio2"><span
						id="span2">남자</span>
						<img src="../images/join_else_icon.png" class="checkimg" id="radioCheckImg">
				</p>
	
				<p id="postWrap">
					<label>주소</label><input type="button"
						value="우편번호 검색" id="addrSearchBtn"><input type="tel"
						name="zipcode" id="zipcode"> <input type="text" name="addr"
						id="addr" id="userAddr">
						<input type="text" name="addrUser" id="addrUser">
						<img src="../images/join_else_icon.png" class="checkimg">
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
		<c:if test="${success !=null}">
			<script type="text/javascript">
				$("#h2text").text("회원가입완료");
				$("#joininputFrom").empty();
			</script>
			<div id="successWrap">
				<div id="successWrap_imgWrap">
				<img src="../images/img_icon_join.png">
				</div>
				<div id="successWrap_textWrap">
				<h2><span id="bluetext">${name }</span>님 환영합니다:)</h2>
				<h2>서비스이용을 위해</h2>
				<h2>다시 로그인을 해주세요.</h2>
				<a href="login.do"><input type="button" value="로그인" class="loginBtn"></a>
				<a href="index.jsp"><input type="button" value="홈 바로가기" class="loginBtn"></a>
			</div>
			</div>
		</c:if>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>