<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/MovieProject/css/manager.css"> 
<style type="text/css">
   .mname{
      text-decoration: none;
      font-weight: bold;
      color:black;
   }
   .title{
   		text-align:left; 
   		padding-left: 40px;
   }
</style>
</head>
<body>
	<c:if test="${result!=null }">
			<script type="text/javascript">
				alert("${result}");
			</script>
	</c:if>
	<jsp:include page="../include/adminHeader.jsp"></jsp:include>
	<div id="listBody">
		<div id="content">
			<h2>영화관리</h2>
			<table>
				<tr>
					<th>제목</th>
					<th>개봉일</th>
					<th>종료일</th>
				</tr>
				<c:forEach var="item" items="${movieList }">
					<tr>
						<td><a class="mname" href="managerReadMovie.do?no=${item.movieNo }">${item.movieName}</a></td>
						<td><fmt:formatDate value="${item.openDate }" pattern="yyyy-MM-dd"/></td>
						<td><fmt:formatDate value="${item.closeDate}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</table>
			
			<p id="insert">
				<a id="btnAdd" href="managerAddMovie.do"><button>영화추가</button></a>
			</p>	
			</div>
	</div>
=======
   <c:if test="${result!=null }">
         <script type="text/javascript">
            alert("${result}");
         </script>
   </c:if>
   <jsp:include page="../include/adminHeader.jsp"></jsp:include>
   <div id="listBody">
      <div id="content">
         <h2>영화관리</h2>
         <table>
            <tr>
               <th>제목</th>
               <th>개봉일</th>
               <th>종료일</th>
            </tr>
            <c:forEach var="item" items="${movieList }">
               <tr>
                  <td class="title"><a class="mname" href="managerReadMovie.do?no=${item.movieNo }">${item.movieName}</a></td>
                  <td><fmt:formatDate value="${item.openDate }" pattern="yyyy-MM-dd"/></td>
                  <td><fmt:formatDate value="${item.closeDate}" pattern="yyyy-MM-dd"/></td>
               </tr>
            </c:forEach>
         </table>
         
         <p id="insert">
            <a id="btnAdd" href="managerAddMovie.do"><button>영화추가</button></a>
         </p>   
         </div>
   </div>
>>>>>>> refs/heads/master
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>