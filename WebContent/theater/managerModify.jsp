<%@page import="movie.dto.Theater"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-1.12.4.min.js"
  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
  crossorigin="anonymous"></script> 
 <link rel="stylesheet" type="text/css" href="../css/theater.css?ver=1">
 <script src="../js/theater.js"></script>

 <%
 	Theater theater = (Theater)request.getAttribute("item");
 	int max = theater.getTheaterMaxcount();
 	String row = theater.getRow();
 	int col = theater.getCol();
 	String table = theater.getTheaterTable(); 
 %>
 <script type="text/javascript">
 	$(function(){
	 //추가 버튼
	 $("form[name='f1']").submit(function(){
		 $(".error, .error2, .error3, .error4, .error5" ).css("display","none");
		
		 //빈칸 체크
		if(checkInputEmpty($(this).find("input[name]"))==false){
			return false;
		}
		
		var row = $("input[name='row']").val();
		var col = $("input[name='col']").val();
		var max = $("input[name='maxcount']").val();
		
		if(row=="<%=row%>"&&col=="<%=col%>"&&max=="<%=max%>"){			
			$("input[name='table']").val('<%=table%>');
		}else{
			$("input[name='table']").val("");
		}
	})
	
	//행 입력 계산
	$("input[name='row']").change(function(){
		filterRowAndCol();	
	})
	
	//인원, 열 입력시 행 자동 계산
	$("input[name='col']").change(function() {
		var num = $("input[name='maxcount']").val();
		var i = $("input[name='col']").val();
		var a = num/i;
		a = Math.ceil(a)+64;
		var row = String.fromCharCode(a);
		
		$("input[name='row']").val(row);
	})
	//숫자만 입력
	$("input[name='floor'],input[name='maxcount'],input[name='col']").change(function(){		
		var num = $(this).val();	
		num = num.charCodeAt(0);
		if(num>47&&num<58){
			$(this).parent().find(".error6").css("display","none");
		}else{
			$(this).val("");
			$(this).parent().find(".error6").css("display","block");
		}
	})
	
	$("button").eq(0).click(function(){
		var a = $("input[name='row']").val();
				
		//var i = a.charCodeAt(0)-16;		//영어->숫자
		var i = a.charCodeAt(0)+16;	//숫자->영어
		
		a = String.fromCharCode(i);		//아스키코드->문자
		alert(i + " - " +a);
	})
 })
 
 
 //행 자동 계산
 function filterRowAndCol(){
	 	var a = $("input[name='row']").val();
		a = a.toUpperCase();
		a = a.charCodeAt(0);
		
		if(a>64&&a<91){//대문자 해당
		
		$(".error2").css("display","none");
		var num = $("input[name='maxcount']").val();
		var i = $("input[name='col']").val();
		if(num==""){
			$(".error5").css("display","block");
		}
		if(i==""){
			$(".error4").css("display","block");
		}
		
		var divsion = num/i;
		divsion = Math.ceil(divsion)+64;
		
		if(a>=divsion){
			a = String.fromCharCode(a);
			$("input[name='row']").val(a);
			$(".error3").css("display","none");
		}else{
			$("input[name='row']").val("");
			$(".error3").css("display","block");
		}			
	}else{//대문자아님
		$("input[name='row']").val("");
		$(".error2").css("display","block");
	}
 } 
 </script>
 <style type="text/css">
 	@import url("/MovieProject/css/common.css");
 </style>
</head>
<body>
	<form action="modify.do" method="post" name="f1">
		<p>
			<label>상영관번호</label>
			<input type="text" name="number" value="${item.theaterNo }" readonly>
		</p>
		<p>
			<label>상영관이름</label>
			<input type="text" name="name" value="${item.theaterName }">
			<span class="error">상영관명을 입력하세요</span>
		</p>
		<p>
			<label>층수(위치)</label>
			<input type="text" name="floor"  value="${item.theaterFloor }">
			<span class="error">위치를 입력하세요</span>
			<span class="error6">숫자로 입력하세요</span>
		</p>
		<p>
			<label>수용인원</label>
			<input type="text" name="maxcount" value="${item.theaterMaxcount }">
			<span class="error">인원을 입력하세요</span>
			<span class="error5">인원을 입력하세요</span>
			<span class="error6">숫자로 입력하세요</span>
		</p>
		<p>
			<label>열(숫자)</label>
			<input type="text" name="col" value="${item.col }">
			<span class="error">열을 입력하세요</span>
			<span class="error4">열을 입력하세요</span>
			<span class="error6">숫자로 입력하세요</span>
		</p>
		<p>
			<label>행(알파벳)</label>
			<input type="text" name="row" maxlength="1"  value="${item.row }"/>
			<span class="error">행을 입력하세요</span>
			<span class="error2">영어로 입력하세요</span>
			<span class="error3">전체인원을 수용할 수 없습니다</span>
		</p>
		
		<p>
			<label>상영관종류</label>
			<input type="text" name="type" value="${item.theaterType }">
			<span class="error">상영관 종류를 입력하세요</span>
		</p>
		<input type="text" name="table"  class="displayHidden" value="...">
		<p>
			<input type="submit" value="수정">
		</p>
	</form>
</body>
</html>