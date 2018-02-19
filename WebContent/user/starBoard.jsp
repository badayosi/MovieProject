<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="../css/common.css">
<link rel="stylesheet" type="text/css" href="css/star.css">
<style>
	#starBorad{
		width: 1024px;
		min-height: 600px;
		margin: 0 auto;
	}
	#starBorad h2{
		margin-bottom:15px;
	}
	#starBorad #boradWrap{
		width:100%;
		height:100px;
		border:1px solid #dedede;
	}
	#starBorad #boradWrap #starScore{
		width:20%;
		height:100px;
		position:relative;
		float: left;
		
	}
	#starBorad #boradWrap #starScore h4{
		position:absolute;
		top:10px;
		left:83px;
		font-size: 20px;
	}
	#starBorad #boradWrap #starScore #star-input{
		position:absolute;
		top:40px;
		left:50px;
	}
	
	#outputtag{
		position: absolute !important;
		left:30px;
		top:25px;
	}
	#starBorad #boradWrap #textAreaWrap{
		width:65%;
		height:90px;
		float:left;
	}
	#starBorad #boradWrap #textAreaWrap textarea{
		width:100%;
		height:100%;
		outline: none;
		font-size:18px;
		border:1px solid #ccc;
		resize:none;
		background: #f5f5f5;
		padding: 5px;
	}
	#starBorad #boradWrap #boradSendWrap{
		width:15%;
		height:100px;
		background: #231f20;
		text-align: center;
		float:left;
	}
	#starBorad #boradWrap #boradSendWrap a{
		text-decoration:none;
		line-height:100px;
		font-size:22px;
		color:#cdc197;
	}
	#starBorad hr{
		clear: both;
		margin-top:30px
		border:2px solid black;
	}
	.user_star_board img{
		float:left;
	}
	.user_star_board .last_img{
		margin-right:5px;
	}
	.userStarBoard{
		width:100%;
		padding:10px;
		overflow: hidden;
		margin-top:30px;
		border-bottom:1px solid #e5e5e5;
	}
	.userStarBoard .userStarBoard_left{
		width:70%;
		float:left;
	}
	.userStarBoard .userStarBoard_right{
		width:28%;
		float:left;
		line-height:100px;
		border-left:1px solid #e5e5e5;
		text-align: center;
	}
	.userStarBoard .realview{
		width:66px;
		height:18px;
		text-align:center;
		padding:2px;
		font-size:12px;
		background: #33373a;
		color:#fff;
		margin-right:5px;
		float:left;
	}
	.user_star_board{
		overflow: hidden;
		margin-bottom:15px;
	} 
	.user_star_content{
		margin-bottom:15px;
		padding:5px;
		height:45px;
	}
	.user_star_content p{
		text-align: left;
	}
	#countBtn{
		margin:0 auto;
		text-align: center;
	}
	#countBtn .page_number{
		padding:5px;
		font-size:19px;
		margin-right:10px;
	}
	#countBtn .page_number:HOVER{
		text-decoration: underline;
	}
</style>

<script type="text/javascript" src="js/star.js"></script>
<script type="text/javascript">
	$(function(){
		starRating();
		
		$("#insert_star_board").click(function(){
			var userId = $("#userId").val();
			var movie_no = $("#movieNo").val();
			var board_content = $("#user_star_content").val().replace(/(?:\r\n|\r|\n)/g, '<br />');
			var userName = $("#userName").val();
			var grade = $("#outputtag b").text();
			$.ajax({
				url:"starboardinsert.do",
				type:"get",
				data:{"userId":userId,
					"movie_no":movie_no,
					"board_content":board_content,
					"userName":userName,
					"grade":grade},
				dataType:"json",
				success:function(json){
					boardListView(0);
				}
			})
		})
		$("#btn1").click(function(){
			alert($("#user_star_content").val());
			$("#asdasd").text($("#user_star_content").val());
		})
		$(document).on("click",".page_number",function(){
			alert("이벤트 발생")
			var size = Number($(this).text()) -1;
			$.ajax({
				url:"starboard.do",
				type:"get",
				data:{"size":size},
				dataType:"json",
				success:function(json){
					console.log(json);
					boardListView(size);
				}
			})
		})
		boardListView(0);
	})
function boardListView(boardNo){
	$("#userStarBoardView").empty();
	$("#countBtn").empty();
	var movieNo=$("#movieNo").val();
	$.ajax({
		url:"starboard.do",
		type:"get",
		data:{"size":boardNo, "movieNo":movieNo},
		dataType:"json",
		success:function(json){
			console.log(json);
			if(json.list !=null){
				for(var j=0; j < json.list.length; j++){

					var div_userStartBoard =  "<div class='userStarBoard'>";
					var div_userStartBoard_left = "<div class='userStarBoard_left'>";
					var div_user_star_board = "<div class='user_star_board'>";
					var span_relaview= "<span class='realview'>실관람객</span>";
					var img = "";
					var size = json.list[j].grade;
					var halfSize =  parseInt(size / 2);
					for(var i =0; i <5; i ++){
						if(size % 2 ==0){
							if(halfSize > i){
								img += "<img src='images/star-on.png'>";
							}else{
								img += "<img src='images/star-off.png'>";
							}
						}else if(size %2 != 0){
							if(halfSize > i){
								img += "<img src='images/star-on.png'>";
							}else if(halfSize == i){
								img += "<img src='images/star-half.png'>";
							}else{
								img += "<img src='images/star-off.png'>";
							}
						}
					}
					var span_user_star_board_socre = "<span class ='user_star_board_socre'>"+json.list[j].grade+"</span></div>";
					div_userStartBoard += div_userStartBoard_left+div_user_star_board +span_relaview + img +span_user_star_board_socre;
						
					var div_user_star_content = "<div class='user_star_content'>";
					var contentP = "<p>"+ json.list[j].boardContent + "</p></div>";
					var div_user_star_date =  "<div class='user_star_date'>";
					
					var date = new Date(json.list[j].regdate);
					
					var regDateP = "<p>"+date.toLocaleDateString()+"</p></div></div>";
					
					div_userStartBoard += div_user_star_content + contentP + div_user_star_date + regDateP;
					
					var userStarBoard_right = "<div class='userStarBoard_right'>";
					var userNameString = json.list[j].userName;
					var hiddName = userNameString.substr(0, 1)+"*"+userNameString.substr(2, userNameString.length);
					var spanName = "<span class='userStarBoard_userId'>"+hiddName+"</span></div></div>";
					
					div_userStartBoard += userStarBoard_right +spanName;
					$("#userStarBoardView").append(div_userStartBoard);
					
				}
				var fullSize = json.size;
				for(var boardSize =0; boardSize <= fullSize; boardSize++){
					var pageNo = "<span class='page_number'>"+(boardSize+1)+"</span>"
					$("#countBtn").append(pageNo);
				}
			}else{
				$("#userStarBoardView").text("현재 등록된 평점이 없습니다.");
			}
		}
	})
}
</script>

	<div id="starBorad">

		<p  id="boardSize">${boardIndex }</p>
		<h2>평점 및 영화 리뷰</h2>
		<div id="boradWrap">
			<div id="starScore">
				<h4>평점</h4>
				<span class="star-input" id="star-input">
		 			<span class="input">
		   				<input type="radio" name="star-input" id="p1" value="1"><label for="p1">1</label>
	    				<input type="radio" name="star-input" id="p2" value="2"><label for="p2">2</label>
	    				<input type="radio" name="star-input" id="p3" value="3"><label for="p3">3</label>
					    <input type="radio" name="star-input" id="p4" value="4"><label for="p4">4</label>
					    <input type="radio" name="star-input" id="p5" value="5"><label for="p5">5</label>
					    <input type="radio" name="star-input" id="p6" value="6"><label for="p6">6</label>
					    <input type="radio" name="star-input" id="p7" value="7"><label for="p7">7</label>
					    <input type="radio" name="star-input" id="p8" value="8"><label for="p8">8</label>
					    <input type="radio" name="star-input" id="p9" value="9"><label for="p9">9</label>
					    <input type="radio" name="star-input" id="p10" value="10"><label for="p10">10</label>
					</span>
		 			<output for="star-input" id="outputtag"><b>0</b>점</output>
	   			</span>
			</div>
			<div id="textAreaWrap">
				<textarea rows="0" cols="0" placeholder="영화 리뷰는 로그인 후에 작성하실수 있습니다." id="user_star_content"></textarea>
			</div>
			<div id="boradSendWrap">
				<a href="#" id="insert_star_board">입력</a>
			</div>
		</div>
		<hr>
		<div id="userStarBoardView">
		
		</div>
		
		<div id="countBtn">
				
		</div>
		<input type="hidden" id="userId" value="${member.userId }">
		<input type="hidden" id="userName" value="${member.name }">
		<input type="hidden" id="movieNo" value="${movie.movieNo }">
	</div>
