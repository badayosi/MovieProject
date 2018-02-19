<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
<style type="text/css">
	*{
 		position:relative;
 		margin:0 auto;
		font-family: "나눔 고딕", 'Nanum Gothic', 'ng';
		padding: 0;
		margin: 0;
 	}
 	
	#myPage{
		width: 1024px;
		margin: 0 auto;
	}
	#name{
		background: #282E34;
		color: white;
		font-size: 18px;
		padding: 13px;
		margin-bottom: 20px;
	}
	#name span{
		color: #EFEBDB;
	}
	/* #282E34 */
	/* nav버튼 */
	#myNav{
		overflow: hidden;
		margin-bottom: 30px;
	}
	#myNav ul{
		width: 100%;
		height: 49px;
		line-height:49px;
		background: #EFEBDB;
	}
	#myNav ul li{
		list-style: none;
		display: inline-block;
		float: left;
		text-align: center;
		width: 254px;
		border: 1px solid white;
		color: #231f20;
		height: 49px;
		font-size: 14px;
		cursor:pointer;
		/* 터치 =>231F20 */
	}
	#userRank_span{
		float:right;
	}
	#myInfo{
		overflow:hidden;
	}
	.select_menu{
		background: #231f20 !important;
    	color: #cdc197 !important;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#myNav ul li").click(function(){
			if($(this).text()=="나의 문의 내역"){
				$(this).addClass("select_menu");
				$("#selectMenu").load("myNotice.jsp");
			}
		});
		$(document).on("click",".table_title",function(){
			
			var no = $(this).parent().find(".boardNo").text();
			$.ajax({
				url:"mynoticeselect.do",
				type:"get",
				data:{"no":no},  
				dataType:"json",
				success:function(json){
					console.log(json);
					
					$("#selectNoticeWrap").css("display","block"); 
					$("#myNotice_wrap").css("display","none");
					
					$("#title_h4").text(json.title);
					var date = new Date(json.regdate);
					$("#regdate_Li").html("<b> 등록일 :</br>"+date.toLocaleDateString()+"<span id='linespan'></span>");
					$("#selectContent p").html(json.content);
					if(json.answer){
						$("#answer_wrap").css("display","block");
						 $("#answer_wrap p").html(json.answerContent); 
					}
					
				}
			})
		});
		$(document).on("click","#mynotice_submit",function(){
			var title = $("#mynotice_title").val();
			var userId = $("#userId").val();
			if(title != ""){
				$.ajax({
					url:"mynoticetitle.do",
					type:"get",
					data:{"title":title,
						"userId":userId},  
					dataType:"json",
					success:function(json){
						
						if(json.length==0){
							alert("검색결과가 없습니다.");
						}else{
							$("#notice_table tr").not("#header_table").remove("tr");
							for(var i=0; i<json.length; i++){
								var tr = "<tr>";
								var tdNo = "<td class='boardNo'>"+json[i].boardNo+"</<td>";
								var tdclassification = "<td>"+json[i].classification+"</<td>";
								var tdtitle = "<td class='table_title'>"+json[i].title+"</<td>";
								var date = new Date(json[i].regdate);
								var tdregdate = "<td>"+date.toLocaleDateString()+"</<td>";
								var tdanswer = "";
								if(json[i].answer){
									tdanswer = "<td>O</td>"
								}else{
									tdanswer = "<td>X</td>"
								}
								tr += tdNo + tdclassification +tdtitle + tdregdate + tdanswer;
								$("#notice_table").append(tr);
							}
						}
						
					}
				})
			}else{
				alert("제목을 입력해주세요");
				$("#mynotice_title").focus();
			}
		})
	})
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div id="myPage">
		<div id="myInfo">
			<h1>마이시네마</h1>
			<div id="name"><span>${member.name }</span>님 환영합니다!
			<span id="userRank_span">회원 등급 | ${member.userRank }</span>
			</div>
		</div>
		<div id="myNav">
			<ul>
				<li>예매/구매내역</li>
				<li>무비 히스토리</li>
				<li>나의 문의 내역</li>
				<li>나의 정보 관리</li>
			</ul>
		</div>
		<div id="selectMenu">
			
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>