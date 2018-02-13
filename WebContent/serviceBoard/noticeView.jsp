<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
#search_wrap {
	width: 1024px;
	min-height: 600px;
	margin: 0 auto;
}

#search_wrap #search_top_div {
	height: 30px;
	line-height: 30px;
	overflow: hidden;
}

#search_wrap #search_top_div #search_val {
	height: 28px;
	float: left;
}

#search_wrap input {
	height: 25px;
	padding: 0;
	border: 1px solid #ccc;
	float: left;
}

#search_top_div #search_btn {
	height: 26px;
	padding: 2px;
	width: 40px;
	background: #231f20;
	color: white;
	font-weight: bold;
}

#tablewrap {
	width: 100%;
}

#tablewrap #notice_table {
	width: 100%;
	text-align: center;
	border-collapse: collapse;
}

#header_table {
	border-top: 2px solid #c0c0c0;
	border-bottom: 2px solid #c0c0c0 !important;
	padding: 10px;
}

#header_table th {
	height: 10px;
}

#tablewrap #notice_table tr {
	border-bottom: 1px solid #c0c0c0;
	height: 45px;
}

#tablewrap #notice_table td {
	padding: 5px;
}

#th1 {
	width: 10%;
}

#th2 {
	width: 50%;
}

#th3 {
	width: 20%;
}

#th4 {
	width: 20%;
}

#numberpage {
	width: 100%;
}

#numberpage p {
	text-align: center;
}

#numberpage p a {
	padding: 3px;
	color: black;
	text-decoration: none
}

#notice_table tr td a {
	color: black;
	text-decoration: none
}

.linetext {
	border-right: 1px solid #ccc;
	display: block;
	height: 10px;
	line-height: 10px;
}

#selectNoticeWrap {
	width: 1024px;
	margin: 0 auto;
	display: none;
}

#selectHeader {
	margin-top: 20px;
	border-top: 2px solid #ccc;
	width: 1024px;
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
}

#chage_page {
	width: 100%;
}

#chage_page #chage_page_ul {
	width: 100%;
	padding: 0;
}

#chage_page #chage_page_ul li {
	width: 100%;
	list-style: none;
	overflow: hidden;
	font-size:12px;
	height:40px;
	line-height:40px;
	border-bottom: 1px solid #c0c0c0;
}

#chage_page #chage_page_ul li b {
	float: left;
	width: 7%;
	padding-left:30px;
	display: block;
}

#chage_page #chage_page_ul li img {
	float: left;
	width: 10px;
	height: 10px;
	padding-top: 15px;
	cursor: pointer;
}

#chage_page #chage_page_ul li div {
	float: left;
	margin-left: 20px;
}

#chage_page #chage_page_ul li div a {
	color: black;
	text-decoration: none;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		listview(0);
		$(document).on("click", "#numberP a", function() {
			var size = Number($(this).text()) - 1;
			listview(size);
		})
		
	})
	function listview(size) {
		$("tr").not("#header_table").remove();
		$("#numberP").text("");
		$.ajax({
			url : "noticelist.do",
			type : "get",
			data : {
				"size" : size
			},
			dataType : "json",
			success : function(json) {
				console.log(json);
				for (var i = 0; i < json.list.length; i++) {
					var tr = "<tr>"
					var noTd = "<td>" + json.list[i].boardNo + "</td>";
					var titleTd = "<td><a href='#' class='selectNo'>" + json.list[i].title
							+ "</a></td>";
					var date = new Date(json.list[i].regdate);
					var regDateTd = "<td>" + date.toLocaleDateString()
							+ "</td>";
					var readcountTd = "<td>" + json.list[i].readcount
							+ "</td></tr>";
					tr += noTd + titleTd + regDateTd + readcountTd;
					$("#notice_table").append(tr);
				}
				for (var i = 1; i <= json.size; i++) {
					var aTag = "<a href='#'>" + i + "</a>";
					$("#numberP").append(aTag);
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
			</select> <input type="text" id="search"> <a href="#"><input
				type="button" id="search_btn" value="검색"></a>
		</div>
		<div id="tablewrap">
			<table id="notice_table">
				<tr id="header_table">
					<th id="th1"><span class="linetext">번호</span></th>
					<th id="th2"><span class="linetext">제목</span></th>
					<th id="th3"><span class="linetext">등록일</span></th>
					<th id="th4">조회수</th>
				</tr>
			</table>
		</div>
		<div id="numberpage">
			<p id="numberP"></p>
		</div>
	</div>
	
	<div id="selectNoticeWrap">
			<div id="selectHeader">
				<h4 id="title_h4">시스템 점검안내</h4>
				<ul id="notice_ul">
					<li id="regdate_Li"><b>등록일 :</b> 2018-02-06 <span
						id="linespan"></span></li>
					<li id="readcount_li"><b>조회수 :</b> 55</li>
				</ul>
			</div>
			<div id="selectContent">
				<p>콘텐츠</p>
			</div>
			<div id="chage_page">
				<ul id="chage_page_ul">
					<li><b>다음글</b><img src="../images/sort-up.png">
						<div>
							<a href="#" id="nextTitle">L.pay 시스템 점검안내</a>
						</div></li>
					<li><b>이전글</b><img src="../images/caret-down.png">
						<div>
							<a href="#" id="prevTitle">시스템 점검 안내</a>
						</div></li>
				</ul>
			</div>
		</div>

</body>
</html>