<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style type="text/css">
	#updateDiv{
		width:40%;
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
		width:400px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#updateForm").submit(function(){
			var formAction=$("#updateForm").attr("action");
			var poster=$("input[name='moviePoster']").val();
			var video=$("input[name='movieVideo']").val();
			
			var steelcutStr = "";
			for(var i =0; i< $("#steelcut").get(0).files.length; i++){
				steelcutStr += $("#steelcut").get(0).files[i].name + ",";
			}
			$("input[type='hidden']").val(steelcutStr);
			
			alert(formAction);
			if(poster!=null||video!=null||steelcutStr!=null){
				$("#updateForm").attr("action", formAction+"&yes=1");
			}
		});
		
	});
</script>
</head>
<body>
   <jsp:include page="../include/managerHeader.jsp"></jsp:include>

<div id="updateDiv">
	<form id="updateForm" method="post" action="managerUpdateMovie.do?mNo=${movie.movieNo}" enctype="multipart/form-data">
		<table id="infoTable">
			<tr>
				<th>영화제목</th>
				<td><input type="text" name="movieName" value="${movie.movieName}"></td>
			</tr>
			<tr>
				<th>감독</th>
				<td><input type="text" name="movieDirector" value="${movie.director }"></td>
			</tr>
			<tr>
				<th>배우</th>
				<td><input type="text" name="movieActor" value="${movie.actor }"></td>
			</tr>
			<tr>
				<th>장르</th>
				<td><input type="text" name="movieGenre" value="${movie.genre }"></td>
			</tr> 
			<tr>
				<th>관람등급</th>
				<td><input type="text" name="movieRating" value="${movie.rating }"></td>
			</tr>
			<tr>
				<th>상영시간</th>
				<td><input type="text" name="moviePlaytime" value="${movie.playTime }"></td>
			</tr>
			<tr>
				<th>줄거리</th>
				<td><textarea rows="15" cols="55" name="movieSynopsis">${movie.synopsis }</textarea></td>
			</tr>
			<tr>
				<th>개봉일</th>
				<td><input type="date" name="movieOpenDate" value="${openDate}"></td>
			</tr>
			<tr>
				<th>종료일</th>
				<td><input type="date" name="movieEndDate" value="${closeDate }"></td>
			</tr>
			<tr>
				<th></th>
				<td>※수정할 파일이 없을 시 선택하지 말고 그대로 저장해주세요※<br>파일 수정을 하려면 모든파일을 새로 올려야 합니다. 파일 하나만 수정은 안됩니다.</td>
			</tr>
			<tr>
				<th>포스터</th>
				<td><input type="file" name="moviePoster"  value="${movie.pathPoster }"></td>
			</tr>
			<tr>
				<th>스틸컷</th>
				<td><input type="file" id="steelcut" multiple name="movieSteelCut[]" value="${movie.pathSteelcut }"></td>
			</tr>
			<tr>
				<th>동영상</th>
				<td><input type="file" name="movieVideo"  value="${movie.pathVideo }"></td> 
			</tr>
		</table>
		<hr>
		<input type="hidden" name="movieSteelCut" value="">
		<input type="submit" value="수정">
		<a href="managerReadMovie.do"><input type="button" value="취소"></a>
	</form>	
</div>
   
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>