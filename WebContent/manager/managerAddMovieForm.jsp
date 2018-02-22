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
	.error1{
		color: red;
		font-size: 13px;
		display: none;
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#addForm").submit(function(){
			var boolean1 = true;
			
			$("td input[type=text]").each(function(i, obj) {
				if($(this).val() ==""){ 
					boolean1 = false;
					alert($(this).parent().prev().text()+"를 입력해주세요");
					return;
				}
			})
			if(!boolean1){
				return false;
			}else if(boolean1){
				if($("textarea[name='movieSynopsis']").val()==""){
					alert("줄거리를 입력해주세요.")
					return false;
				}else{
					if($("td input[name='movieOpenDate']").val()==""){
						alert("개봉일을 입력해주세요");
						return false;
					}else if($("td input[name='movieEndDate']").val()==""){
						alert("종료일을 입력해주세요");
						return false;
					}else{
						var startdate = new Date($("td input[name='movieOpenDate']").val());
						var enddate = new Date($("td input[name='movieEndDate']").val());
						
						if(startdate.getTime() >= enddate.getTime()){
							alert("개봉일이 종료일보다 이전날짜입니다.");
							return false;
						}
					}
				}
			}
			var steelcutStr = "";
			for(var i =0; i< $("#a").get(0).files.length; i++){
				steelcutStr += $("#a").get(0).files[i].name + ",";
			}
			$("input[type='hidden']").val(steelcutStr);
			var content=$("textarea[name='movieSynopsis']").val().replace(/(?:\r\n|\r|\n)/g, '<br />');
			
			$("textarea[name='movieSynopsis']").val(content);
			
		});
		
		
		$("input[name='moviePlaytime']").change(function(){		
			var num = $(this).val();	
			num = num.charCodeAt(0);
			if(num>47&&num<58){
				$(this).parent().find(".error1").css("display","none");
			}else{
				$(this).val("");
				$(this).parent().find(".error1").css("display","block");
			}
		})
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
				
				<td>
					<select name="movieRating">
						<option value="7">전체관람가</option>
						<option value="12">12세 이상</option>
						<option value="15">15세 이상</option>
						<option value="18">청소년 관람 불가</option>
					</select>
					<!-- <input type="text" name="movieRating"> -->
				</td>
			</tr>
			<tr>
				<th>상영시간</th>
				<td>
					<input type="text" name="moviePlaytime" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
					<span class="error1">숫자만 입력하세요</span>
				</td>
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