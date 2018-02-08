<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	div#container{
		width:1024px;
		min-height:600px;
		margin:0 auto;
		background:#F9F6EC;
	}
	
	table, th, tr, td{
		border:1px solid black;
		border-collapse:collapse;
	}
	
	/* 가로형 달력 CSS */
	div#horizontal_calendar{
		width:100%;
	}
	div#horizontal_calendar > p{
		padding:0;
	}
	div#horizontal_calendar #month{
		font-size:2.5em;
		font-weight:bold;
		margin-left:100px;
	}
	div#horizontal_calendar #year{
		margin-left:15px;
	}
	div#calendar_day{
		width:90%;
		margin:0 auto;
	}
	div#calendar_day > table{
		width:100%;
	}
	div#calendar_day td{
		text-align:center;
		width:7%;
	}
	div#calendar_day tr#integer td{
		font-size:20px;
		height:40px;
	}
	div#calendar_day tr#integer td p{
		text-align:center;
		padding:0;
		margin:0 auto;
	}	
	.today{
		width:30px;
		height:30px;
		margin:0 auto;
		padding:0px;
		border:1px solid black;
		border-radius:20px;
		color:white;
		background:black;
	}
	
	/* 예약 */
	div#reservation_box{
		width:100%;
	}
	div#reservation_box span.title{
		font-size:1.5em;
		font-weight:bold;
	}
	div#reservation_box span.guide{
		font-size:1em;
		float:right;
	}
	div#reservation_box tr{
		height:80px;
	}
	div#reservation_box td{
		padding:10px;
	}
	td.td_movie{
		width:350px;
		line-height:40px;
	}
	td.td_theater{
		width:674px;
		line-height:40px;
	}
	ul#rangeList{
		width:100%;
		list-style:none;
		margin:0;
		padding-left:10px;
	}
	ul#rangeList > li{
		float:left;
		padding-left:5px;
		padding-right:5px;
		margin-left:10px;
	}
	td#movieList{
		height:500px;
	}
</style>

<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function(){
		$("#integer td").on("click",function(){
			$("#integer td p").removeClass("today");
			$(this).find("p").toggleClass("today");
		});
	});
</script>

</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div id="container">
		<div id="horizontal_calendar">
			<p><span id="month">2</span><span id="year">2018</span></p>
			<div id="calendar_day">
				<table>
					<tr id="string">
						<td>수</td>
						<td>목</td>
						<td>금</td>
						<td>토</td>
						<td>일</td>
						<td>월</td>
						<td>화</td>
						<td>수</td>
						<td>목</td>
						<td>금</td>
						<td>토</td>
						<td>일</td>
						<td>월</td>
						<td>화</td>
					</tr>
					<tr id="integer">
						<td><p>7</p></td>
						<td><p>8</p></td>
						<td><p>9</p></td>
						<td><p>10</p></td>
						<td><p>11</p></td>
						<td><p>12</p></td>
						<td><p class="today">13</p></td>
						<td><p>14</p></td>
						<td><p>15</p></td>
						<td><p>16</p></td>
						<td><p>17</p></td>
						<td><p>18</p></td>
						<td><p>19</p></td>
						<td><p>20</p></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="reservation_box">
			<table>
				<tr>
					<td class="td_movie"><span class="title">영화</span><span class="guide">최대 3편까지 선택가능</span></td>
					<td class="td_theater"><span class="title">상영시간</span><span class="guide">예고편 상영 등으로 시작이 10여분정도 차이날 수 있습니다.</span></td>
				</tr>
				<tr>
					<td>
						<ul id="rangeList">
							<li>예매순</li>
							<li>평점순</li>
							<li>가나다순</li>
						</ul>
					</td>
					<td rowspan="2" class="td_theater">상영관리스트</td>
				</tr>
				<tr>
					<td id="movieList">영화목록 나올곳</td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>