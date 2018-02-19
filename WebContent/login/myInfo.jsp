<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<style>
	#myInfo ul{
		list-style: none;
		margin: 0;
		padding: 0;
		overflow: hidden;
	}
	
	#myInfo ul li{
		display: inline-block;
		float:left;
		height: 70px;
		line-height:70px;
		text-align: center;
		width: 254px;
		border: 1px solid #DEDEDE;
		margin: 0;
		padding: 0;
	}
	#myInfo ul li a{
		margin: 0;
		padding: 0;
	}
	#myInfo ul li a img{
		padding-top: 15px;
	}
	#userupdate_wrap{
		width:1024px;
		display:none;
	}
	.jF p {
	margin-bottom: 20px;
	padding: 10px;
	border-bottom: 1px solid #ccc;
}
.jF{
	margin-top:30px;
	border-top:2px solid #ccc;
}
.jF p label {
	width: 150px;
	display: inline-block;
	font-size: 18px; 
	line-height: 20px;
	color: #ccc;
}

.jF p input {
	width: 300px;
	height: 40px;
	font-size: 20px;
	border: 2px solid #ccc;
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

#btnWrap{
	text-align: center;
	margin:0;
}
#resultAddrWrap {
	width: 100%;
	height: 300px;
	overflow-y: scroll;
}
#addrUser{
	margin-left:258px;
	width:461px !important
}
#joinBtn,#cencelBtn{
	width:100px !important;
	height: 40px !important;
	background: #333333;
	color: #FFF;
	font-size:14px !important;
}
#passwordUpdate_wrap{
	width:100%;
	display:none;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(function(){
		var tel1 = $("#userTel").val().substring(0, $("#userTel").val().indexOf("-"));
		var tel2 = $("#userTel").val().substring($("#userTel").val().indexOf("-")+1,$("#userTel").val().lastIndexOf("-"));
		var tel3 = $("#userTel").val().substring($("#userTel").val().lastIndexOf("-")+1,$("#userTel").val().length);
		var zipcode = $("#userAddr").val().substring(1,6);
		var userAddr = $("#userAddr").val().substring(7,$("#userAddr").val().indexOf("/"));
		var addrUser = $("#userAddr").val().substring($("#userAddr").val().indexOf("/")+1,$("#userAddr").val().length);
	
		$("#telSelect").val(tel1);
		$(".telinput").eq(0).val(tel2);
		$(".telinput").eq(1).val(tel3);
		$("#zipcode").val(zipcode);
		$("#addr").val(userAddr);
		$("#addrUser").val(addrUser);
		$(document).on("click","#updateUser_img",function(){
			$("#userupdate_wrap").css("display","block");
		})
	})
</script>
	<input type="hidden" value="${member.addr }" id="userAddr">
	<input type="hidden" value="${member.phone }" id="userTel">
	<div id="myInfo">
		<ul>
			<li><a href="#" id="updateUser_img"><img src="images/info1.png" ></a></li>
			<li><a href="#"><img src="images/info2.png"></a></li>
			<li><a href="#"><img src="images/info3.png"></a></li>
			<li><a href="#"><img src="images/info4.png"></a></li>
		</ul>
	</div>
	<div id="userupdate_wrap">
		<form action="join.do" method="post" class="jF">
				<p>
					<label>아이디</label> 
					<span>${member.userId }</span> 
					
				</p>
				<p>
					<label>이 름</label>
					<span>${member.name }</span>
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
				</p>
				<p>
					<label>이메일주소</label> <input type="email" name="email" id="userEmail" value="${member.email }">
				</p>
				<p id="postWrap">
					<label>주소</label><input type="button"
						value="우편번호 검색" id="addrSearchBtn"><input type="tel"
						name="zipcode" id="zipcode"> <input type="text" name="addr"
						id="addr" id="userAddr">
						<input type="text" name="addrUser" id="addrUser">
						
				</p>
				<p id="btnWrap">
					<input type="submit" value="수정" id="joinBtn"> <input type="button"
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
	<div id="passwordUpdate_wrap">
		<form action="join.do" method="post" class="jF">
				<p>
					<label>현재 비밀번호</label> <input type="password" name="pw"  id="userPw">
				</p>
				<p>
					<label>새 비밀번호</label> <input type="password" name="pw" placeholder="8자이상 영문/숫자/특수문자를 조합하세요" id="userPwnew">
				</p>
				<p>
					<label>비밀번호 확인</label> <input type="password" name="pwch" id="userPwch">
				</p>
				<p id="btnWrap">
					<input type="submit" value="변경" id="joinBtn"> <input type="reset"
						value="취소" id="cencelBtn">
				</p>
		</form>
	</div>
	<div id="passwordUpdate_wrap">
		<form action="join.do" method="post" class="jF">
				<p>
					<label>새 비밀번호</label> <input type="password" name="pw" placeholder="8자이상 영문/숫자/특수문자를 조합하세요" id="userPwnew">
				</p>
				<p>
					<label>비밀번호 확인</label> <input type="password" name="pwch" id="userPwch">
				</p>
				<p id="btnWrap">
					<input type="submit" value="변경" id="joinBtn"> <input type="reset"
						value="취소" id="cencelBtn">
				</p>
		</form>
	</div>