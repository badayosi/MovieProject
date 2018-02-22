<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#myNotice_wrap{
		width:1024px;
		margin:0 auto;
	}
	#myNotice_header{
		margin:0 auto;
		width: 974px;
		background: #f5f5f5;
		margin:0 auto;
		padding:20px 0 20px 50px;
		margin-bottom:20px;
		overflow: hidden;
	}

	#myNotice_header p label{
		width:70px;
		float:left;
	}
	#myNotice_header p #mynotice_title{
		height:35px;
		width:300px;
		border:none;
		padding-left:10px;
	}
	#myNotice_header p #mynotice_submit{
		width:50px;
		height:35px;
		padding:5px;
		color:white;
		background: black;
		border:none;
	}
	#notice_table{
		border-collapse: collapse;
	}
	#header_table {
		border-top: 2px solid #c0c0c0;
		border-bottom: 2px solid #c0c0c0 !important;
		padding: 10px;
	}
	#header_table th, td {
		height: 40px !important;
	}
	td{
		border-bottom:1px solid #c0c0c0;
	}
	#th1 {
		width: 10%;
	}
	
	#th2 {
		width: 20%;
	}
	
	#th3 {
		width: 40%;
	}
	
	#th4 {
		width: 20%;
	}
	#th5 {
		width: 10%;
	}
	#notice_table{
		width:100%;
		text-align: center;
	}
	.linetext {
		border-right: 1px solid #ccc;
		display: block;
		height: 10px;
		line-height: 10px;
	}
	.table_title{
		text-align: left;
		cursor: pointer;
	}
	#selectNoticeWrap {
		width: 1024px;
		margin: 0 auto;
		overflow: hidden;
		display: none;
	}

	#selectHeader {
		margin-top: 30px;
		border-top: 2px solid #ccc;
		width: 962px;
		padding:31px 30px 0px 30px;
	}
	#selectHeader h4{
		margin-bottom:7px;
	}
	#notice_ul {
		width: 40%;
		padding: 0;
		overflow: hidden;
		margin:0;
		margin-bottom:10px;
		font-size: 12px;
	}
	
	#notice_ul li {
		float: left;
		list-style: none;
		color: black;
	}
	
	#regdate_Li {
		width: 50%;
		display: inline-block;
	}
	
	#readcount_li {
		width: 20%;
		font-size: 12px;
	}
	
	#linespan {
		display: inline-block;
		height: 10px;
		border-right: 1px solid #ccc;
		margin: 0 10px;
		margin-left: 55px;
	}
	
	#selectContent {
		width: 100%;
		
	}
	
	#selectContent p {
		padding: 50px 30px;
		background: #f5f5f5;
		font-size: 12px;
		border-top: 1px solid #c0c0c0;
		border-bottom: 1px solid #c0c0c0;
		margin-bottom:20px;
	}
	#answer_wrap {
		width: 100%;
		display:none;
	}
	
	#answer_wrap p {
		padding: 50px 30px;
		background: #f5f5f5;
		font-size: 12px;
		border-top: 1px solid #c0c0c0;
		border-bottom: 1px solid #c0c0c0;
	}
	#listBtnWrap{
		margin:0 auto;
		text-align: center;
	}
	#listBtnWrap #listBtn{
		margin-top:15px;
		width:100px;
		height:50px;
		font-size:16px;
		color:#cdc197;
		background: #231f20;
		border:1px solid #231f20;
		cursor: pointer;
	}
	#listBtnWrap #deleteBtn{
		margin-top:15px;
		width:100px;
		height:50px;
		font-size:16px;
		border: 1px solid #999;
    	background: #fff;
   		color: #231f20;
		cursor: pointer;
	}
	#answer_wrap_h4{
		margin-bottom:15px;
		padding-left:30px;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		startlist();
		$("#listBtn").click(function(){
			$("#selectNoticeWrap").css("display","none"); 
			$("#myNotice_wrap").css("display","block");
		});
		$(document).on("click","#deleteBtn",function(){
			if(confirm("문의글을 삭제하시겠습니까?")){
				var no = $("#hidNo").val();
				 $.ajax({
					url:"mynoticedelete.do",
					type:"get",
					data:{"no":no},
					success:function(){
						alert("삭제되었습니다.");
						startlist();
						$("#selectNoticeWrap").css("display","none"); 
						$("#myNotice_wrap").css("display","block");
					}
					
				})
			}
		})
	})
function startlist(){
		var userId = $("#userId").val();
		$.ajax({
			url:"mynoticelist.do",
			type:"get",
			data:{"userId":userId},
			dataType:"json",
			success:function(json){
				$("#notice_table tr").not("#header_table").remove("tr");
				
				if(json.length==0){
					var nodata = "<tr><td colspan='5'>등록된 문의가 없습니다.</td></tr>";
					$("#notice_table").append(nodata);
				}else{
					for(var i=0; i< json.length; i++){
						var tr = "<tr>";
						var tdNo = "<td class='boardNo'>"+json[i].boardNo+"</<td>";
						var tdclassification = "<td>"+json[i].classification+"</<td>";
						var tdtitle = "<td class='table_title'>"+json[i].title+"</<td>";
						var date = new Date(json[i].regdate);
		                var month = date.getMonth()+1;
		                var tdRegdate="";  
		                if(month.length=1){
		                	tdRegdate+="<td>"+date.getFullYear()+"-0"+(month)+"-"+date.getDate()+"</td>";
		                }else{
		                	tdRegdate+="<td>"+date.getFullYear()+"-"+(month)+"-"+date.getDate()+"</td>";
		                }
						var tdanswer = "";
						if(json[i].answer){
							tdanswer = "<td>처리완료</td>"
						}else{
							tdanswer = "<td>처리중</td>"
						}
						tr += tdNo + tdclassification +tdtitle + tdRegdate + tdanswer;
						$("#notice_table").append(tr);
					}
				}
			}
		});		
}
</script>
</head>
<body>
	<div id="myNotice_wrap">
		<input type="hidden" value="${member.userId }" id="userId">
		<div id="myNotice_header">
				<p>
					<label>검색</label>
					<input type="text" name="title" placeholder="제목을 입력하세요" id="mynotice_title">
					<input type="button" value="검색" id="mynotice_submit">
				</p>
		</div>
		<div id="table_wrap">
			<table id="notice_table">
				<tr id="header_table">
					<th id="th1" ><span class="linetext">번호</span></th>
					<th id="th2"><span class="linetext">분류</span></th>
					<th id="th3"><span class="linetext">제목</span></th>
					<th id="th4"><span class="linetext">등록일</span></th>
					<th id="th5">처리상태</th>
				</tr>
			</table>
		</div>
	</div>
	
	<div id="selectNoticeWrap">
			<div id="selectHeader">
				<h4 id="title_h4">시스템 점검안내</h4>
				<ul id="notice_ul">
					<li id="regdate_Li"><b>등록일 : </b> 2018-02-06 <span id="linespan"></span></li>
				</ul>
			</div>
			<div id="selectContent">
				<p>콘텐츠</p>
			</div>
			<div id="answer_wrap">
				<h4 id='answer_wrap_h4'>답변</h4>
				<p></p>
			</div>
			<div id="listBtnWrap">
				<button id="deleteBtn">삭제</button>
				<button id="listBtn">목록</button>
			</div>
	</div>
</body>
</html>