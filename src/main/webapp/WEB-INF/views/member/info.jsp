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
<link rel="stylesheet" href="/resources/css/join.css">
<link href="../resources/css/sb-admin-2.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<%@ include file="../includes/header.jsp"%>
<body>
	
		<div class="container">
			<%@ include file="../includes/sidebar.jsp"%>
		<div class="card o-hidden border-0 shadow-lg my-5 info_f">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">회원정보</h1>
							</div>
							<form class="user" id="join_form" method="post">
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<span
											class="form-control2 form-control-user2 id_input"
											id="exampleFirstName">아이디: ${member.memberId}</span>
									</div>
									<div class="col-sm-6">
										<span
											class="form-control2 form-control-user2 user_input"
											id="exampleLastName">이름: ${member.memberName }</span> 
									</div>
								</div>
								<div class="form-group">
									<span
										class="form-control2 form-control-user2 phonenum_input"
										id="exampleInputPhone">전화번호: ${member.memberPhoneNum}</span> 
								</div>
								<div class="form-group">
									<span
										class="form-control2 form-control-user2 mail_input"
										id="exampleInputEmail">이메일: ${member.memberMail}</span> 
								</div>
								<div>
									<div class="form-group">
										<span class="form-control2 form-control-user2 address_input_2"
											id="exampleRepeatAddr2">우편번호: ${member.memberAddr1}</span>
									</div>
									<div class="form-group">
										<span class="form-control2 form-control-user2 address_input_2"
											id="exampleRepeatAddr2">주소: ${member.memberAddr2}</span>
									</div>
									<div class="form-group">
										<span
											class="form-control2 form-control-user2 address_input_3"
											id="exampleInputPhone">상세 주소: ${member.memberAddr3}</span>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<span
											class="form-control2 form-control-user2 id_input"
											id="exampleFirstName">충전금액: ${member.memberMoney}</span>
									</div>
									<div class="col-sm-6">
										<span
											class="form-control2 form-control-user2 user_input"
											id="exampleLastName">포인트: ${member.memberPoint}</span> 
									</div>
								</div>
								<div class="form-group">
									<span
										class="form-control2 form-control-user2 mail_input"
										id="exampleInputEmail">가입날짜: ${member.memberRegDate}</span> 
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<%@ include file="../includes/footer.jsp"%>

</html>