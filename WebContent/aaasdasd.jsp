<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/star.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/star.js"></script>
<script type="text/javascript">
	$(function(){
		starRating();
		$("#p1").text("asd");
		$("#btn").click(function(){
			var str = $("#outputtag b").text();
    		alert(str);
    		str = $("#outputtag1 b").text();
    		alert(str);
    		str = $("#outputtag2 b").text();
    		alert(str);
		})
	})
</script>
<title>Insert title here</title>
</head>
<body>
	
	<p id="p1"></p>
	<button id="btn">asdassda</button>
	<hr>
	<span class="star-input">
		 <span class="input">
		   <input type="radio" name="star-input" id="p1" value="1"><label for="p1">1</label>
	    <input type="radio" name="star-input" id="p2" value="2"><label for="p2">2</label>
	    <input type="radio" name="star-input" id="p3" value="3"><label for="p3">3</label>
		    <input type="radio" name="star-input" id="p4" value="4"><label for="p4">4</label>
		    <input type="radio" name="star-input" id="p5" value="5"><label for="p5">5</label>
		    <input type="radio" name="star-input" id="p6" value="6"><label for="p6">6</label>
		    <input type="radio" name="star-input" id="p7" value="7"><label for="p7">7</label>
		    <input type="radio" name="star-input" id="p8" value="8"><label for="p8">8</label>
		    <input type="radio" name="star-input" id="p9" value="9"><label for="p9">9</label>
		    <input type="radio" name="star-input" id="p10" value="10"><label for="p10">10</label>
		</span>
		 <output for="star-input" id="outputtag"><b>0</b>점</output>
     </span>
     <span class="star-input">
		 <span class="input">
		   <input type="radio" name="star-input" id="p1" value="1"><label for="p1">1</label>
	    <input type="radio" name="star-input" id="p2" value="2"><label for="p2">2</label>
	    <input type="radio" name="star-input" id="p3" value="3"><label for="p3">3</label>
		    <input type="radio" name="star-input" id="p4" value="4"><label for="p4">4</label>
		    <input type="radio" name="star-input" id="p5" value="5"><label for="p5">5</label>
		    <input type="radio" name="star-input" id="p6" value="6"><label for="p6">6</label>
		    <input type="radio" name="star-input" id="p7" value="7"><label for="p7">7</label>
		    <input type="radio" name="star-input" id="p8" value="8"><label for="p8">8</label>
		    <input type="radio" name="star-input" id="p9" value="9"><label for="p9">9</label>
		    <input type="radio" name="star-input" id="p10" value="10"><label for="p10">10</label>
		</span>
		 <output for="star-input" id="outputtag1"><b>0</b>점</output>
     </span>
     <span class="star-input">
		 <span class="input">
		   <input type="radio" name="star-input" id="p1" value="1"><label for="p1">1</label>
	    <input type="radio" name="star-input" id="p2" value="2"><label for="p2">2</label>
	    <input type="radio" name="star-input" id="p3" value="3"><label for="p3">3</label>
		    <input type="radio" name="star-input" id="p4" value="4"><label for="p4">4</label>
		    <input type="radio" name="star-input" id="p5" value="5"><label for="p5">5</label>
		    <input type="radio" name="star-input" id="p6" value="6"><label for="p6">6</label>
		    <input type="radio" name="star-input" id="p7" value="7"><label for="p7">7</label>
		    <input type="radio" name="star-input" id="p8" value="8"><label for="p8">8</label>
		    <input type="radio" name="star-input" id="p9" value="9"><label for="p9">9</label>
		    <input type="radio" name="star-input" id="p10" value="10"><label for="p10">10</label>
		</span>
		 <output for="star-input" id="outputtag2"><b>0</b>점</output>
     </span>
</body>
</html>