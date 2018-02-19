<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	#addDiv{
		width:1024px;
		margin:0 auto;
		text-align: center;
	}
	#infoTable{
		width:100%;
		border-collapse:collapse;
		font-size: 1.1em;
	}
	#infoTable th{
		width: 100px;
	}
	#infoTable th,td{
		border:1px solid black;
		padding: 10px;
	}
	#infoTable tr td{
		text-align: left;
		width:400px;
	} 
	#insert{
		margin-top: 20px;
	}
	#insert input[type="button"]{
		font-size: 15px;
		background: #EFEBDB;
		padding: 5px 10px;
		color: black;
	}
	h2{
		width: 1024px;
		margin: 0 auto;
		margin-bottom: 20px;
	}
	
</style>
</head>
<body>
	<jsp:include page="../include/adminHeader.jsp"></jsp:include>

	<div id="addDiv">
		<h2>${movie.movieName} 상세보기</h2>
		<table id="infoTable">
			<tr>
				<th>영화제목</th>
				<td>${movie.movieName}</td>
			</tr>
			<tr>
				<th>감독</th>
				<td>${movie.director }</td>
			</tr>
			<tr>
				<th>배우</th>
				<td>${movie.actor }</td>
			</tr>
			<tr>
				<th>장르</th>
				<td>${movie.genre }</td>
			</tr>
			<tr>
				<th>관람등급</th>
				<td>${movie.rating }</td>
			</tr>
			<tr>
				<th>상영시간</th>
				<td>${movie.playTime }</td>
			</tr>
			<tr>
				<th>줄거리</th>
				<td>${movie.synopsis }</td>
			</tr>
			<tr>
				<th>개봉일</th>
				<td>${openDate}</td>
			</tr>
			<tr>
				<th>종료일</th>
				<td>${closeDate }</td>
			</tr>
			<tr>
				<th>포스터</th>
				<td>${movie.pathPoster }</td>
			</tr>
			<tr>
				<th>스틸컷</th>
				<td>${movie.pathSteelcut }</td>
			</tr>
			<tr>
				<th>동영상</th>
				<td>${movie.pathVideo }</td>
			</tr>
		</table>
		<hr>
		<p id="insert">
			<a href="managerUpdateMovie.do?no=${movie.movieNo }"><input type="button" value="수정"></a>
			<a href="managerDeleteMovie.do?no=${movie.movieNo }"><input type="button" value="삭제"></a>
		</p>
	</div>
   
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>