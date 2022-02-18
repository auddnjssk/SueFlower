<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/resources/css/info.css">
<body>
	<div class="sidebar2">
		<ul class="sidebar_nav">
			<li class="sidebar_blind">
			<c:if test="${member.adminCheck == 1}">
					<a href="/admin/adminPage"><span>관리자페이지</span></a>
				</c:if></li>
			<li class="sidebar_blind"><a href="/member/info"><span>회원정보</span>
			</a></li>
			<li class="sidebar_blind"><a href="/member/update"> <span>정보수정</span>
			</a></li>
			<li class="sidebar_blind"><a href="/member/point"><span>포인트</span> </a></li>
			<li class="sidebar_blind">
			<c:if test="${member.adminCheck == 0}">
					<a href="/member/delete"><span>회원탈퇴</span></a>
				</c:if></li>
			<li class="sidebar_blind"><a href="/"><span>홈으로</span> </a></li>

		</ul>
	</div>

</body>
</html>