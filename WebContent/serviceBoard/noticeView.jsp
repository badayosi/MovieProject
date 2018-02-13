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
		border-top:2px solid #c0c0c0;
		border-bottom: 2px solid #c0c0c0 !important;
		padding:10px;
	
	}
	#header_table th{
		
	}
	#tablewrap #notice_table tr{
		border-bottom:1px solid #c0c0c0;
		height:45px;
	}
	#tablewrap #notice_table td{
		padding:5px;
	}
	#th1{
		width:10%;
	}
	#th2{
		width:50%;
	}
	#th3{
		width:20%;
	}
	#th4{
		width:20%;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		 listview(0);
	})
function listview(size){
		$.ajax({
			url:"noticelist.do",
			type:"get",
			data:{"size":size},
			dataType:"json",
			success:function(json){
				console.log(json);
				for(var i=0; i<json.list.length; i++){
					var tr = "<tr>"
					var noTd = "<td>"+json.list[i].boardNo+"</td>";
					var titleTd = "<td><a href='#'>"+json.list[i].title+"</a></td>";
					var date = new Date(json.list[i].regdate);
					var regDateTd = "<td>"+date.toLocaleDateString()+"</td>";
					var readcountTd = "<td>"+json.list[i].readcount+"</td></tr>";
					tr += noTd + titleTd + regDateTd + readcountTd;
					$("#notice_table").append(tr);
				}
			}
	 	})
}
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
					<th id="th1">번호</th>
					<th id="th2">제목</th>
					<th id="th3">등록일</th>
					<th id="th4">조회수</th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>