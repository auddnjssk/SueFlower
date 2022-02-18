<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>관리자용 제품 등록 페이지</h3>
<!-- <pre><h3>
=> FileUpLoad TestForm
=> form 과 table Tag 사용시 주의사항 : form 내부에 table 사용해야함
   -> form 단위작업시 인식안됨
   -> JQ 의 serialize, FormData 의 append all 등
</h3></pre> -->

<form action="/product/insert" method="post" enctype="multipart/form-data" id="myForm">
<!-- => method="post" : 255 byte 이상 대용량 전송 가능 하므로 
	 => enctype="multipart/form-data" : 화일 upload 를 가능하게 해줌 
	** multipart/form-data는 파일업로드가 있는 입력양식요소에 사용되는 enctype 속성의 값중 하나이고, 
       multipart는 폼데이터가 여러 부분으로 나뉘어 서버로 전송되는 것을 의미
       이 폼이 제출될 때 이 형식을 서버에 알려주며, 
       multipart/form-data로 지정이 되어 있어야 서버에서 정상적으로 데이터를 처리할 수 있다.  -->
<table>
	<tr height="40"><td bgcolor="aqua">제품 명</td>
		<td><input type="text" name="productName" id="productName" size="20">&nbsp;&nbsp;</td></tr>
	<tr height="40"><td bgcolor="aqua">제품 종류</td>
		<td><input type="text" name="productType" id="productType" size="20">&nbsp;&nbsp;<br></td></tr>
				
	<tr height="40"><td bgcolor="aqua">제품 수량</td>
		<td><input type="text" name="productQuantity" id="productQuantity" size="20"><br></td></tr>
		
	<tr height="40"><td bgcolor="aqua">제품 가격</td>
		<td><input type="text" name="productPrice" id="productPrice" size="20"><br></td></tr>
			
	<tr height="40"><td bgcolor="aqua">Image</td>
		<td><img src="" class="select_img"><br>
			<input type="file" name="uploadfilef" id="uploadfilef">
			<script>
			// 해당 파일의 서버상의 경로를 src로 지정하는것으로는 클라이언트 영역에서 이미지는 표시될수 없기 때문에
			// 이를 해결하기 위해 FileReader이라는 Web API를 사용
			// => 이 를 통해 url data를 얻을 수 있음.
			//    ( https://developer.mozilla.org/ko/docs/Web/API/FileReader)
			// ** FileReader
			// => 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 읽을 파일을 가리키는File
			//    혹은 Blob 객체를 이용해 파일의 내용을(혹은 raw data버퍼로) 읽고 
			//    사용자의 컴퓨터에 저장하는 것을 가능하게 해줌.	
			// => FileReader.onload 이벤트의 핸들러.
			//    읽기 동작이 성공적으로 완료 되었을 때마다 발생.
			// => e.target : 이벤트를 유발시킨 DOM 객체
	  		
				$('#uploadfilef').change(function(){
					if(this.files && this.files[0]) {
						var reader = new FileReader;
				 			reader.onload = function(e) {
			 				$(".select_img").attr("src", e.target.result)
			 					.width(100).height(100); 
			 				} // onload_function
			 				reader.readAsDataURL(this.files[0]);
			 		} // if
				}); // change			
			</script>
		</td>
	</tr>		
	<tr height="40"><td></td>
		<td><input type="submit" value="제품등록" id="submit">&nbsp;&nbsp;
			<input type="reset" value="취소">&nbsp;&nbsp;
			
		</td></tr>			
</table>
</form>
<c:if test="${not empty message}">
<br>${message}<br><br> 
</c:if>
</body>
</html>