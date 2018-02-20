<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#myreservation_wrap{
		width:1024px;
	}
	#myreservation_wrap #myreservation_ul{
		width:100%;
	}
	#myreservation_wrap #myreservation_ul .myreservation_li{
		width:95%;
		overflow:hidden;
		list-style:none;
		padding:20px 0px 20px 30px;
		position:relative;
		border-bottom:1px solid #ccc;
	}
	#myreservation_wrap #myreservation_ul .left_img{
		float:left;
		width:20%;
	}
	#myreservation_wrap #myreservation_ul .left_img img{
		width:120px;
		height:150px;
	}
	#myreservation_wrap #myreservation_ul .right_wrap{
		float:left;
		line-height: 30px;
		padding-top:15px;
		padding-top:15px;
	}
	#myreservation_wrap #myreservation_ul .right_wrap p{
		padding:0;
		margin:0;
		overflow: hidden;
	}
	#myreservation_wrap #myreservation_ul .right_wrap p .span_left{
		float:left;
		width:200px;
	}
	#nodate{
		width:100%;
		height:30px;
		font-weight: bold;
		text-align: center;
		list-style:none;
	}
	.xmark_img{
		position: absolute;
		top:30px;
		right:10px;
		cursor:pointer;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		var userId = $("#userId").val();
		$.ajax({
			url:"myReservation.do",
			type:"get",
			data:{"userId":userId},  
			dataType:"json",
			success:function(json){
				console.log(json);
				if(json.length ==0){
					var text = "<li id='nodate'>예매된 영화가 없습니다.</li>"
					$("#myreservation_ul").empty();
					$("#myreservation_ul").append(text);
				}else{
					$("#myreservation_ul").empty();
					for(var i=0; i< json.length; i++){
						
						var li = "<li class='myreservation_li'>";
						var divleft = "<div class='left_img'>";
						var img = "<img src='/MovieProject/upload/"+json[i].movieNo+"/"+json[i].pathPoster+"'>";
						divleft += img +"</div>";
						var date = new Date(json[i].startTime);
						var dateStr = date.toLocaleString().substring(0, date.toLocaleString().length-3);
						var divRight = "<div class='right_wrap'>";
						var p1 = "<p><span class='span_left'>예매 번호(예매일)</span> <b><span class='reservationNo'>"+json[i].no+"</span>"+" ("+dateStr+")</b></p>";
						var p2 = "<p><span class='span_left'>상영관(좌석)</span> <b>"+json[i].theaterName+ " ("+json[i].seat+")</b></p>";
						var p3 = "<p><span class='span_left'>예매내역</span> <b>"+json[i].rating+"세"+" "+ json[i].movieName+"("+json[i].theaterType+")</b></p>";
						var money = json[i].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						var p4 = "<p><span class='span_left'>총 결제 금액</span> <b>"+money+"원</b></p>"
						divRight += p1 + p2+p3+p4 +"</div>";
						li += divleft + divRight +"<img src='images/xmark.png' class='xmark_img'>" +"</li>";
						$("#myreservation_ul").append(li);
					}
					
				}
			}
		})
	})
</script>
</head>
<body>
	<div id="myreservation_wrap">
		<input type="hidden" id="userId" value="${member.userId}">
		<ul id="myreservation_ul">
			
		</ul>
	</div>
</body>
</html>