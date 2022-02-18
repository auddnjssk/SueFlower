<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="utf-8" />
    <meta name="keywords" content="Bouquets" />
    <meta name="description" content="" />
    <meta name="page_type" content="np-template-header-footer-from-plugin" />
    <title>Home</title>
    <link rel="stylesheet" href="../resources/css/nicepage.css" media="screen" />
    <link rel="stylesheet" href="../resources/css/Home.css" media="screen" />
    <script
      class="u-script"
      type="text/javascript"
      src="../resources/js/jquery.js"
      defer=""
    ></script>
    <script
      class="u-script"
      type="text/javascript"
      src="../resources/js/nicepage.js"
      defer=""
    ></script>
    <meta name="generator" content="Nicepage 4.3.3, nicepage.com" />
    <link
      id="u-theme-google-font"
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
    />
    <link
      id="u-page-google-font"
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Alex+Brush:400"
    />

    <script type="application/ld+json">
      {
        "@context": "http://schema.org",
        "@type": "Organization",
        "name": ""
      }
    </script>
    <meta name="theme-color" content="#478ac9" />
    <meta property="og:title" content="Home" />
    <meta property="og:type" content="website" />
  </head>
<body>
<%@ include file ="../includes/header.jsp" %>


<section class="u-align-center u-clearfix u-section-1" id="carousel_3ad7">
      <div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <h2>Sue Flower Products</h2>
        <a href="productRegisterForm">제품 등록(관리자용)</a>
        <p class="u-text u-text-2"></p>
        <div class="u-expanded-width-lg u-expanded-width-md u-expanded-width-xl u-list u-list-1">
          	<div class="u-repeater u-repeater-1">
          	<c:forEach var="list" items="${productList}">
            	<div class="u-align-center u-container-style u-list-item u-repeater-item" >
            	
              		<div class="u-container-layout u-similar-container u-valign-top u-container-layout-1">
						<a href="productDetail?productId=${list.productId}">
               				<img src="../resources/uploadImage/${list.uploadfile}" alt="꽃사진"
                  			class="u-expanded-width u-image u-image-default u-image-2"
                  			data-image-width="293"
                  			data-image-height="293"/>
               			</a> 
                		<a href="productDetail?productId=${list.productId}"><span>"${list.productName}"</span></a>
                		<fmt:formatNumber value="${list.productPrice }" pattern="#,###,###"/>원
              		</div>
              		
            	</div>
            	</c:forEach>
            </div>
          </div>
        </div>
     
</section>

<script src="../resources/js/custom.js"></script>
<%@ include file ="../includes/footer.jsp" %>
</body> 
</html>
