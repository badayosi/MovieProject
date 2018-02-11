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
		margin:15px 0;
		
	}
	#serviceUserWrap #serviceMenu li{
		width:48%;
		height:45px;
		line-height: 45px;
		margin-left:1px;
		float:left;
		list-style:none;
		background: #efebdb;
		color:#231f20;
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
	h3{
		margin-top:30px;
		padding:5px;
		border-bottom:1px solid black;
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
</style>
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
		<p><span id="boldSpan">문의사항이나 불편사항은 이 곳에 남겨주세요. 최대한 빠른 시간 안에 답변 드리겠습니다.</span></p>
		<p><span id="graySpan">금요일 오후 6시 이후 접수된 문의는 그 다음주에 처리될 수 있습니다. FAQ를 이용하시면 궁금증을 더 빠르게 해결하실 수 있습니다.</span></p>
		<h3>문의 하기</h3>
		<form action="serviceInsert.do" method="post" id="service_form">
			<p class="service_div">
				<label>문의종류</label>
				<span class="lineSpan"></span>
				<input type="radio" value="문의" name="consulting"><span class="radioBtn">문의</span>
				<input type="radio" value="칭찬" name="consulting"><span class="radioBtn">칭찬</span>
				<input type="radio" value="불만" name="consulting"><span class="radioBtn">불만</span>
				<input type="radio" value="건의" name="consulting"><span class="radioBtn">건의</span>
			</p>
			<p class="service_div">
				<label>분류</label>
				<span class="lineSpan"></span>
				<select name="classification">
					<option selected="selected">분류 선택</option>
					<option>상영관 문의</option>
					<option>영화 문의</option>
					<option>회원및 포인트 문의</option>
					<option>결제 및 관람권 문의</option>
					<option>홈페이지 이용 문의</option>
				</select>
			</p>
			<p class="service_div">
				<label>제목</label>
				<span class="lineSpan"></span>
				<input type="text" name="title" id="titleInput">
			</p>
			<p class="service_div" id="contentWrap">
				<label>내용</label>
				<span class="lineSpan" id="contentLine"></span>
				<textarea rows="" cols="" name="content" id="content_ta"></textarea>
			</p>
			<p id="btnGroup">
				<input type="button" value="취소" id="cencelBtn">
				<input type="submit" value="확인" id="submitBtn">
			</p>
		</form>
	</div>
		
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
