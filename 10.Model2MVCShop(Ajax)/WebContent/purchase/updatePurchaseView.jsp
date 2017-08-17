<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���� ���� ȭ��</title>

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
			alert("�޴� ��� �̸��� �Է����ּ���");
			return;
		}
		if(phone == null || phone.length < 1) {
			alert("����ó�� �� �Է��ϼž� �մϴ�");
			return;
		}
		if(addr == null || addr.length < 1) {
			alert("������� �Է����ּ���");
			return;
		}
		
		var result = confirm("�����Ͻðڽ��ϱ�?");
		if(result) {
			$('form').attr("method","post")
						 .attr("action","/purchase/updatePurchase")
						 .submit();
		} else {
			return;
		}
	}
	
	$(function(){
		
		//<!-- datepicker-->
		$("input:text[name='receiverDate']").datepicker().bind('change', function(){
			$(this).val($(this).datepicker("option","dateFormat","yy-mm-dd").val());
		});
		
		$(".ct_btn01:contains('����')").bind('click', function(){
			console.log($(this).html());
			fncUpdatePurchase();
		});
		
		$(".ct_btn01:contains('���')").bind('click', function(){
			var result = confirm("������ ����Ͻðڽ��ϱ�?");
			if(result) {
				console.log($(this).html());
				window.history.back();
			} else {
				return;
			}
		});
		
	});
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="updatePurchaseForm">
<input type="hidden" name="tranNo" value="${param.tranNo}"/>
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� ���� ����</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ�̸�
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.purchaseProd.prodName}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			�������̸� <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="receiverName" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10" minLength="6" value="${purchase.receiverName}">
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			�����ڿ���ó
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="receiverPhone" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10" minLength="6" value="${purchase.receiverPhone}">
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			�������ּ�  <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="receiverAddr" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10" minLength="6" value="${purchase.receiverAddr}">
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			���ſ�û���� 
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="receiverRequest" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10" minLength="6" value="${purchase.receiverRequest}">
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			����������
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<%-- <input type="text" readonly="readonly" name="receiverDate" value="${purchase.receiverDate}"
						class="ct_input_g" style="width: 100px; height: 19px" maxLength="10" minLength="6">&nbsp;
			<img 	src="../images/ct_icon_date.gif" width="15" height="15" 
						onclick="show_calendar('document.updatePurchaseForm.receiverDate', document.updatePurchaseForm.receiverDate.value)" /> --%>
			<input type="text" name="receiverDate" class="ct_input_g" value="${purchase.receiverDate}"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>	

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="center">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<!-- <a href="javascript:fncUpdatePurchase();">����</a> -->
						����
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<!-- <a href="javascript:history.go(-1)">���</a> -->
						���
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>

</div>

</body>
</html>