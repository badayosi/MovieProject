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
		min-height:600px;
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
	#checkpwWrap{
		position: absolute;
		top:30%;
		left:28%;
		display: none;
	}
	#checkpwWrap #formdiv{
		width:500px;
		height:150px !important;
		position: relative;
		background: #EFEBDB;
	}
	#checkpwWrap #formdiv p#p1 {
		position: absolute;
		top:45px;
		left:50px;
		padding:10px;
		font-size:20px;
		
	}
	#checkpwWrap #formdiv p#p1 input{
		padding:5px;
		font-size:17px;
	}
	#checkpwWrap #formdiv p#p2 {
		position: absolute;
		top:55px;
		left:350px;
	}
	#checkpwWrap #formdiv p#p2 input{
		width:60px;
		height:37px;
		padding: 5px;
		background: #231f20;
		border:none;
		color:#cdc197;
	}
	
	
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#myNav ul li").click(function(){
			$("#myNav ul li").not($(this)).removeClass("select_menu");
			$(this).addClass("select_menu");
			if($(this).text()=="나의 문의 내역"){
				$("#checkpwWrap").css("display","none");
				$("#password").val("");
				$("#selectMenu").load("myNotice.jsp");
			}else if($(this).text()=="나의 정보 관리"){
				$("#selectMenu").empty();
				$("#checkpwWrap").css("display","block");
			}else if($(this).text()=="예매/구매내역"){
				$("#checkpwWrap").css("display","none");
				$("#password").val("");
				$("#selectMenu").load("myReservation.jsp");
			}else if($(this).text()=="무비 히스토리"){
				$("#checkpwWrap").css("display","none");
				$("#password").val("");
				$("#selectMenu").load("myMovieHistory.jsp");
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
		$(document).on("click","#addrSearchBtn",function(){
			$("#searchWarp").css("display","block");
			$("#resultAddrWrap div").not("#zxc").remove();
		})
		$(document).on("click","#searchWarp #search_cencel",function(){
			$("#searchWarp").css("display","none");
			$("#doro").val("");
		 })
		$(document).on("click","#doroSearchWrap",function(){
			 searchDoro();
		 })
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
		$("#passwordCheckedBtn").click(function(){
			var password = $("#password").val();
			var userId = $("#userId").val();
			$.ajax({
				url:"mynoticecheckpass.do",
				type:"get",
				data:{"password":password,
					"userId":userId},
				dataType:"json",
				success:function(json){
					console.log(json);
					if(json == null){
						alert("비밀번호가 틀렸습니다.");
						$("#password").focus();
					}else{
						$("#checkpwWrap").css("display","none");
						$("#selectMenu").load("myInfo.jsp");
					}
				}
				
			})
		})
		$(document).on("click","#updateBtn",function(){
			
			var addr = "("+$("#zipcode").val()+")"+$("#addr").val()+"/"+$("#addrUser").val();
			var email = $("#userEmail").val();
			var tel = $("#telSelect").val()+"-"+$(".telinput").eq(0).val()+"-"+$(".telinput").eq(1).val();
			var userId = $("#userId").val();
			
			$.ajax({
				url:"myinfoupdate.do",
				type:"get",
				data:{"addr":addr,
					"email":email,
					"tel":tel,
					"userId":userId},
				dataType:"json",
				success:function(json){
					console.log(json);
					if(json.result ==0){
						alert("수정되었습니다.");
						$("#selectMenu").load("myInfo.jsp");
					}else{
						alert("예상치 못한 오류가 발생하였습니다.");
					}
				}
			})
		})
		$(document).on("click","#passwordBtn",function(){
			var reg =/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
			
			if(!reg.test($("#userPwnew").val())){
				alert("8자이상 영문/숫자/특수문자를 조합하세요");
				return false;
			}else if($("#userPwnew").val() != $("#userPwch").val()){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			
			var pass = $("#userPwnew").val();
			var userId = $("#userId").val();
			$.ajax({
				url:"myinfopasswordupdate.do",
				type:"get",
				data:{"pass":pass,
					"userId":userId},
				dataType:"json",
				success:function(json){
					console.log(json);
					if(json.result ==0){
						alert("비밀번호가 변경되었습니다.");
						$("#selectMenu").load("myInfo.jsp");
					}else{
						alert("예상치 못한 오류가 발생하였습니다.");
					}
				}
			})
			
		})
		$(document).on("click","#deleteUpdate_img",function(){
			if(confirm("정말 탈퇴하시겠습니까?")){
				var userId = $("#userId").val();
				alert("이벤트 발생");
				$.ajax({
					url:"myinfodelete.do",
					type:"get",
					data:{"userId":userId},
					dataType:"json",
					success:function(json){
						alert("이용해 주셔서 감사합니다.");
						location.href="/MovieProject/index.jsp";
					}
				})
			}
		})
		$(document).on("click",".xmark_img",function(){
			if(confirm("예매를 취소하시겠습니까?")){
				
				var no = $(this).prev().find(".reservationNo").text();
				$.ajax({
					url:"myReservationdelete.do",
					type:"get",
					data:{"no":no},
					success:function(){
						alert("예매를 취소하였습니다.");
						$("#selectMenu").load("myReservation.jsp");
					}
				})
			}else{
				
			}
		})
	})
function searchDoro(){
		var doro = $("#doro").val();
		 if(doro ==""){
			 alert("도로명을 입력해주세요");
			 return false;
		 }
		 $("#resultAddrWrap div").not("#zxc").remove();
		 
		 $.ajax({
				url:"joinaddr.do",
				type:"get",
				data:{"doro":doro},
				dataType:"json",
				success:function(json){
					console.log(json)
					if(json.length==0){
						var div = "<div class='searchResult hoverResult'>";
						var zipcode = "<p class='seacrch_zipcode'></p>";
						var addr ="<p class='seacrch_addr'>검색 결과가 없습니다.</p>";
						div += zipcode+addr +"</div>";
						$("#resultAddrWrap").append(div);
						return;
					} 
					for(var i=0; i<json.length; i++){
						var div = "<div class='searchResult hoverResult'>";
						var zipcode = "<p class='seacrch_zipcode'>"+json[i].addrNo+"</p>";
						var addr ="<p class='seacrch_addr'>"+json[i].sido+" "+json[i].sigungu+" "+json[i].doro
								+" "+json[i].building1+json[i].building2+"</p>";
						div += zipcode + addr +"</div>";
						$("#resultAddrWrap").append(div);

					}
				}
				
		})
		
		
}
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
		<div id="checkpwWrap">
			<div id="formdiv">
				<p id="p1">
					<label>비밀번호 </label>
					<input type="password" id="password">
					<input type="hidden" id="userId" value="${member.userId}">
				</p>
				<p id="p2">
					<input type="button" value="확인" id="passwordCheckedBtn">
				</p>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>