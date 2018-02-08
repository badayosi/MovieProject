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
 <script src="../js/common.js"></script>  
 <script type="text/javascript">
 $(function(){
	 $("form[name='f1']").submit(function(){
			
			if(checkInputEmpty($(this).find("input[name]"))==false){
				return false;
			}
			
		})
 })
 </script>
</head>
<body>
	<form action="modify.do" method="post" name="f1">
		<p>
			<label>상영관번호</label>
			<input type="text" name="number" value="${item.theaterNo }">
		</p>
		<p>
			<label>상영관이름</label>
			<input type="text" name="name" value="${item.theaterName }">
		</p>
		<p>
			<label>층수(위치)</label>
			<input type="text" name="floor" value="${item.theaterFloor }">
		</p>
		<p>
			<label>수용인원</label>
			<input type="text" name="maxcount" value="${item.theaterMaxcount }">
		</p>
		<p>
			<label>행(알파벳으로 입력하세요)</label>
			<input type="text" name="row" value="${item.row }">
		</p>
		<p>
			<label>열(숫자로 입력하세요)</label>
			<input type="text" name="col" value="${item.col }">
		</p>
		<p>
			<label>상영관종류</label>
			<input type="text" name="type" value="${item.theaterType }">
		</p>
		<p>
			<input type="submit" value="수정">
		</p>
	</form>
</body>
</html>