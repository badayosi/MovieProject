<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#addDiv{
		width:40%;
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
</head>
<body>
   <jsp:include page="../include/managerHeader.jsp"></jsp:include>

<div id="addDiv">
	<form id="addForm" method="post" action="managerAddMovie.do">
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
				<th>포스터</th>
				<td><input type="file" name="moviePoster"  value="${movie.pathPoster }"></td>
			</tr>
			<tr>
				<th>스틸컷</th>
				<td><input type="file" multiple="multiple" name="movieSteelCut"  value="${movie.pathSteelcut }"></td>
			</tr>
			<tr>
				<th>동영상</th>
				<td><input type="file" name="movieVideo"  value="${movie.pathVideo }"></td>
			</tr>
		</table>
		<hr>
		<input type="submit" value="수정">
		<a href="managerListMovie.do"><input type="button" value="취소"></a>
	</form>	
</div>
   
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>