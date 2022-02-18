<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="/resources/css/info.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<%@ include file="../includes/header.jsp"%>
<body>
	<div class="container" height="700px">
		<div>
			<div class="point_tbform">
				<div>
				<%@ include file="../includes/sidebar.jsp"%>
				
				<table border="1" width="400px" height="100px" class="point_tbv">
					<tr>
					<td>적립금</td>
					<td>${member.memberMoney}</td>	
					</tr>
					<tr>
					<td>포인트</td>
					<td>${member.memberPoint}</td>	
					</tr>	
				</table>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="../includes/footer.jsp"%>

</html>