<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-1.12.4.min.js"></script>
<style type="text/css">
	#selectDate{
		width:900px;
		margin:0 auto;
		text-align: center;
	}
</style>
<script type="text/javascript">
	$(function(){
		$.ajax({
			
		});
		
		$("#formtag").submit(function(){
			alert($("input[name='date']").val());
		});
	});
</script>
</head>
<body>
   <jsp:include page="../include/adminHeader.jsp"></jsp:include>
   <div id="selectDate">
   		<form id=formtag type="post" action="">
   			<input type="date" name="date">
   			<input type="submit" value="검색">
   		</form>
   		
   </div>
   
   
   <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>