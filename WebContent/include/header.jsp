<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#headerWrap{
		width:100%;
		hegiht:200px;
		background:#f9f6ec;
		margin: 0 auto;
	}
	#headerWrap h2{
		text-align:center;
		color:red;
		margin:0;
	}
	#headerWrap h3{
		text-align:center;
		margin:0;
	}
	#headerWrap p{
		text-align: right;
		margin-right:180px;
		margin-bottom:10px;
	}
	#headerWrap p a{
		
		color:black;
		text-decoration: none;
		padding: 5px;
		
	}
	#menubarWarp #menubar{
		width:1024px;
		margin:0 auto;
		overflow: hidden;
	}
	#menubarWarp #menubar li{
		display: inline;
		float: left;
		width:19%;
		text-align:center;
		border-right:1px solid black;
	}
	#menubarWarp #menubar li:LAST-CHILD{
		border:none;
	}
	#menubarWarp #menubar li a{
		text-decoration: none;
		color: black;
		font-weight: bold;
	}
</style>

<div id="headerWrap">
	<h3>Hello 2018</h3>
	<h2>DGV</h2>
	<p>
	<a href="#" id="login">로그인</a> |
	<a href="#">회원가입</a>
	</p>
</div>
<div id="menubarWarp">
	<ul id="menubar">
		<li><a href="#">HOME</a></li>
		<li><a href="#">영화</a></li>
		<li><a href="#">예매</a></li>
		<li><a href="#">상영관</a></li>
		<li><a href="#">게시판</a></li>
	</ul>
</div>
