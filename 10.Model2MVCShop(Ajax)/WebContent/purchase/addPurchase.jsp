<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.model2.mvc.service.domain.*" %>
<%-- 
	Purchase purchase = (Purchase)request.getAttribute("purchase");
	System.out.println("jspȮ�� :"+purchase);
--%>
<html>
<head>
<title>���� Ȯ��</title>
<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

	$(function(){
		
		$(".ct_btn01:contains('������������')").bind('click', function(){
			console.log($(this).html());
			$('form').attr("method","post")
						 .attr("action","/purchase/updatePurchaseView?tranNo=${purchase.tranNo}")
						 .submit();
		});
		
		$(".ct_btn01:contains('Ȯ��')").bind('click', function(){
			console.log($(this).html());
			self.location = "/purchase/listPurchase";
		});
		
		$(".ct_btn01:contains('��ǰ����Ʈ')").bind('click', function(){
			console.log($(this).html());
			self.location = "/product/listProduct?menu=search";
		});
	});
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="updatePurchaseForm" action="/purchase/updatePurchaseView?tranNo=${purchase.tranNo}" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� ���� Ȯ��</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="70%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;" align="center">
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="200">
			��ǰ�̸�
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">${purchase.purchaseProd.prodName}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="200">
			�����ھ��̵�
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">${purchase.buyer.userId}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="104">
			�������
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">
		<c:if test="${purchase.paymentOption == 1}">
			���ݰ���
		</c:if>
		<c:if test="${purchase.paymentOption == 2}">
			ī�����
		</c:if>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="104">
			�������̸�
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">${purchase.receiverName}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="104">
			�����ڿ���ó 
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">${purchase.receiverPhone}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="104">
			�������ּ�
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">${purchase.receiverAddr }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="104">
			�����ڿ�û����
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">${purchase.receiverRequest }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="104">
		����������
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">${purchase.receiverDate }</td>
		<td></td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
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
						<!-- <a href="javascript:fncUpdatePurchase();">������������</a> -->
						������������
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<!-- <a href="/purchase/listPurchase">Ȯ��</a> -->
						Ȯ��
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						��ǰ����Ʈ
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