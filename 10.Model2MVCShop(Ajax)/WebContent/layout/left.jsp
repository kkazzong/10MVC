<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	<title>Model2 MVC Shop</title>

	<link href="/css/left.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" />  
	<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
	
		function history(){
			popWin = window.open("/history.jsp",
														"popWin",
														"left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		}
	
		//==> jQuery ���� �߰��� �κ�
		 $(function() {
			 
			 //<!-- menu bar -->
			 $($("ul")[0]).menu();
			 
			//==> ����������ȸ Event ����ó���κ�
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$( ".Depth03:contains('����������ȸ')" ).on("click" , function() {
				//Debug..
				//alert(  $( ".Depth03:contains('����������ȸ')" ).html() );
				$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?userId=${user.userId}");
			});
			
			
			//==> ȸ��������ȸ Event ����ó���κ�
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$( ".Depth03:contains('ȸ��������ȸ')" ).on("click" , function() {
				//Debug..
				//alert(  $( ".Depth03:contains('ȸ��������ȸ')" ) );
		 		$(window.parent.frames["rightFrame"].document.location).attr("href","/user/listUser");
			}); 
			
			
			//==> �ǸŻ�ǰ���
			$( ".Depth03:contains('�ǸŻ�ǰ���')" ).bind('click', function(){
				//alert($(".Depth03:contains('�ǸŻ�ǰ���')"))
				$(this).css('color','pink')
				console.log ( $(this).html() ); 
				$(window.parent.frames["rightFrame"].document.location).attr('href','../product/addProductView.jsp')
			})
			
			$( ".Depth03:contains('�ǸŻ�ǰ����')" ).bind('click', function(){
				//alert($(this))
				console.log ( $(this).html() ); 
				$(window.parent.frames["rightFrame"].document.location).attr('href','/product/listProduct?menu=manage')
			})
			
			$( ".Depth03:contains('�� �� �� ��')" ).bind('click', function(){
				console.log ( $(this).html() ); 
				$(window.parent.frames["rightFrame"].document.location).attr('href','/purchase/listSale')
			})
			
			$( ".Depth03:contains('�� ǰ �� ��')" ).bind('click', function(){
				console.log ( $(this).html() ); 
				$(window.parent.frames["rightFrame"].document.location).attr('href','/product/listProduct?menu=search')
			})
			
			$( ".Depth03:contains('�����̷���ȸ')" ).bind('click', function(){
				console.log ( $(this).html() ); 
				$(window.parent.frames["rightFrame"].document.location).attr('href','/purchase/listPurchase')
			})
			
			$( ".Depth03:contains('�ֱٺ���ǰ')" ).bind('click', function(){
				console.log ( $(this).html() ); 
				history();
			})
			
			
		});	
		 
	</script>
	<style type="text/css">
	.ui-menu {width : 65px;}
	.ui-menu .ui-menu {width: 90px;}
	.Depth03 { 
		font-size: 10px; 
		line-height: 20px;
		color: #505050;
		font-weight:normal;
		text-indent: 14px;
		background-image: url(/sample/images/left/leftMenuDep03Bg.gif);
		background-repeat:no-repeat;
 	}
	</style>
</head>

<body background="/images/left/imgLeftBg.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  >

<ul>
	<li>
	<c:if test="${user.role == 'admin'}">
	<div>ȸ������</div>
	</c:if>
	<c:if test="${user.role == 'user'}">
	<div>����������</div>
	</c:if>
		<ul>
			<c:if test="${ !empty user }">
			<li><div class="Depth03">����������ȸ</div></li>
			</c:if>
			<c:if test="${user.role == 'admin'}">
			<li><div class="Depth03">ȸ��������ȸ</div></li>
			</c:if>
		</ul>
	</li>
	<li>
	<c:if test="${user.role == 'admin'}">
	<div>��ǰ����</div>
	</c:if>
	<c:if test="${user.role == 'user'}">
	<div>��ǰ����</div>
	</c:if>
	<c:if test="${empty user}">
	<div>��ǰ����</div>
	</c:if>
		<ul>
			<c:if test="${user.role == 'admin'}">
			<li><div class="Depth03">�ǸŻ�ǰ���</div></li>
			<li><div class="Depth03">�ǸŻ�ǰ����</div></li>
			</c:if>
			<li><div class="Depth03">�� ǰ �� ��</div></li>
			<li><div class="Depth03">�ֱٺ���ǰ</div></li>
		</ul>
	</li>
	<c:if test="${user.role == 'admin'}">
	<li>
	<div>�ǸŰ���</div>
		<ul>
			<li><div class="Depth03">�� �� �� ��</div></li>
		</ul>
	</li>
	</c:if>
	<c:if test="${user.role == 'user' && !empty user}">
	<li>
	<div>�ֹ�����</div>
		<ul>
			<li><div class="Depth03">�����̷���ȸ</div></li>
		</ul>
	</li>
	</c:if>
</ul>

<%-- <table width="159" border="0" cellspacing="0" cellpadding="0">

<!--menu 01 line-->
<tr>
	<td valign="top"> 
		<table  border="0" cellspacing="0" cellpadding="0" width="159" >	
			<tr>
				<c:if test="${ !empty user }">
					<tr>
						<td class="Depth03">
							<!-- ////////////////// jQuery Event ó���� ����� ///////////////////////// 
							<a href="/user/getUser?userId=${user.userId}" target="rightFrame">����������ȸ</a>	
							////////////////////////////////////////////////////////////////////////////////////////////////// -->
							����������ȸ
						</td>
					</tr>
				</c:if>
			
				<c:if test="${user.role == 'admin'}">
					<tr>
						<td class="Depth03" >
							<!-- ////////////////// jQuery Event ó���� ����� ///////////////////////// 
							<a href="/user/listUser" target="rightFrame">ȸ��������ȸ</a>	
							////////////////////////////////////////////////////////////////////////////////////////////////// -->
							ȸ��������ȸ
						</td>
					</tr>
				</c:if>
			
				<tr>
					<td class="DepthEnd">&nbsp;</td>
				</tr>
		</table>
	</td>
</tr>

<!--menu 02 line-->
<c:if test="${user.role == 'admin'}">
	<tr>
		<td valign="top"> 
			<table  border="0" cellspacing="0" cellpadding="0" width="159">
				<tr>
					<td class="Depth03">
						<!-- <a href="../product/addProductView.jsp;" target="rightFrame">�ǸŻ�ǰ���</a> -->
						�ǸŻ�ǰ���
					</td>
				</tr>
				<tr>
					<td class="Depth03">
						<!-- <a href="/product/listProduct?menu=manage"  target="rightFrame">�ǸŻ�ǰ����</a> -->
						<!-- <a href="/product/listProduct/manage"  target="rightFrame">�ǸŻ�ǰ����</a> -->
						�ǸŻ�ǰ����
					</td>
				</tr>
				<tr>
					<td class="Depth03">
						<!-- <a href="/purchase/listSale?menu=manage"  target="rightFrame">�� �� �� ��</a> -->
						�� �� �� ��
					</td>
				</tr>
				<tr>
					<td class="DepthEnd">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
</c:if>

<!--menu 03 line-->
<tr>
	<td valign="top"> 
		<table  border="0" cellspacing="0" cellpadding="0" width="159">
			<tr>
				<td class="Depth03">
					<!-- <a href="/product/listProduct?menu=search" target="rightFrame">�� ǰ �� ��</a> -->
					<!-- <a href="/product/listProduct/search"  target="rightFrame">�� ǰ �� ��</a> -->
					�� ǰ �� ��
				</td>
			</tr>
			
			<c:if test="${ !empty user && user.role == 'user'}">
			<tr>
				<td class="Depth03">
					<!-- <a href="/purchase/listPurchase"  target="rightFrame">�����̷���ȸ</a> -->
					�����̷���ȸ
				</td>
			</tr>
			</c:if>
			
			<tr>
				<td class="DepthEnd">&nbsp;</td>
			</tr>
			<tr>
				<td class="Depth03">
				<!-- <a href="javascript:history()">�ֱ� �� ��ǰ</a> -->�ֱ� �� ��ǰ
				</td>
			</tr>
		</table>
	</td>
</tr>

</table> --%>

</body>

</html>