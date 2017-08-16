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
	<!-- CDN(Content Delivery Network) 호스트 사용 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
	
		function history(){
			popWin = window.open("/history.jsp",
														"popWin",
														"left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		}
	
		//==> jQuery 적용 추가된 부분
		 $(function() {
			 
			 //<!-- menu bar -->
			 $($("ul")[0]).menu();
			 
			//==> 개인정보조회 Event 연결처리부분
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$( ".Depth03:contains('개인정보조회')" ).on("click" , function() {
				//Debug..
				//alert(  $( ".Depth03:contains('개인정보조회')" ).html() );
				$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?userId=${user.userId}");
			});
			
			
			//==> 회원정보조회 Event 연결처리부분
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$( ".Depth03:contains('회원정보조회')" ).on("click" , function() {
				//Debug..
				//alert(  $( ".Depth03:contains('회원정보조회')" ) );
		 		$(window.parent.frames["rightFrame"].document.location).attr("href","/user/listUser");
			}); 
			
			
			//==> 판매상품등록
			$( ".Depth03:contains('판매상품등록')" ).bind('click', function(){
				//alert($(".Depth03:contains('판매상품등록')"))
				$(this).css('color','pink')
				console.log ( $(this).html() ); 
				$(window.parent.frames["rightFrame"].document.location).attr('href','../product/addProductView.jsp')
			})
			
			$( ".Depth03:contains('판매상품관리')" ).bind('click', function(){
				//alert($(this))
				console.log ( $(this).html() ); 
				$(window.parent.frames["rightFrame"].document.location).attr('href','/product/listProduct?menu=manage')
			})
			
			$( ".Depth03:contains('배 송 관 리')" ).bind('click', function(){
				console.log ( $(this).html() ); 
				$(window.parent.frames["rightFrame"].document.location).attr('href','/purchase/listSale')
			})
			
			$( ".Depth03:contains('상 품 검 색')" ).bind('click', function(){
				console.log ( $(this).html() ); 
				$(window.parent.frames["rightFrame"].document.location).attr('href','/product/listProduct?menu=search')
			})
			
			$( ".Depth03:contains('구매이력조회')" ).bind('click', function(){
				console.log ( $(this).html() ); 
				$(window.parent.frames["rightFrame"].document.location).attr('href','/purchase/listPurchase')
			})
			
			$( ".Depth03:contains('최근본상품')" ).bind('click', function(){
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
	<div>회원관리</div>
	</c:if>
	<c:if test="${user.role == 'user'}">
	<div>마이페이지</div>
	</c:if>
		<ul>
			<c:if test="${ !empty user }">
			<li><div class="Depth03">개인정보조회</div></li>
			</c:if>
			<c:if test="${user.role == 'admin'}">
			<li><div class="Depth03">회원정보조회</div></li>
			</c:if>
		</ul>
	</li>
	<li>
	<c:if test="${user.role == 'admin'}">
	<div>상품관리</div>
	</c:if>
	<c:if test="${user.role == 'user'}">
	<div>상품보기</div>
	</c:if>
	<c:if test="${empty user}">
	<div>상품보기</div>
	</c:if>
		<ul>
			<c:if test="${user.role == 'admin'}">
			<li><div class="Depth03">판매상품등록</div></li>
			<li><div class="Depth03">판매상품관리</div></li>
			</c:if>
			<li><div class="Depth03">상 품 검 색</div></li>
			<li><div class="Depth03">최근본상품</div></li>
		</ul>
	</li>
	<c:if test="${user.role == 'admin'}">
	<li>
	<div>판매관리</div>
		<ul>
			<li><div class="Depth03">배 송 관 리</div></li>
		</ul>
	</li>
	</c:if>
	<c:if test="${user.role == 'user' && !empty user}">
	<li>
	<div>주문관리</div>
		<ul>
			<li><div class="Depth03">구매이력조회</div></li>
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
							<!-- ////////////////// jQuery Event 처리로 변경됨 ///////////////////////// 
							<a href="/user/getUser?userId=${user.userId}" target="rightFrame">개인정보조회</a>	
							////////////////////////////////////////////////////////////////////////////////////////////////// -->
							개인정보조회
						</td>
					</tr>
				</c:if>
			
				<c:if test="${user.role == 'admin'}">
					<tr>
						<td class="Depth03" >
							<!-- ////////////////// jQuery Event 처리로 변경됨 ///////////////////////// 
							<a href="/user/listUser" target="rightFrame">회원정보조회</a>	
							////////////////////////////////////////////////////////////////////////////////////////////////// -->
							회원정보조회
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
						<!-- <a href="../product/addProductView.jsp;" target="rightFrame">판매상품등록</a> -->
						판매상품등록
					</td>
				</tr>
				<tr>
					<td class="Depth03">
						<!-- <a href="/product/listProduct?menu=manage"  target="rightFrame">판매상품관리</a> -->
						<!-- <a href="/product/listProduct/manage"  target="rightFrame">판매상품관리</a> -->
						판매상품관리
					</td>
				</tr>
				<tr>
					<td class="Depth03">
						<!-- <a href="/purchase/listSale?menu=manage"  target="rightFrame">배 송 관 리</a> -->
						배 송 관 리
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
					<!-- <a href="/product/listProduct?menu=search" target="rightFrame">상 품 검 색</a> -->
					<!-- <a href="/product/listProduct/search"  target="rightFrame">상 품 검 색</a> -->
					상 품 검 색
				</td>
			</tr>
			
			<c:if test="${ !empty user && user.role == 'user'}">
			<tr>
				<td class="Depth03">
					<!-- <a href="/purchase/listPurchase"  target="rightFrame">구매이력조회</a> -->
					구매이력조회
				</td>
			</tr>
			</c:if>
			
			<tr>
				<td class="DepthEnd">&nbsp;</td>
			</tr>
			<tr>
				<td class="Depth03">
				<!-- <a href="javascript:history()">최근 본 상품</a> -->최근 본 상품
				</td>
			</tr>
		</table>
	</td>
</tr>

</table> --%>

</body>

</html>