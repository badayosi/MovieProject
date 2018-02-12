<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	#gartSpan{
		
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
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#service_form").submit(function(){
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
			if($(this).text()=="공지사항"){
				$("#sss").load("noticeView.jsp");	
			}else{
				$("#sss").load("ServiceUserBoardView.jsp");	
			}
			
			
		})
	})
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
