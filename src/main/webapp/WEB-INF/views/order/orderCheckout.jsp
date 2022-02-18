<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>주문 정보</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/checkout/">

<script src="../resources/js/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>


<!-- Custom styles for this template -->
<link href="../resources/css/form-validation.css" rel="stylesheet">
</head>
<body class="bg-light">

	<div class="container">
		<main>
			<div class="py-5 text-left">

				<h2>주문/결제</h2>

			</div>
			<c:set var="i" value="0"></c:set>
			<div class="row g-7">
				<div class="col-md-7 col-lg-8">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-primary">주문내역</span> <span
							class="badge bg-primary rounded-pill"></span>

					</h4>

					<hr>

					<c:choose>
						<c:when test="${cartCheckout == true}">
							<c:forEach var="list" items="${cartList}">
								<img src="../resources/uploadImage/${list.uploadfile }"
									width="50" height="50" class="product-img img"
									alt="${list.productName }" />
								<span style="font-weight: bold">${list.productName }</span>&nbsp;/&nbsp;<span>${list.quantity }개</span>&nbsp;/&nbsp;<fmt:formatNumber
									value="${list.productPrice}" pattern="#,###,###" />원
								<h6 style="color: red">예약일 : ${list.reservationDate }</h6>
								<hr>
								<input type="hidden" name="reservationDate"
									value="${list.reservationDate }">
								<c:set var="i" value="${i+1}"></c:set>
								<script>
									$(document).ready(function(){
										$(".badge").html(${i});
									});
									
									
								</script>
							</c:forEach>
							<h5>
								총 결제 금액 :
								<fmt:formatNumber value="${sumTotalPrice}" pattern="#,###,###" />
								원
							</h5>
							<input type="hidden" name="sumTotalPrice"
								value="${sumTotalPrice}">
						</c:when>
						<c:otherwise>

							<img src="../resources/uploadImage/${productInfo.uploadfile }"
								width="50" height="50" class="product-img img"
								alt="${list.productName }" />
							<span style="font-weight: bold">${productInfo.productName }</span>&nbsp;/&nbsp;<span>${quantity }개</span>&nbsp;/&nbsp;<fmt:formatNumber
								value="${productInfo.productPrice*quantity}" pattern="#,###,###" />원
								<h6 style="color: red">예약일 : ${reservationDate }</h6>
							<br>
							<%-- <h5>
								총 결제 금액 :
								<fmt:formatNumber value="${productInfo.productPrice*quantity}"
									pattern="#,###,###" />
								원
							</h5> --%>
							<input type="hidden" name="sumTotalPrice"
								value="${productInfo.productPrice*quantity}">
							<script>
									$(document).ready(function(){
										$(".badge").html("1");
									});
									
								</script>
						</c:otherwise>

					</c:choose>


				</div>

				<form action="/order/orderSubmit" method="post">
					<div class="col-md-7 col-lg-8">
						<h4 class="mb-3">발신인 정보</h4>
						<hr>
						<form class="needs-validation" novalidate>
							<input type="hidden" name="productId" value="${productId }">
							<input type="hidden" name="reservationDate"
								value="${reservationDate }"> <input type="hidden"
								name="quantity" value="${quantity }"> <input
								type="hidden" name="sumTotalPrice"
								value="${quantity*productInfo.productPrice}">
							<div class="row g-3">
								<div class="col-sm-6">
									<label for="firstName" class="form-label">발신인 이름</label> <input
										type="text" name="senderName" class="form-control"
										id="senderName" placeholder="" value="" required>
									<div class="invalid-feedback">이름을 다시 입력해주세요.</div>
								</div>
								<div class="form-check">
									<input type="checkbox" class="form-check-input"
										id="consent-information" required="required">개인정보수집
									동의(필수)
								</div>

								<br>

								<h4>받는분 정보</h4>
								<hr>
								<div class="col-12">
									<label for="address" class="form-label">수신인 주소지</label> <input
										type="text" name="receiverAddress1" class="form-control"
										id="receiverAddress1" placeholder="경기도 용인시 기흥구" required>
									<div class="invalid-feedback"></div>
								</div>


								<div class="col-12">
									<label for="address2" class="form-label">수신인 주소지 2 <span
										class="text-muted">(선택사항)</span></label> <input type="text"
										name="receiverAddress2" class="form-control"
										id="receiverAddress1" placeholder="000동000호">
								</div>

								<div class="col-sm-6">
									<label for="firstName" class="form-label">받는분 이름</label> <input
										type="text" name="receiverName" class="form-control"
										id="receiverName" placeholder="" value="" required>
									<div class="invalid-feedback">이름을 다시 입력해주세요.</div>
								</div>

								<div class="col-sm-6">
									<label for="phoneNumber" class="form-label">받는분 연락처</label> <input
										type="text" name="receiverContact" class="form-control"
										id="receiverContact" placeholder="010-0000-0000" value=""
										required>
									<div class="invalid-feedback">연락처을 다시 입력해주세요.</div>
								</div>



								<div class="form-check">
									<input type="checkbox" class="form-check-input"
										id="consent-information" required="required">개인정보수집
									동의(필수)
								</div>
						</form>


						<hr class="my-4">
				</form>
				<h5>
								총 결제 금액 :
								<fmt:formatNumber value="${productInfo.productPrice*quantity}"
									pattern="#,###,###" />
								원
							</h5>
				<input type="submit" value="결제하기" style="width: 620px; height: 40px"><BR>
				<BR>
				<BR>
			</div>
	</div>

	</main>


	</div>



	<script src="../resources/js/form-validation.js"></script>
</body>
</html>