<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--@ page import="com.model2.mvc.service.domain.* " --%>
<%--
	Product product = (Product)request.getAttribute("product");
	User user = (User)session.getAttribute("user");
	System.out.println(":::,jsp에서 세션확인 : "+user);
	System.out.println(":::jsp에서 vo확인: "+product);
--%>
<html>  
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" />  
<title>상품 구매</title>

<!-- <script type="text/javascript" src="../javascript/calendar.js">
</script> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	
	function fncAddPurchase() {
		
		var payment = $("option:selected").val();
		var name = $($("input:text")[0]).val();
		var phone = $($("input:text")[1]).val();
		var addr = $($("input:text")[2]).val();
		
		console.log(payment+":"+name+":"+phone+":"+addr);
		
		if(payment == null) {
			alert("구매 수단을 선택해 주세요");
			return;
		}
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
		
		var result = confirm("구매하시겠습니까?");
		if(result) {
			$('form').attr("method","post")
						 .attr("action","/purchase/addPurchase")
						 .submit();
		} else {
			return;
		}
		
	}
	
	$(function(){
		
		//<!-- datepicker -->
		$("input:text[name='receiverDate']").datepicker().bind('change', function(){
			$(this).val($(this).datepicker("option","dateFormat","yy-mm-dd").val());
		});
		
		$(".ct_btn01:contains('구매')").bind('click', function(){
			fncAddPurchase();
		});
		
		$(".ct_btn01:contains('취소')").bind('click', function(){
			
			console.log($(this).html());
			
			var result = confirm("구매를 취소하시겠습니까?");
			
			if(result) {
				window.history.back();
			} else {
				return;
			}
		});
		
		$(".ct_btn01:contains('내 정보 불러오기')").bind('click', function(){
			
			console.log($(this).html());
			console.log("receiverName : "+$("input:text[name='receiverName']").val());
			
			$("input:text[name='receiverName']").val("${user.userName}");
			$("input:text[name='receiverPhone']").val("${user.phone}");
			$("input:text[name='receiverAddr']").val("${user.addr}");
		});
		
	});
	
</script>
</head>

<body>

<!-- <form name="addPurchase" method="post" action="/addPurchase.do"> -->
<form name="addPurchase">
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">상품상세조회</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<input type="hidden" name="purchaseProd.prodNo" value="${product.prodNo}" />
<input type="hidden" name="buyer.userId" value="${user.userId }" />
<table width="600" border="0" cellspacing="0" cellpadding="0"	align="center" style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="300" class="ct_write">
			상품번호 
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01" width="299">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">${product.prodNo }</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품명 
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01">${product.prodName}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품상세정보 
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01">${product.prodDetail}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">제조일자</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01">${product.manuDate }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">가격</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01">${product.price }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">등록일자</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01">${product.regDate }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			구매자아이디 
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01">${user.userId }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
			<td>
				<table border="0" cellspacing="0" cellpadding="0" align="center">
					<tr>
						<td width="17" height="23">
							<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
						</td>
						<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
							내 정보 불러오기
						</td>
						<td width="14" height="23">
							<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
						</td>
						<td width="30"></td>
					</tr>
				</table>
			</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매방법 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01">
			<select 	name="paymentOption"		class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20">
				<option value="1" selected="selected">현금구매</option>
				<option value="2">신용구매</option>
			</select>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매자이름 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="receiverName" 	class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="20"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매자연락처 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="receiverPhone" class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매자주소 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="receiverAddr" class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20" />				
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매요청사항</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01">
			<input		type="text" name="receiverRequest" 	class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">배송희망일자</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td width="200" class="ct_write01">
			<!-- <input 	type="text" readonly="readonly" name="receiverDate" class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20"/>
			<img 	src="../images/ct_icon_date.gif" width="15" height="15"	
						onclick="show_calendar('document.addPurchase.receiverDate', document.addPurchase.receiverDate.value)"/> -->
			<input type="text" name="receiverDate" class="ct_input_g"/>
		</td>
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
						<!-- <a href="javascript:fncAddPurchase();">구매</a> -->
						구매
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<!-- <a href="javascript:history.go(-1)">취소</a> -->
						취소
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

</body>
</html>