<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<style>
	#managerboard_wrap{
		width:1024px;
		overflow:hidden;
	}
	#managerboard_wrap #list_board_table{
		width:1024px;
		padding:20px;
		border-collapse: collapse;
		/* border-color:#ccc; */
	}
	#managerboard_wrap #list_board_table tr,#managerboard_wrap #list_board_table tr td{
		text-align: center;
	}
	table, tr, th, td{
		border: none;
	}
	.hidden_span{
		display: none;
	}
	.removetr:HOVER{
		background: #F6F6F6;
		cursor:pointer;
	}
	#btnselect{
		margin-bottom:10px;
		float:right;
	}
	#btnselect button{
		width:100px !important;
		height: 40px !important;
		background: #231f20;
		color: #cdc197;
		border:none;
		cursor:pointer;
		font-size:14px !important;
	}
	#search_wrap{
		float:left;
	}
	#search_wrap p{
		margin:0;
		padding:0;
		height: 40px;
	}
	#search_wrap p select{
		height:40px;
		width:80px;
		font-size:14px !important;
	}
	#search_wrap p input{
		height:35px;
		width:200px;
		font-size:14px !important;
	}
	#search_wrap p button{
		height:40px;
		width:60px;
		background: #231f20;
		color: #cdc197;
		border:none;
		cursor:pointer;
		font-size:14px !important;
	}
</style>

<link rel="stylesheet" type="text/css" href="/MovieProject/css/manager.css"> 
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		alllist();
		
		$(document).on("click","#allanswer",function(){
			alllist();
		})
		$(document).on("click","#falseanswer",function(){
			booleanlist("false");
		})
		$(document).on("click","#trueanswer",function(){
			booleanlist("true");
		})
		$(document).on("click","#searchBtn",function(){
			var select = $("#select_search").val();
			
			var text = $("#search_input").val();
			$.ajax({
				url:"mynoticesearch.do",
				type:"get",
				data:{"text":text,"select":select},
				dataType:"json",
				success:function(json){
					console.log(json);
					$(".removetr").remove();
					if(json.length !=0){
						for(var i=0; i< json.length; i++){
							var tr="<tr class='removetr'>";
							var hiddenspan = "<span class='hidden_span'>"+json[i].boardNo+"</span>"
							var tdConsulting="<td>"+json[i].consulting+"</td>";
							var tdClassification="<td>"+json[i].classification+"</td>";
							var tdUserId="<td>"+json[i].userId+"</td>";
							var tdTitle="<td class='titleClick'>"+hiddenspan+json[i].title+"</td>";
							var date = new Date(json[i].regdate);
			                var month = date.getMonth()+1;
			                var tdRegdate="";  
			                if(month.length=1){
			                	tdRegdate+="<td>"+date.getFullYear()+"-0"+(month)+"-"+date.getDate()+"</td>";
			                }else{
			                	tdRegdate+="<td>"+date.getFullYear()+"-"+(month)+"-"+date.getDate()+"</td>";
			                }
							
							var tdAnswer = "<td>";
							if(json[i].answer){
								tdAnswer += "O</td>";
							}else{
								tdAnswer += "X</td>";
							}
							tr += tdConsulting + tdClassification + tdUserId + tdTitle + tdRegdate +tdAnswer+ "</tr>";
							$("#list_board_table").append(tr);
						}
					}
				}
			})
			
		})

	})
function alllist(){
		$.ajax({
			url:"managerserviceboardlist.do",
			type:"get",
			dataType:"json",
			success:function(json){
				console.log(json);
				$(".removetr").remove();
				if(json.length !=0){
					for(var i=0; i< json.length; i++){
						var tr="<tr class='removetr'>";
						var hiddenspan = "<span class='hidden_span'>"+json[i].boardNo+"</span>"
						var tdConsulting="<td>"+json[i].consulting+"</td>";
						var tdClassification="<td>"+json[i].classification+"</td>";
						var tdUserId="<td>"+json[i].userId+"</td>";
						var tdTitle="<td class='titleClick'>"+hiddenspan+json[i].title+"</td>";
						var date = new Date(json[i].regdate);
		                var month = date.getMonth()+1;
		                var tdRegdate="";  
		                if(month.length=1){
		                	tdRegdate+="<td>"+date.getFullYear()+"-0"+(month)+"-"+date.getDate()+"</td>";
		                }else{
		                	tdRegdate+="<td>"+date.getFullYear()+"-"+(month)+"-"+date.getDate()+"</td>";
		                }
						
						var tdAnswer = "<td>";
						if(json[i].answer){
							tdAnswer += "O</td>";
						}else{
							tdAnswer += "X</td>";
						}
						tr += tdConsulting + tdClassification + tdUserId + tdTitle + tdRegdate +tdAnswer+ "</tr>";
						$("#list_board_table").append(tr);
					}
				}
			}
		})	
}
function booleanlist(b){
		$.ajax({
			url:"managerserviceboardanswerlist.do",
			data:{"b":b},
			type:"get",
			dataType:"json",
			success:function(json){
				console.log(json);
				$(".removetr").remove();
				if(json.length !=0){
					for(var i=0; i< json.length; i++){
						var tr="<tr class='removetr'>";
						var hiddenspan = "<span class='hidden_span'>"+json[i].boardNo+"</span>"
						var tdConsulting="<td>"+json[i].consulting+"</td>";
						var tdClassification="<td>"+json[i].classification+"</td>";
						var tdUserId="<td>"+json[i].userId+"</td>";
						var tdTitle="<td class='titleClick'>"+hiddenspan+json[i].title+"</td>";
						var date = new Date(json[i].regdate);
		                var month = date.getMonth()+1;
		                var tdRegdate="";  
		                if(month.length=1){
		                	tdRegdate+="<td>"+date.getFullYear()+"-0"+(month)+"-"+date.getDate()+"</td>";
		                }else{
		                	tdRegdate+="<td>"+date.getFullYear()+"-"+(month)+"-"+date.getDate()+"</td>";
		                }
						var tdAnswer = "<td>";
						if(json[i].answer){
							tdAnswer += "O</td>";
						}else{
							tdAnswer += "X</td>";
						}
						tr += tdConsulting + tdClassification + tdUserId + tdTitle + tdRegdate +tdAnswer+ "</tr>";
						$("#list_board_table").append(tr);
					}
				}
			}
		})	
}
</script>
</head>
<body>
	<div id="managerboard_wrap">
		<div id="search_wrap">
			<p>
				<select id="select_search">
					<option>아이디</option>
					<option>제목</option>
				</select>
				<input type="text" id="search_input">
				<button id="searchBtn">검색</button>
			</p>
		</div>
		<div id="btnselect">
			<button id="falseanswer">미완료내역</button>
			<button id="trueanswer">완료내역</button>
			<button id="allanswer">전체보기</button>
		</div>
		<table id="list_board_table" border="1">
			<tr id="list_bar">
				<th>문의종류</th>
				<th>분류</th>
				<th>회원ID</th>
				<th>제목</th>
				<th>날짜</th>
				<th>답글여부</th>
			</tr>
		</table>
	</div>
</body>
</html>