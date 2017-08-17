<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>판매목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage);
		$('form').attr("method","post")
					 .attr("action","/purchase/listSale?menu=${param.menu}")
					 .submit();
	}
	
	$(function(){
		
		$("span").css("color","magenta");
		
		$("span").bind('click', function(elem){
			
			console.log($(this).html());
			
			console.log($("input:hidden[name='pNo']", this).val());
			var result = confirm("물건을 배송하시겠습니까?");
			
			if(result) {
				self.location = "/purchase/updateTranCodeByProd?prodNo="+$("input:hidden[name='pNo']", this).val()+"&tranCode=2";
			} else {
				return;
			}
		});
		
		$(".ct_btn01:contains('검색')").bind('click', function(){
			fncGetList(1);
		});
		
	});
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">


<div style="width:98%; margin-left:10px;">

<form name="detailForm">
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">배송 관리</td>
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
				<select name="searchCondition" class="ct_input_g" style="width:80px">
					<option value="0" ${!empty search.searchCondition && search.searchCondition == 0 ? "selected" : ""} >상품번호</option>
					<option value="1" ${!empty search.searchCondition && search.searchCondition == 1 ? "selected" : ""}>상품명</option>
					<option value="2" ${!empty search.searchCondition && search.searchCondition == 2 ? "selected" : ""}>상품가격</option>
				</select>
			<input type="text" name="searchKeyword"  value="${search.searchKeyword}" class="ct_input_g" style="width:200px; height:19px" />
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<!-- <a href="javascript:fncGetList('1');">검색</a> -->
						검색
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >전체 ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="50">NO</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="100">주문번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">등록일</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">현재상태</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<c:set var="i" value="0"/>
	<c:forEach var="purchase" items="${list}">
	<tr class="ct_list_pop">
		<c:set var="i" value="${i+1}"/>
		<td align="center">${i}</td>
		<td></td>
		<td align="center">
			${purchase.tranNo}
		</td>
		<td></td>
		<td align="left">${purchase.purchaseProd.prodName}</td>
		<td></td>
		<td align="left">${purchase.purchaseProd.price}</td>
		<td></td>
		<td align="left">${purchase.purchaseProd.regDate}</td>
		<td></td>
		<td align="left">
		<c:choose>
			<c:when test="${purchase.tranCode == 1}">
				구매완료 <span><input type="hidden" name="pNo" value="${purchase.purchaseProd.prodNo}">▶배송하기</span> 
			</c:when>
			<c:when test="${purchase.tranCode == 2}">
				배송중
			</c:when>
			<c:when test="${purchase.tranCode == 3}">
				배송완료
			</c:when>
		</c:choose>
		</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="F7CAC9" height="1"></td>
	</tr>	
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<c:import var="importPage" url="/common/pageNavigator.jsp" />
		${ importPage }
		</td>
	</tr>
</table>

</form>

</div>

</body>
</html> 