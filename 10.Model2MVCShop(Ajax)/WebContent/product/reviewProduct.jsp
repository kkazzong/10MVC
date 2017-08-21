<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		$("form").attr("method", "post")
					  .attr("action","/product/reviewProduct").submit();
	})
</script>
<title>Insert title here</title>
</head>
<body>

<form>
<input type="hidden" name="purchaseProd.prodNo" value="${purchase.purchaseProd.prodNo}">
<input type="hidden" name="buyer.buyerId" valeu="${purchase.buyer.buyerId}">
<textarea rows="40" cols="3">상품평을 입력해주세요..</textarea>
<input type="submit" value="등록하기">
</form>
</body>
</html>
