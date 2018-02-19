<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style type="text/css">
	/* #addDiv{
		width:1024px;
		margin:0 auto;
		text-align: center;
	}
	#addDiv #addForm{
		width:100%;
		margin:0 auto;
		text-align: center;
	}
	#infoTable{
		width:100%;
		border-collapse:collapse;
		font-size: 1.1em;
	}
	#infoTable th,td{
		border:1px solid black;
		padding: 10px;
	}
	#infoTable th{
		width:150px;
	}
	#infoTable tr td{
		text-align: left;
	}
	input[type='text']{
		width:400px;
	}
	#insert{
		margin-top: 20px;
	}
	#insert input[type="submit"],#insert input[type="button"]{
		font-size: 15px;
		background: #EFEBDB;
		padding: 5px 10px;
		color: black;
	} */
	
	#updateDiv{
		width:1024px;
		margin:0 auto;
		text-align: center;
	}
	#updateDiv #updateForm{
		width:100%;
		margin:0 auto;
		text-align: center;
	}
	#infoTable{
		width:100%;
		/* border-collapse:collapse; */
		font-size: 1.1em;
	}
	#infoTable th,td{
		/* border:1px solid black; */
		padding: 10px;
	}
	#infoTable th{
		width:150px;
	}
	#infoTable tr td{
		text-align: left;
	}
	input[type='text']{
		width:700px;
		height: 20px;
	}
	
	#insert{
		margin-top: 20px;
	}
	#insert input[type="submit"],#insert input[type="button"]{
		font-size: 15px;
		background: #EFEBDB;
		padding: 5px 10px;
		color: black;
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#addForm").submit(function(){
			
			var steelcutStr = "";
			for(var i =0; i< $("#a").get(0).files.length; i++){
				steelcutStr += $("#a").get(0).files[i].name + ",";
			}
			$("input[type='hidden']").val(steelcutStr);
			var content=$("textarea[name='movieSynopsis']").val().replace(/(?:\r\n|\r|\n)/g, '<br />');
			alert(content);
			$("textarea[name='movieSynopsis']").val(content);
		});
	});
</script>
</head>
<body> 
	<jsp:include page="../include/adminHeader.jsp"></jsp:include>
<div id="updateDiv">
	<h2>영화 추가</h2>
	<br>
	<form id="addForm" method="post" action="managerAddMovie.do" enctype="multipart/form-data">
		<table id="infoTable">
			<tr>
				<th>영화제목</th>
				<td><input type="text" name="movieName"></td>
			</tr>
			<tr>
				<th>감독</th>
				<td><input type="text" name="movieDirector"></td>
			</tr>
			<tr>
				<th>배우</th>
				<td><input type="text" name="movieActor"></td>
			</tr>
			<tr>
				<th>장르</th>
				<td><input type="text" name="movieGenre"></td>
			</tr>
			<tr>
				<th>관람등급</th>
				<td><input type="text" name="movieRating"></td>
			</tr>
			<tr>
				<th>상영시간</th>
				<td><input type="text" name="moviePlaytime"></td>
			</tr>
			<tr>
				<th>줄거리</th>
				<td><textarea rows="15" cols="98" name="movieSynopsis"></textarea></td>
			</tr>
			<tr>
				<th>개봉일</th>
				<td><input type="date" name="movieOpenDate"></td>
			</tr>
			<tr>
				<th>종료일</th>
				<td><input type="date" name="movieEndDate"></td>
			</tr>
			<tr>
				<th>포스터</th>
				<td><input type="file" name="moviePoster"></td>
			</tr>
			<tr>
				<th>스틸컷</th>
				<td><input id="a" type="file" multiple name="movieSteelCut[]"></td>
			</tr>
			<tr>
				<th>동영상</th>
				<td><input type="file" name="movieVideo"></td>
			</tr>
		</table>
		<br>
		<hr>
		<p id="insert">
			<input type="hidden" name="movieSteelCut" value="">
			<input type="submit" value="등록">
			<a href="managerListMovie.do"><input type="button" value="취소"></a>
		</p>
	</form>	
</div>
   
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>