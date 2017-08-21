<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>구매 정보 수정 화면</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" />  
<!-- <script type="text/javascript" src="../javascript/calendar.js">
</script> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	function fncUpdatePurchase() {
		
		var name = $($("input:text")[0]).val();
		var phone = $($("input:text")[1]).val();
		var addr = $($("input:text")[2]).val();
		
		console.log(name+":"+phone+":"+addr);
		
		if(name == null || name.length < 1) {
			alert("받는 사람 이름을 입력해주세요");
			return;
		}
		if(phone == null || phone.length < 1) {
			alert("연락처는 꼭 입력하셔야 합니다");
			return;
		}
		if(addr == null || addr.length < 1) {
			alert("배송지를 입력해주세요");
			return;
		}
		
		var result = confirm("수정하시겠습니까?");
		if(result) {
			$('form').attr("method","post")
						 .attr("action","/purchase/updatePurchase")
						 .submit();
		} else {
			return;
		}
	}
	
	
	$(function(){
		
		var dialog = $("form[name='updateForm']").dialog({
			autoOpen : false,
			height : 500,
			width : 350,
			modal : true,
			buttons : {
				"수정하기" : function(){
					dialog.dialog("submit");
				},
				cancel : function(){
					dialog.dialog("close");
				}
			},
			close : function(){
				$("form[name='updateForm']").reset();
			},
			open : function(){
				console.log("opne!")
			}
		});
		
	})
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<!-- 수정 dialog form -->
<div class="ui-widget">
<form name="updateForm">
	<fieldset>
		<label for="상품명">상품명</label>
		${purchase.purchaseProd.prodName}
		<label for="이름">이름</label>
		<input type="text" name="receiverName" value="${purchase.receiverName}" class="text ui-widget-content ui-corner-all">
		<label for="연락처">연락처</label>
		<input type="text" name="receiverName" value="${purchase.receiverPhone}" class="text ui-widget-content ui-corner-all">
		<label for="주소">주소</label>
		<input type="text" name="receiverName" value="${purchase.receiverAddr}" class="text ui-widget-content ui-corner-all">
		<label for="요청사항">요청사항</label>
		<input type="text" name="receiverName" value="${purchase.receiverRequest}" class="text ui-widget-content ui-corner-all">
		<label for="배송희망날짜">배송희망날짜</label>
		<input type="text" name="receiverName" value="${purchase.receiverDate}" class="text ui-widget-content ui-corner-all">
		
		<input type="submit" value="수정하기" style="position:absolute; top:-1000px">
	</fieldset>
</form>
</div>

</body>
</html>