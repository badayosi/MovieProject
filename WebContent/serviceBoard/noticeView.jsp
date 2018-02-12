<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
	#search_wrap{
		width:1024px;
		min-height: 600px;
		margin: 0 auto;
	}
	#search_wrap #search_top_div{
		height:30px;
		line-height: 30px;
		overflow:hidden;
	}
	#search_wrap #search_top_div #search_val{
		height:28px;
		float:left;
	}
	#search_wrap input{
		height:25px;
		padding:0;
		border:1px solid #ccc;
		float:left;
	}
	#search_top_div #search_btn{
		height:26px;
		padding:2px;
		
		width:40px;
		background: #231f20;
		color:white;
		font-weight:bold;
	}
	#tablewrap{
		width:100%;
	}
	#tablewrap #notice_table{
		width:100%;
		text-align: center;
		border-collapse: collapse;
	}
	#header_table{
		border-top:1px solid black;
		border-bottom: 1px solid black;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function(){
	
	})
</script>
</head>
<body>
	<div id="search_wrap">
		<div id="search_top_div">
			<select name="search_val" id="search_val">
				<option selected="selected">제목</option>
				<option selected="selected">내용</option>
				<option selected="selected">제목+내용</option>
			</select>
			<input type="text" id="search">
			<a href="#"><input type="button" id="search_btn" value="검색"></a>
		</div>
		<div id="tablewrap">
			<table id="notice_table">
				<tr id="header_table">
					<th>번호</th>
					<th>제목</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>