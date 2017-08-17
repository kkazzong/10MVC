<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ page import="java.util.*"  %>
<%@ page import="com.model2.mvc.service.domain.*" %>
<%@ page import="com.model2.mvc.common.*" %> --%>

<%-- <%
	List<Purchase> list = (List<Purchase>)request.getAttribute("list");
	Search search=(Search)request.getAttribute("search");
	Page resultPage = (Page)request.getAttribute("resultPage");

%> --%>
<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage);
		$('form').attr("method","post")
					 .attr("action","/purchase/listPurchase")
					 .submit();
	}
	
	
	$(function(){
		
		console.log($($(".ct_list_pop td:nth-child(3)")[1]).html());
		$(".ct_list_pop td:nth-child(7)").css("color", "teal");
		
		
		/* $(".ct_list_pop td:nth-child(7)").bind('click', function(){
			
			console.log($(this).html());
			console.log("parent====>"+$(this).parent().index());
			console.log("sibling/tranNo====>"+$($($(this).siblings('td'))[2]).text().trim());
			//$(this).siblings('.tr_no').text().trim()
			self.location="/purchase/updatePurchaseView?tranNo="+$($($(this).siblings('td'))[2]).text().trim();
		}); */
		
		//������϶� ��ǰ ���� �Ұ�
		$("span").bind('click', function(){
			console.log($(this).html());
			console.log("parent====>"+$(this).parent().index());
			console.log("sibling/tranNo====>"+$("input:hidden[name='tNo']",this).val());
			//$(this).siblings('.tr_no').text().trim()
			self.location="/purchase/updatePurchaseView?tranNo="+$("input:hidden[name='tNo']",this).val();
		});
		
		
		//���ǵ���
		$("p").css("color","magenta");
		
		$("p").bind('click', function(){
			
			console.log($(this).html());
			
			console.log($("input:hidden[name='tNo']",this).val());
			
			var result = confirm("������ �����߽��ϱ�?");
			if(result) {
				self.location="/purchase/updateTranCode?tranNo="+$("input:hidden[name='tNo']",this).val()+"&tranCode=3";
			} else {
				return;
			}
			
		});
		
	});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="50">NO</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="100">�ֹ���ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">�ֹ���¥</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">�ֹ���ǰ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�ֹ��ݾ�</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
		<td class="ct_line02"></td>
	</tr>
	<tr>
		<td colspan="20" bgcolor="F7CAC9" height="1"></td>
	</tr>
	
	<c:set var="i" value="0"/>
	<c:forEach var="purchase" items="${list}">
	<c:set var="i" value="${i+1}"/>
	<tr class="ct_list_pop">
		<td align="center">
			${i}
		</td>
		<td></td>
		<td align="center">
			<%-- <a href="/getPurchase.do?tranNo=${purchase.tranNo}">${i}</a> --%>
			${purchase.tranNo}
		</td>
		<td></td>
		<td align="center">
			<%-- <a href="/getUser.do?userId=${purchase.buyer.userId}">${purchase.buyer.userId }</a> --%>
			${purchase.orderDate}
		</td>
		<td></td>
		<%-- <td align="left">${purchase.buyer.userName }</td> --%>
		<td align="center">
			<c:choose>
				<c:when test="${purchase.tranCode == 1}">
					<span>
					<input type="hidden" name="tNo" value="${purchase.tranNo }">
					${purchase.purchaseProd.prodName}
					</span>
				</c:when>
				<c:otherwise>
					${purchase.purchaseProd.prodName}
				</c:otherwise>
			</c:choose>
		</td>
		<td></td>
		<td align="center">
			${purchase.purchaseProd.price}��
		</td>
		<td></td>
		<td align="center">
			<c:choose>
				<c:when test="${purchase.tranCode == 1}">
					���ſϷ�
				</c:when>
				<c:when test="${purchase.tranCode == 2 }">
					�����
				</c:when>
				<c:when test="${purchase.tranCode == 3 }">
					��ۿϷ�
				</c:when>
			</c:choose>
		</td>
		<td></td>
		<td align="center">
			<c:if test="${purchase.tranCode == 2 }">
				<%-- <a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=3">���ǵ���</a> --%>
				<p><input type="hidden" name="tNo" value="${purchase.tranNo}">���ǵ���</p>
			</c:if>
			<c:if test="${purchase.tranCode < 2}">
				���
			</c:if>
			<c:if test="${purchase.tranCode > 2}">
				���䳲���
			</c:if>
			
		</td>
		<td></td>
	</tr>
	<tr>
		<td colspan="20" bgcolor="F7CAC9" height="1"></td>
	</tr>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<c:import var="importPage" url="/common/pageNavigator.jsp"/>
		${importPage}
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>