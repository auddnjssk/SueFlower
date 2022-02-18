<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>장바구니</title>
<script src="../resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/cart.css">

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,900"
	rel="stylesheet">
</head>


<body>
    <div id="wrap">
        <header>
            <div class="logo">
                <a href="/">메인페이지로 가기</a>
            </div>
        </header>
        <section id="contents-cart" class="contents-cart async-content">
            <section class="cart-title">
                <h1 class="sr-only">Sue Flower 장바구니</h1>
                <br><span style="color: #D3D3D3">${message }</span><br>
                <hr><br><br>
            </section>
            
            
            <table class="cartTable"
				summary="장바구니 상품명, 제품가격, 선택한수량, 총결제비용 정보 및 결제 상품으로 선택,해제 및 수량변경, 삭제 기능 제공표">
                <colgroup>
                    <col width="80" />
                    <col width="180" />
                    <!-- <col width="*" /> -->
                    <col width="180" />
                    <col width="90" />
                </colgroup>
                <thead>
                    <tr class="head">
                        <th scope="col" class="all-select-event"><button type="button" id="btnDeleteAll">전체 삭제</button></th>
                        <th scope="colgroup" id="th-product-box" colspan="2">
                            &emsp;&emsp;상품정보</th>
                        <th scope="col" id="th-unit-total-price">상품금액</th>
                        <th scope="col" id="th-reservationDate">예약일</th>
                    </tr>
                </thead>
                	<c:set var="i" value="0"/>
                    <c:forEach var="list" items="${cartList}">
                        <tbody id="cartTable-sku">
                            <tr class="cart-deal-item ">
                                <td class="product-select-event"><input type="checkbox"
                                    class="dealSelectChk" /> <a
                                    href="/cart/delete?cartId=${list.cartId }">삭제</a></td>
                                <td class="cart-deal-item__image ">
                                    &emsp;&emsp;&emsp;&emsp; <img
                                    src="../resources/uploadImage/${list.uploadfile }" width="78"
                                    height="78" class="product-img img" alt="${list.productName }" />
                                </td>
                                <td class="product-box">
                                    <div class="product-name-part">
                                        <a href="/product/productDetail?productId=${list.productId}"
                                            class="product-name moveProduct">${list.productName}</a>
                                        
                                    </div>

                                    <div>

                                        <div class="option-price-part">

                                            <span class="unit-cost"> <fmt:formatNumber
                                                    value="${list.productPrice }" pattern="#,###,###" /></span>&nbsp;
                                            <input type="hidden" name="quantity" value="${list.quantity}" maxlength="3" id="origin_qty${i}">
                                            <span class="select-select"> 
                                            <input type="number"
                                                style="width: 30px;" min="0" max="10" name="quantity"
                                                value="${list.quantity }" id="quantity${i}"/>
                                                <input type="hidden" name="cartId" id="cartId${i}" value="${list.cartId}" />
                                            <button class="updateQuantityBtn">완료</button>
                                            <script>
                                            $(document).ready(function(){
												//수량변경 버튼
													$('.updateQuantityBtn').click(function(){
														var quantity = $("#quantity${i}").val();
														var origin = $("#origin_qty${i}").val();
														var cartId = ${list.cartId};
														if(quantity != origin){
														
															$.ajax({
																url : "/cart/update",
																type : "post",
																data : {"quantity": quantity, "cartId":cartId},
																success : function(result){
																	console.log(result);
																	location.href="/cart/cartList";
																}
															});
															
															
														}
														
														
														
													});
                                            });

                                            </script>
                                            
                                            </span>
                                        </div>
                                    </div>
                                </td>
                                <td class="unit-total-price">
                                    <div class="unit-total-sale-price">
                                        &emsp;&emsp;&emsp;&emsp;
                                        <fmt:formatNumber value="${list.totalPrice}"
                                            pattern="#,###,###" />
                                        원
                                    </div>
                                </td>

                                <td class="reservationDate">
                                    <div class="reservationDate">
                                        &emsp;&emsp;&emsp;&emsp;
                                        <h3></h3>
                                        <span style="color: red;">${list.reservationDate }</span>
                                        
                                    </div>
                                </td>
                                <c:set var="i" value="${i+1}"></c:set>
                    </c:forEach>
                </table>
               
                
                <div class="cart-total-price">
                    <div class="price-area">
                        총 주문금액 <em class="final-order-price" data-final-order-price=0>
                            <span id="totalPrice" style="font-size: 30px;"><fmt:formatNumber
                                    value="${sumTotalPrice}" pattern="#,###,###" /></span>원
                        </em>
                    </div>
                </div>
            <!-- cartUpdate form -->
            <br> <br> <br> <br>
            <button type="button" id="keepShopping">계속 쇼핑하기</button>
			&nbsp;&nbsp;
			<button type="button" id="orderSubmit">주문하기</button>


        </section>
    </div> <!-- wrap -->

    <script>
        $(function() {
            $("#btnDeleteAll").on("click", function() {
                if (confirm("장바구니를 비우시겠습니까?")) {
                    location.href = "/cart/deleteAll";
                }
            });
            $("#keepShopping").on("click", function() {
                location.href = "/product/productList";
            });
            
			$("#orderSubmit").on("click", function(){
                if(${loginId == null}){
                    location.href = "/member/login";
                }else{
                	
                    if (confirm("주문하시겠습니까?")){
                    	$.ajax({
    						type : "POST",
    						url : "/order/checkout",
    						data : {"productId":$("#productId").val(),
    							"reservationDate":$("#reservationDate").val(), 
    							"quantity":$("#quantity").val()},
    						dataType : "text",
    						success:function(d){
    							location.href="/order/checkout";
    						},
    						error: function(e){
    							console.log(e);
    							alert("구매페이지가 점검중에 있습니다. 잠시후에 이용 부탁드립니다.");
    						}
    					})
    				}
                    }
                })
            }); 
        
    </script>
</body>
</html>