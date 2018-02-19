<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
	#managerboard_wrap{
		width:1024px;
	}
	#managerboard_wrap #list_board_table{
		width:90%;
		padding:20px;
		border-collapse: collapse;
		border-color:#ccc;
		
	}
	#managerboard_wrap #list_board_table tr,#managerboard_wrap #list_board_table tr td{
		text-align: center;
	}
	.hidden_span{
		display: none;
	}
	.titleClick:HOVER{
		background: yellow;
		cursor:pointer;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$.ajax({
			url:"managerserviceboardlist.do",
			type:"get",
			success:function(json){
				console.log(json);
				$("#list_board_table").not("#list_bar").remove("tr");
				if(json.length !=0){
					for(var i=0; i< json.length; i++){
						var tr="<tr>";
						var hiddenspan = "<span class='hidden_span'>"+json[i].boardNo+"</span>"
						var tdConsulting="<td>"+json[i].consulting+"</td>";
						var tdClassification="<td>"+json[i].classification+"</td>";
						var tdUserId="<td>"+json[i].userId+"</td>";
						var tdTitle="<td class='titleClick'>"+hiddenspan+json[i].title+"</td>";
						var date = new Date(json[i].regdate);
						var tdRegdate="<td>"+date.toLocaleDateString()+"</td>";
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
</script>
</head>
<body>
	<div id="managerboard_wrap">
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