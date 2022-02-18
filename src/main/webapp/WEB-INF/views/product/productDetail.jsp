<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>Product show</title>






</head>
<body>
	<%@ include file="../includes/header.jsp"%>

	<div class="product-show">
		<div class="container">
			<div class="col-lg-5 col-md-5 col-sm-12">
				<div class="gallery-panel">
					<img id="largeImage"
						src="../resources/uploadImage/${productDetail.uploadfile }">
				</div>
				<!-- <div id="thumbs" class="thumbs">
        <div class="thumb">
          <img src="img/image_01_thumb.png" alt="1st image description" />
        </div>
        <div class="thumb">
          <img src="img/image_02_thumb.png" alt="2nd image description" />
        </div>
        <div class="thumb active-thumb">
          <img src="img/image_03_thumb.png" alt="3rd image description" />
        </div>
      </div> -->
			</div>
			<!-- //col -->
			<form action="/order/checkoutProduct" method="post">
			<div class="col-lg-7 col-md-7 col-sm-12">
				<input type="hidden" name="productId"
					value="${productDetail.productId}" id="productId" />
				<h1>
					<c:out value="${productDetail.productName}" />
					
				</h1>
				<div class="choose-price">
					<fmt:formatNumber value="${productDetail.productPrice }"
						pattern="#,###,###" />
					원
				</div>
				<hr>

				<%-- <input type="hidden" name="productId" value="${cart.productId}"/> --%>
				<div class="choose">
					<div class="choose-size">

						<div class="wrapper">
							<label for="datepicker">예약일 입력 <input type="text"
								name="reservationDate" id="reservationDate" autocomplete="off" required>
							</label><span>수량</span>
							<span class="validity"><select name="quantity" id="quantity">
							<c:forEach begin="1" end="10" var="i">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select></span>
						</div>
					</div>
					<!-- //choose-size -->
					<%-- <div class="choose"></div>
					<div class="choose-quantity">
						수량 <select name="quantity" id="quantity">
							<c:forEach begin="1" end="10" var="i">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select>
					</div>
					<!-- //choose-quantity -->
				</div>
				<!-- //choose --> --%>
				</form>
				<hr>
				<div class="choose">

					<div class="choose-order">
						<!-- <a class="btn_cart">장바구니 담기</a> -->
						<!--<a class="btn_buy">바로 구매하기</a> -->
						<!-- <i class="fa fa-cart-plus" aria-hidden="true"></i> -->
						<!-- <i class="fa fa-heart-o" aria-hidden="true"></i> -->
						<!-- <button type="button" class="insert-cart" name="insert-cart" value="장바구니에 추가">장바구니 추가</button> -->
						<!-- <input type="submit" class="submit-order" name="submit-order" value="바로 구매하기">  -->
						<button id="cartInsert">장바구니에 추가</button>
						<input type="submit" id="orderSubmitFromDetail" value="바로 구매하기" style="width:150px; height:30px"></input>
					</div>

				</div>
				<!-- //chose -->

			</div>
			<!-- //col -->
		</div>
		<!-- //container -->
	</div>
	<!-- //product-show -->

	<!-- 모달 추가 -->
	<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
				Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div> -->


	<%@ include file="../includes/footer.jsp"%>


	<!-- 장바구니 추가 ajax -->
	<script>
	$(document).ready(function(){
		$("#cartInsert").on("click", function(){
			if(${loginId == null}){
				alert("로그인 후 이용 가능합니다");
				location.href="/member/login";
			}else{
				if(confirm("장바구니에 추가하시겠습니까?")){
					$.ajax({
						type : "POST",
						url : "/cart/insert",
						data : {"productId":$("#productId").val(),
							"reservationDate":$("#reservationDate").val(), 
							"quantity":$("#quantity").val()},
						dataType : "text",
						success:function(d){
							alert("장바구니에 추가 되었습니다");
							if(confirm("장바구니로 이동하시겠습니까?")){
								location.href="/cart/cartList";
								}
						},
						error: function(e){
							console.log(e);
							alert("장바구니에 추가하지 못했습니다");
						}
					})
				}
			}
		})
		$( function() {
			$( "#reservationDate" ).datepicker({
				dateFormat: "yy-mm-dd"
				,	duration: "fast"
			})
		} )
		/* $("#orderSubmitFromDetail").on("click", function(){
			if(${loginId == null}){
				alert("로그인 후 이용 가능합니다");
				location.href="/member/login";
			}else{
				if(confirm("바로 구매하시겠습니까?")){
					$.ajax({
						type : "POST",
						url : "/order/checkoutProduct",
						data : {"productId":$("#productId").val(),
							"reservationDate":$("#reservationDate").val(), 
							"quantity":$("#quantity").val()},
						dataType : "text",
						success:function(d){
							location.href="/order/orderCheckout";
						},
						error: function(e){
							console.log(e);
							alert("구매페이지가 점검중에 있습니다. 잠시후에 이용 부탁드립니다.");
						}
					})
				}
			}
		}) */
	});

</script>

	<script src="../resources/js/jquery-ui.js"></script>
	<!-- <script src="../resources/js/custom.js"></script> -->
</body>
</html>