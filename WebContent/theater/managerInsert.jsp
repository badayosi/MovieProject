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

 <script type="text/javascript">
 $(function(){
	 $("form[name='f1']").submit(function(){
			if(checkInputEmpty($(this).find("input[name]"))==false){
				return false;
			}
	})
	
	$("button").eq(0).click(function(){
		var a = $("input[name='row']").val();
		
		a = a.toUpperCase()				//소문자->대문자
		
		var i = a.charCodeAt(0)-16;		//영어->숫자
		//var i = a.charCodeAt(0)-16;	//숫자->영어
		
		a = String.fromCharCode(i);		//아스키코드->문자
		alert(i + " - " +a);
	})
	
 })
 </script>
</head>
<body>
	<!-- <form action="insert.do" method="post" name="f1"> -->
		<p>
			<label>상영관이름</label>
			<input type="text" name="name">
		</p>
		<p>
			<label>층수(위치)</label>
			<input type="text" name="floor">
		</p>
		<p>
			<label>수용인원</label>
			<input type="text" name="maxcount">
		</p>
		<p>
			<label>열(숫자로 입력하세요)</label>
			<input type="text" name="col">
		</p>
		<p>
			<label>행(알파벳으로 입력하세요)</label>
			<input type="text" name="row"/>
			<!--  style="text-transform:uppercase;" -->
			<button>btn</button>
		</p>
		<p>
			<label>상영관종류</label>
			<input type="text" name="type">
		</p>
		<p>
			<input type="submit" value="추가">
		</p>
	<!-- </form> -->
</body>
</html>