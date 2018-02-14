<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/common.css">
<title>Insert title here</title>
<style>
	#serviceUserWrap{
		width: 1024px;
		min-height: 600px;
		margin: 0 auto;
	}
	#serviceUserWrap #serviceMenu{
		width:100%;
		overflow: hidden;
		
		text-align:center;
		margin:15px auto;
		
	}
	#serviceUserWrap #serviceMenu li{
		width:49.9%;
		height:45px;
		line-height: 45px;
		margin-left:1px;
		float:left;
		list-style:none;
		background: #efebdb;
		color:#231f20;
		cursor: pointer;
	}
	p{
		font-size:14px;
		color:#777;
	}
	#boldSpan{
		font-weight: bold;
		color:black;
	}
	
	#h2text{
		margin:30px 0;
	}
	.service_div{
		height:20px;
		line-height: 20px;
		overflow:hidden;
		padding:20px;
		border-bottom:1px solid #ccc;
	}
	.service_div label{
		width: 120px;
		font-size: 15px;
		float:left;
		color: #231f20;
		font-weight:bold;
		height:10px;
		
	}
	.service_div .lineSpan{
		display:inline-block;
		height:10px;
		border-right:1px solid #ccc;
		margin:0 10px;
		
	}
	.service_div input{
		font-size:14px;
		color:#231f20;
		background: #f5f5f5;
		outline: none;
		border: 1px solid #f5f5f5;
		padding:5px;
	}
	.service_div select{
		width:170px;
	}
	
	#titleInput{
		width:790px;
		
	}
	.service_div span.radioBtn{
		font-size:16px;
		margin-right:15px;
	}
	#content_ta{
		width:800px;
		height:180px;
		resize: none;
		margin-left:27px;
		border: 1px solid #f5f5f5;
		outline:none;
		background: #f5f5f5;
	}
	#contentWrap{
		height:200px;position: relative;
	}
	#contentLine{
		position: absolute;
		top:25px;
		left:140px;
	}
	#btnGroup{
		text-align: center;
		height:40px;
		line-height: 20px;
		overflow:hidden;
		padding:20px;
		
	}
	#btnGroup #cencelBtn,#btnGroup #submitBtn{
		width:80px;
		height:40px;
		line-height: 40px;
		font-weight: bold;
		cursor: pointer;
		
	}
	#btnGroup #cencelBtn{
		color: #231f20;
		background: #fff;
		border:1px solid  #231f20;
		margin-right:5px;
	}
	#btnGroup #submitBtn{
		color: #cdc197;
		background: #231f20;
		border:1px solid  #231f20;
	}
	
	#fileInput{
		background: white;
		cursor:pointer;
		z-index:9999;
	}
	.redstar{
		color:red;
	}
	#serviceheaderWrap{
		width:100%;
		margin-top:30px;
		border-bottom:1px solid black;
		overflow:hidden;
	}
	#serviceheaderWrap h3{
		float:left;
		padding:5px;
		width:60%;
	}
	#serviceheaderWrap p{
		width:30%;
		float:right;
		padding:5px;
		
	}
	.hidden_span{
		display:none;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(document).on("submit","#service_form",function(){
			if($("select[name='classification']").val() =="분류 선택"){
				alert("분류를 선택하세요");
				return false;
			}else if($("input[name='title']").val()==""){
				alert("제목을 입력하세요");
				return false;
			}else if($("textarea[name='content']").val()==""){
				alert("내용을 입력하세요");
				return false;
			}
		})
		$("#serviceMenu ul li").click(function(){
			$("#sss").empty();
			if($(this).text()=="공지사항"){
				$("#sss").load("noticeView.jsp");
			}else{
				$("#sss").load("ServiceUserBoardView.jsp");
			}
		})
		$(document).on("click","#nextTitle, #prevTitle",function(){
			if($(this).text()=="다음 게시글이 없습니다." ||$(this).text()=="이전 게시글이 없습니다." ){
				return;
			}
			var no = $(this).find(".hidden_span").text();
			noticeSelect(no);
		})
		$(document).on("click","#chage_page_ul li img",function(){
			if($(this).next().find("a").text()=="다음 게시글이 없습니다." ||$(this).next().find("a").text()=="이전 게시글이 없습니다." ){
				return;
			}
			var no = $(this).next().find(".hidden_span").text();
			noticeSelect(no);
		})
		$(document).on("click","a.selectNo",function(){
			var no = $(this).parent().prev().text();
			noticeSelect(no);
		})
		$(document).on("click","#listBtn",function(){
			$("#sss").load("noticeView.jsp");
		})
		$(document).on("click","#search_btn",function(){
			var searchText = $("#search").val();
			if(searchText == ""){
				alert("검색어를 입력해주세요.");
				return;
			}
			
			searchSelect(0);
		})
		$(document).on("click", "#numberP a.searchlist", function() {
			var size = Number($(this).text()) - 1;
			searchSelect(size);
		})
	})
function searchSelect(no){
		
		var selectText = $("#search_val").val();
		var searchText = $("#search").val();
		$("tr").not("#header_table").remove();
		$("#numberP").text("");
		$.ajax({
			url:"noticeseach.do",
			type:"get",
			data:{"selectText":selectText,
				"searchText":searchText,
				"no":no},
			success:function(json){
				for (var i = 0; i < json.list.length; i++) {
					var tr = "<tr>"
					var noTd = "<td>" + json.list[i].boardNo + "</td>";
					var titleTd = "<td><a href='#' class='selectNo'>" + json.list[i].title
							+ "</a></td>";
					var date = new Date(json.list[i].regdate);
					var regDateTd = "<td>" + date.toLocaleDateString()
							+ "</td>";
					var readcountTd = "<td>" + json.list[i].readcount
							+ "</td></tr>";
					tr += noTd + titleTd + regDateTd + readcountTd;
					$("#notice_table").append(tr);
				}
				for (var i = 1; i <= json.size; i++) {
					var aTag = "<a href='#' class='searchlist'>" + i + "</a>";
					$("#numberP").append(aTag);
				}
				
			}
		})
	}
function noticeSelect(no){
		$.ajax({
			url:"noticeselectno.do",
			type:"get",
			data:{"no":no},
			dataType:"json",
			success:function(json){
				console.log(json);
				if(json.length == 3){
					$("#title_h4").text(json[1].title);
					var date = new Date(json[1].regdate);
					$("#regdate_Li").html("<b>등록일 :</b>"+date.toLocaleDateString()+"<span id='linespan'></span>");
					$("#readcount_li").html("<b>조회수 :</b>"+json[1].readcount);
					$("#selectContent p").text(json[1].content);
				
					$("#nextTitle").html(json[2].title+"<span class='hidden_span'>"+json[2].boardNo+"</span>");
					$("#prevTitle").html(json[0].title+"<span class='hidden_span'>"+json[0].boardNo+"</span>");
				}else{
					if(json[0].boardNo=="1"){
						$("#title_h4").text(json[0].title);
						var date = new Date(json[0].regdate);
						$("#regdate_Li").html("<b>등록일 :</b>"+date.toLocaleDateString()+"<span id='linespan'></span>");
						$("#readcount_li").html("<b>조회수 :</b>"+json[0].readcount);
						$("#selectContent p").text(json[0].content);
						$("#nextTitle").html(json[1].title+"<span class='hidden_span'>"+json[1].boardNo+"</span>");
						$("#prevTitle").text("이전 게시글이 없습니다.");
					}else{
						$("#title_h4").text(json[1].title);
						var date = new Date(json[1].regdate);
						$("#regdate_Li").html("<b>등록일 :</b>"+date.toLocaleDateString()+"<span id='linespan'></span>");
						$("#readcount_li").html("<b>조회수 :</b>"+json[1].readcount);
						$("#selectContent p").text(json[1].content);
						$("#nextTitle").text("다음 게시글이 없습니다.");
						$("#prevTitle").html(json[0].title+"<span class='hidden_span'>"+json[0].boardNo+"</span>");
					}
				}
				$("#search_wrap").css("display","none");
				$("#selectNoticeWrap").css("display","block");
			}
	})
}
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div id="serviceUserWrap">
		<h2 id="h2text">고객센터</h2>
		<div id="serviceMenu">
			<ul>
				<li>공지사항</li>
				<li>1:1문의</li>
			</ul>
		</div>
		<div id="sss"></div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
