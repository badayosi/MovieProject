<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-1.12.4.min.js"></script>
<style type="text/css">
#container{
	width:1024px;
	margin:0 auto;
}
#container .list{
	width:490px;
	border:1px solid blue;
	margin-bottom:20px;
	margin-left:10px;
	display:inline-block;
	overflow:hidden; 
} 
#container .list img{
	width:150px;
	float:left;
	padding:20px;
}
 #container .list .mInfoTable{
 	width:60%;
 	border-collapse: collapse; 
 }
 #container .list .mInfoTable td:nth-child(even){
 	
 	padding-left:10px;
 }
 h4{
 	margin:10px;
 }
</style>
<script type="text/javascript">
	$(function(){
		var userId="user1";
		$.ajax({
			url:"myMovieHistory.do",
			type:"get",
			data:{"userId":userId},
			dataType:"json",
			success:function(json){
				console.log(json);
				var str="";
				
				$(json).each(function(i,obj){
					var date=new Date(obj.startTime);
					
					 
					str+="<div class='list'>"
			   		+"<img src='/MovieProject/upload/"+obj.movieNo+"/"+obj.pathPoster+"'>"
			   		+"<table class='mInfoTable'>"
			   		+"<tr>"
			   		+"<td colspan='2'><h2>"+obj.movieName+"</h2></td>"
			   		+"</tr>"
			   		+"<tr>"
			   		+"<td><h4>관람등급</h4></td>"
			   		+"<td>"+obj.rating+"세</td>"
			   		+"</tr>"
			   		+"<tr>"
			   		+"<td><h4>상영관</h4></td>"
			   		+"<td>"+obj.theaterName+"</td>"
			   		+"</tr>"
			   		+"<tr>"
			   		+"<td><h4>관람일시</h4></td>"
			   		+"<td>"+date.toLocaleString()+"</td>"
			   		+"</tr>"
			   		+"<tr>"
			   		+"<td><h4>관람인원</h4></td>"
			   		+"<td>2명</td>"
			   		+"</tr>"
			   		+"</table>"
			   		+"</div>";

				});
				$("#container").append(str);
			}
		});
	});
</script>
</head>
<body>
   <div id="container">
	   	
   </div>
</body>
</html>