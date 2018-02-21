<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#container{
	width:1024px;
	margin:0 auto;
}
#container .list{
	width:490px;
	border:1px solid #ccc;
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
 td{
 	padding-bottom:10px;
 }
 h4{
 	margin:0;
 }
 td h2{
 	text-align: center;
 	padding-bottom:20px;
 }
 #nodateMovie{
 	width:1000px;
 	font-size:20px;
 	text-align:center;
 }
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		var userId=$("#userId").val();
		$.ajax({
			url:"myMovieHistory.do",
			type:"get",
			data:{"userId":userId},
			dataType:"json",
			success:function(json){
				
				var str="";
				if(json.length ==0){
					str = "<table class='mInfoTable'><tr><td colspan='2'><h2 id='nodateMovie'>무비 히스트리가 없습니다.</h2></td></tr></table>";
					
				}
				$(json).each(function(i,obj){
					var date=new Date(obj.startTime);
					var seat = obj.seat;
					var seatNumber = 1;
					
					while(true){
						if(seat.toString().indexOf("/") >0){
							seat = seat.toString().replace("/","");
							seatNumber += 1;
						}else{
							break;
						}
					} 
					 
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
			   		+"<td>"+seatNumber+"명</td>"
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
	   	<input type="hidden" value="${member.userId }" id="userId">
   </div>
</body>
</html>