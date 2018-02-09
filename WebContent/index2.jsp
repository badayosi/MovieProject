<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="css/common.css">
 <style type="text/css">
 	*{
 		margin:0 auto;
		font-family: "나눔 고딕", 'Nanum Gothic', 'ng';
		padding: 0;
 	}
 	#event{
 		width:1024px;
 		margin:0 auto;
 	}
 	
 	#top_right{
 		width: 315px;
 		height: 153px;
 		background: 2A2E33;
 	}
 </style>
</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
	
	<div id="top">
		<div id="top_right">
			right
		</div>
		
		<div id="top_left">
			left
		</div>
	</div>
	<div id="poster">
		
	</div>
	<div id="event">
		<img src="images/card_event.jpg">
	</div>

	<jsp:include page="include/footer.jsp"></jsp:include>

</body>
</html>