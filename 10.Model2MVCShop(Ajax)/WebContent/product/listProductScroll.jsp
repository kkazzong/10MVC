<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title></title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css">
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
  <link type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript">
	
	//<!-- form data serialize function -->
	jQuery.fn.serializeObject = function() {
	    var obj = null;
	    try {
	        if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
	            var arr = this.serializeArray();
	            if (arr) {
	                obj = {};
	                $.each(arr, function() {
						if(this.name != 'pNo') {	                
		                   obj[this.name] = this.value;
						}
	                });
	            }//if ( arr ) {
	        }
	    } catch (e) {
	        alert(e.message);
	    } finally {
	    }
	 
	    return obj;
	};


	
	function fncGetList(currentPage) {
		console.log("������ ������ : "+currentPage);
		$("#currentPage").val(currentPage);
		
		 $("form[name='detailForm']").attr("method", "post")
													 .attr("action","/product/listProduct?menu=${param.menu}")
													 .submit();
													 
		/* console.log($("form[name='detailForm']").serialize());
		var formData = $("form[name='detailForm']").serializeObject();
		var formStr = "";
		
		console.log("formStr===>"+formData);
		
		$.ajax({
			url : "/product/json/listProduct",
			method : "post",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify(formData),
			dataType : "json",
			success : function(JSONData, status) {
				alert(status);
				console.log(JSON.stringify(JSONData));
				
				var listHtml = "��ü "+JSONData.resultPage.totalCount+" �Ǽ�, ���� "+JSONData.resultPage.currentPage+"������";
				
				console.log($("#result").html());
				
				$("#result").html(listHtml);
				
				console.log($(".ct_list_pop td:nth-child(2)").length);
				
				console.log(JSONData.productList.length);
				
				$($("p")[1]).remove();
				$($("p")[3]).remove();
				
				for(var i = 0; i < JSONData.productList.length; i++) {
					// var i = JSONData.productList.length;
					//$(".ct_list_pop td:nth-child(2)").each(i, function(){
					//	console.log($(this).text())
					//}); 
					var name = JSONData.productList[i].prodName;
					var price = JSONData.productList[i].price;
					var date = JSONData.productList[i].regDate;
					//console.log("name : "+name+", price : "+price+", date : "+date);
					
					var nameHtml = "<p data-photo='${file}'><input type='hidden' name='pNo' value='${product.prodNo }''>"+name;
					
					$($(".ct_list_pop p")[i]).html(nameHtml);
					console.log("��ǰ�̸�..."+$($(".ct_list_pop p")[i]).html());
					
					//$(".ct_list_pop td:nth-child(3)").text(price);
					//$(".ct_list_pop td:nth-child(4)").text(date);
				}
				
				
				
				console.log($($("p")[1]).text());
				console.log($($("p")[3]).html());
				$(".ct_list_pop td:nth-child(3)")
				
				$(".ct_list_pop td:nth-child(4)")
				
			}
		}); */
		
	}
		
	//<!-- update prod..-->
	function updateProduct(prodNo, elem) {
		console.log("������Ʈ��ư : prodNo=>"+prodNo);
		self.location = "/product/getProduct?prodNo="+prodNo+"&menu=manage";
		/* $.ajax({
			url : "/product/json/updateProduct/"+prodNo,
			method : "get",
			dataType : "json",
			success : function(JSONData, status) {
				alert(status);
				console.log(JSON.stringify(JSONData));
				
				
				console.log(elem);
				
				$("#"+prodNo).load("/product/getProduct?prodNo="+prodNo+"&menu=manage", JSON.stringify(JSONData));
				
			}
		}); */
		
	}
	
	function purchaseProduct(prodNo) {
		console.log("���Ź�ư : prodNo=>"+prodNo);
		self.location = "/purchase/addPurchase?prodNo="+prodNo;
	}
	
	$(function(){
		
		
		
		//���� scroll
		$(window).scroll(function(){
			console.log("scrolling.............");
			
			console.log($(document).height());
			console.log($(window).height());
			console.log($(window).scrollTop());
			
			if($(window).scrollTop() >= 81) {
				$.ajax({
					
					url : "/product/json/listProductAuto",
					method : "post",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					data : JSON.stringify({
						"currentPage" : 2
					}),
					dataType : "json",
					success : function(JSONData, status){
						//alert(status);
						//console.log(JSON.stringify(JSONData));
						//console.log("productList===>"+JSONData.length);
						
						for(var i = 0; i < JSONData.length; i++) {
							var htmlStr = "<td align='center'>"+(i+9)+"</td>"
												+"<td align='center'>"+JSONData[i].prodName+"</td>"
												+"<td align='center'>"+JSONData[i].price+"��</td>"
												+"<td align='center'>"+JSONData[i].regDate+"</td>";
							console.log($(".ct_list_pop:last-child").html());
							//$(".ct_list_pop tr:last").append(htmlStr);
						}
						
					}
				
				})
			}
			
		});
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//get ��� ���� ��
		var resultHtml = "��ü "+${resultPage.totalCount}+" �Ǽ�, ���� "+${resultPage.currentPage}+"������";
		$("#result").html(resultHtml);
		
		//console.log($(".ct_list_pop:nth-child(4n+2)").html());
		
		//<!-- ���̺� �� ���󺯰� -->
		$(".ct_list_pop:nth-child(4n+2)").css("background-color", "#F7CAC9");
		
		//<!-- ��ǰ��ȣ, ��ǰ���� �˻� -->
		var htmlStr = '<input type="text" name="searchKeyword"  value="${search.searchKeyword}" class="ct_input_g" style="width:200px; height:19px" />';
		if($("select[name='searchCondition']").val() == null || $("select[name='searchCondition']").val() < 2) {
			var htmlStr = '<input type="text" name="searchKeyword"  value="${search.searchKeyword}" class="ct_input_g" style="width:200px; height:19px" autocomplete="on" />';
			console.log("select ����"+htmlStr);
			console.log(changeHtml);
			$('span').html(htmlStr);
		} else {
			var changeHtml = "<input type='text' name='searchKeyword' value='${search.searchKeyword}' class='ct_input_g' style='width:80px; height:19px' />��~"
				+'<input type="text" name="searchKeywordPrice"  value="${search.searchKeywordPrice}" class="ct_input_g" style="width:80px; height:19px" />��';
				console.log(changeHtml);
				
				$('span').html(changeHtml);
		} 
		
		//<!-- autocomplete -->
		$("input:text[name='searchKeyword']").autocomplete({
			source: function( request, response ) {
		        $.ajax( {
		          url: "/product/json/listProductAuto",
		          method : "post",
		          headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
		          dataType: "json",
		          data: JSON.stringify({
		            "searchKeyword": request.term,
		            "searchCondition" : 1
		          }),
		          success: function( JSONData ) {
		        	console.log("server data===>"+JSON.stringify(JSONData));
		        	console.log("prodName===>"+JSONData[0].prodName);
		        	
		            response($.map(JSONData, function(value, key){
		            	console.log(value);
		            	console.log("key(autocomplete : value)====>"+key);
		        		return {
		        			label : value.prodName,
		        			value : value.prodName //������ key,, ���ýø� ����
		        		}
		        	}));
		          }
		        } );
		    }
		});
		
		
		//<!-- �˻��� ���� -->
		$("span").bind('keydown', function(event){
				
				if(event.keyCode == 13) {
					alert("keydown  "+event.keyCode);
					event.preventDefault();
					$("input:submit").click();
				}
		});
		
		//<!-- �˻���ư �������� -->
		$("input:submit").button().bind('click', function(){
			
			console.log("�˻� searchKeyword : "+$("input:text[name='searchKeyword']").val());
			console.log("�˻� searchKeywordPrice : "+$("input:text[name='searchKeywordPrice']").val());
			
			//var searchKeyword = document.detailForm.searchKeyword.value;
			var searchKeyword = $("input:text[name='searchKeyword']").val();
			
			if(searchKeyword == null || searchKeyword.length < 1) {
				alert("�˻�� �Է��Ͻʽÿ�");
				return;
			} else {
				fncGetList(1);
			}
		}); 
		
		//<!-- ���ݰ˻� �������� -->
		$("select[name='searchCondition']").bind('change', function(){
			console.log("select change : :  :"+$(this).html());
			$('span').html(htmlStr);
			
			$("input:text[name='searchKeyword']").val('');
			console.log("val Ȯ�� 1 : "+$("input:text[name='searchKeyword']").val());
			
			//<input type="text" name="searchKeyword"  value="${search.searchKeyword}" class="ct_input_g" style="width:80px; height:19px" />�� ~
			//<input type="text" name="searchKeywordPrice"  value="${search.searchKeywordPrice}" class="ct_input_g" style="width:80px; height:19px" />��
			
			if($(this).val() == 2) {
				
				$("input:text[name='searchKeyword']").val('');	
				$("input:text[name='searchKeywordPrice']").val('');
				
				console.log("val Ȯ�� 2 : "+$("input:text[name='searchKeywordPrice']").val());
				
				var changeHtml = "<input type='text' name='searchKeyword' value='' class='ct_input_g' style='width:80px; height:19px' />��~"
				+"<input type='text' name='searchKeywordPrice'  value='' class='ct_input_g' style='width:80px; height:19px' />��";
				console.log(changeHtml);
				
				$('span').html(changeHtml);
				$('span input:text[name="searchKeyword"]').val("${search.searchKeyword}");
				$('span input:text[name="searchKeywordPrice"]').val("${search.searchKeywordPrice}");
			}
			
		});
		
		//<!-- �̸����� -->
		$("select[name='sortCondition']").bind('change', function(){
			//console.log("�̸� ����"+$(this).text());
			$("select[name='sortCondition2']").val("");
			fncGetList(1);
		});
		
		//<!-- �������� -->
		$("select[name='sortCondition2']").bind('change', function(){
			$("select[name='sortCondition']").val("");
			fncGetList(1);
		});
		
		//<!-- manager �Ǹ� �Ϸ� ��ǰ -->
		$(".ct_btn01:contains('���� ��ǰ ����')").bind('click', function(){
			console.log($(this).html());
			self.location = "/purchase/listSale?menu=${param.menu}";
			//fncGetList(1);
		});
		
		//<!-- search �Ǹ� �Ϸ� ��ǰ -->
		$(".ct_btn01:contains('�Ǹŵ� ��ǰ ����')").bind('click', function(){
			$("#searchSoldProd").val("1");
			fncGetList(1);
		});
	
		//<!-- ��ǰ �󼼺���-->
		/* $(".ct_list_pop td:nth-child(5), .ct_list_pop td:nth-child(3)").bind('click', function(){
			var name = $(this).text().trim();
			console.log(name);
			
			console.log($("input:hidden[name='pNo']",this).val());
			
			//self.location="/product/getProduct?prodNo="+$($($(this).siblings('td'))[0]).text().trim()+"&menu=${param.menu}";
			self.location="/product/getProduct?prodNo="+$("input:hidden[name='pNo']",this).val()+"&menu=${param.menu}";
		});  */
		
		///*
		$("p").bind('click', function(){
			
			var prodNo = $("input:hidden[name='pNo']",this).val();
			console.log("prodNO===>"+prodNo);
			
			//<!-- ajax ��ǰ ���� -->
			$.ajax({
				url : "/product/json/getProduct/"+prodNo,
				method : "get",
				dataType : "json",
				success : function(JSONData, status){
					console.log(status);
					console.log(JSON.stringify(JSONData));
					var displayStr = "<h4>��ǰ�� : "+JSONData.prodName+"<br>"
											+"��ǰ������ : "+JSONData.prodDetail+"<br>"
											+"��ǰ���� : "+JSONData.prodDetail+"��<br>";
					if(JSONData.fileName != null) {
						displayStr += "��ǰ�̹��� : <br>";
						var fileName = "";
						for(var i = 0; i < JSONData.fileName.length; i++) {
							displayStr += "<img width='100px' heigth='100px' src='../images/uploadFiles/"+JSONData.fileName[i]+"'>";
						}
					}
					<c:if test="${param.menu == 'manage'}">
						displayStr += "<br><input type='button' value='�����ϱ�' onclick='updateProduct("+prodNo+")'>";
					</c:if>
					<c:if test="${param.menu == 'search'}">
					displayStr += "<br><input type='button' value='�����ϱ�' onclick='purchaseProduct("+prodNo+")'>";
				</c:if>
					$("h4").remove();
					$("#"+prodNo).html(displayStr);
				}
			});
			
			
			//var name = $(this).text().trim();
			//console.log(name);
			
			//console.log($("input:hidden[name='pNo']",this).val());
			
			//self.location="/product/getProduct?prodNo="+$($($(this).siblings('td'))[0]).text().trim()+"&menu=${param.menu}";
			//self.location="/product/getProduct?prodNo="+$("input:hidden[name='pNo']",this).val()+"&menu=${param.menu}"; 
		}); 
		//*/
		
		//<!-- ���ڵ�� -->
		/* console.log($($("div")[1]).html());
		$($("div")[1]).accordion({	
			header : "a",
			collapsible : true,
			event : "click",
			heightStyle : "fill"
		}); */
		
		//<!-- �� -->
		/* $($("div")[1]).tabs({
			collapsible : true,
			active : 1,
			event : "click"
		}); */
		
		
		
		//<!-- �̹����̸����� file tootip -->
		$("p").tooltip({
				items : "[data-photo]",			
				content : function(){
					var path = $(this).data('photo');
					console.log("html �±� :: <img src='../images/uploadFiles/"+path+"'> ");
					return "<img class='prod_img' src='../images/uploadFiles/"+path+"'> ";
				}
		});
		
		//console.log($("a").tooltip("option","content"));
		
		
		$(".ct_list_pop td:nth-child(5)").button().bind('click', function(){
			
			console.log($(this).text().trim());
			
			console.log($("input:hidden[name='pNo']",this).val())
			
			var result = confirm("������ �����Ͻðڽ��ϱ�?");
			if(result) {
				self.location="/product/deleteProduct?prodNo="+$("input:hidden[name='pNo']",this).val();
			} else {
				return;
			}
		});
		
		$("p:contains('�ڷ�')").bind("click", function(){
			self.location = "/product/listProduct?menu=${param.menu}&currentPage=1";
		}); 
		
	});
</script>
<style type="text/css">
	.prod_img{
		height : 100px;
		width : 100px;
	}
   	.ui-button{
   		background:#f06561;
   	}
</style>
</head>

<body bgcolor="#ffffff" text="#000000">


<div style="width:98%; margin-left:10px;">

<!-- form name="detailForm" action="/listProduct.do?menu=<%--=menu--%>" method="post"-->
<%-- <form name="detailForm" action="/listProduct.do?menu=${param.menu}" method="post"> --%>
<form name="detailForm">
<%-- <form name="detailForm" action="/product/listProduct/${menu}" method="post"> --%>
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				<%-- if(menu.equals("manage")) { --%>
				<c:if test="${param.menu == 'manage'}">
				<%-- <c:if test="${menu == 'manage'}"> --%>
					<td width="93%" class="ct_ttl01">��ǰ ����</td>
				<%-- } else { --%>
				</c:if>
				<c:if test="${param.menu == 'search'}">
				<%-- <c:if test="${menu == 'search'}"> --%>
					<td width="93%" class="ct_ttl01">��ǰ �����ȸ</td>
				<%-- } --%>
				</c:if>
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table border="0" cellspacing="0" cellpadding="0" style="margin-top:10px; overflow:scroll">
	<tr>
		<td></td>
		<td align="left">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<c:if test="${param.menu == 'manage'}">
				<%-- <c:if test="${menu == 'manage'}"> --%>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
					<%-- <a href="/listSale.do?menu=${param.menu}">���� ��ǰ ����</a> --%>
					<%-- <a href="/purchase/listSale?menu=${param.menu}">���� ��ǰ ����</a --%>
					���� ��ǰ ����
				</td>
				</c:if>
				<c:if test="${param.menu == 'search'}">
				<%-- <c:if test="${menu == 'search'}"> --%>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
						<input type="hidden" id="searchSoldProd" name="searchSoldProd" value="${search.searchSoldProd}"/>
						<!-- <a href="javascript:fncGetList2('1');">�Ǹŵ� ��ǰ ����</a> -->
						�Ǹŵ� ��ǰ ����
					</td>
					<c:if test="${search.searchSoldProd == 1}">
						<%-- <a href="/listProduct.do?menu=${param.menu}&currentPage=1">�ڷ�</a> --%>
						<%-- <a href="/product/listProduct?menu=${param.menu}&currentPage=1">�ڷ�</a> --%>
						<p>�ڷ�</p>
						<%-- <a href="/purchase/listProduct?${menu}/${search.currentPage}">�ڷ�</a> --%>
					</c:if>
				</c:if>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
			</tr>
		</table>
		</td>
		<td align="right">
				<select name="searchCondition" class="ct_input_g" style="width:80px">
					<c:if test="${param.menu == 'manage'}">
					<%-- <c:if test="${menu == 'manage'}"> --%>
					<option value="0" ${!empty search.searchCondition && search.searchCondition == 0 ? "selected" : ""} >��ǰ��ȣ</option>
					</c:if>
					<option value="1" ${!empty search.searchCondition && search.searchCondition == 1 ? "selected" : ""}>��ǰ��</option>
					<option value="2" ${!empty search.searchCondition && search.searchCondition == 2 ? "selected" : ""}>��ǰ����</option>
				</select>
				<span>
				</span>
		</td>
		<td align="right" width="70">
			<!-- <table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" id="search" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetSearchList('1');">�˻�</a>
						�˻�
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table> -->
			<input type="submit" value="�˻�"/>
		</td>
	</tr>
</table>


<!-- <div style="width:98%;"> -->
<table width="70%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;" align="center">
	<%-- <tr id="result">
		<td colspan="11" >��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������</td>
	</tr> --%>
	<tr>
		<td  id="result" colspan="11"></td>
	</tr>
	<tr>
		<td class="ct_list_b" width="50">No</td>
		<%-- <c:if test="${param.menu == 'manage'}">
		<td class="ct_list_b" width="100">��ǰ��ȣ</td>
		</c:if> --%>
		<td class="ct_list_b" width="150">��ǰ��
		<select name="sortCondition" class="ct_input_g" style="width:40px">
			<option value="" ${!empty search.sortCondition2 ? "selected":""} >��</option>
			<option value="asc" ${!empty search.sortCondition && search.sortCondition == 'asc' ? "selected" : ""}>��~��</option>
			<option value="desc" ${!empty search.sortCondition && search.sortCondition == 'desc' ? "selected" : ""}>��~��</option>
		</select>
		</td>
		<td class="ct_list_b" width="150">����
		<select name="sortCondition2" class="ct_input_g" style="width:40px">
			<option value="" ${!empty search.sortCondition ?  "selected":""}>��</option>
			<option value="asc" ${!empty search.sortCondition2 && search.sortCondition2 == 'asc' ? "selected":"" }>������</option>
			<option value="desc" ${!empty search.sortCondition2 && search.sortCondition2 == 'desc' ? "selected":"" }>������</option>
		</select>
		</td>
		<c:if test="${param.menu == 'manage'}">
		<%-- <c:if test="${menu == 'manage'}"> --%>
		<td class="ct_list_b"  width="150">�����</td>	
		<td class="ct_list_b"  width="150">����</td>	
		</c:if>
		<!-- <td class="ct_list_b"  width="150">�������</td>	 -->
	</tr>
	
	<tr>
		<td colspan="20" bgcolor="808285" height="1"></td>
	</tr>
	<c:set var="i" value="0"/>
	<c:forEach var="product" items="${list}">
	<tr class="ct_list_pop">
		<!-- <td align="center"><%--= no--%></td> -->
		<c:set var="i" value="${i+1}"/>
		<td align="center">${i}</td>
		<%-- <c:if test="${param.menu == 'manage'}">
		<td align="center">${product.prodNo}</td>
		</c:if> --%>
			<c:choose>
				<c:when test="${product.proTranCode == '0' or product.proTranCode == null }">
					<td align="center">
					<c:forEach var="files" items="${product.fileName}">
						<c:set var="file" value="${files}"/>
					</c:forEach>
					<p data-photo="${file}">
					<input type="hidden" name="pNo" value="${product.prodNo }">
					${product.prodName}
					</p>
					</td>
				</c:when>
				<c:otherwise>
					<td align="center">${product.prodName}</td>
				</c:otherwise>
			</c:choose>
		<td align="center">${product.price} ��</td>
		<c:if test="${param.menu == 'manage'}">
		<td align="center">${product.regDate}</td>
		<!--  ������ư -->
	<td align="center">
		<%-- <table border="0" cellspacing="0" cellpadding="0">
		<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
					<input type="hidden" name="pNo" value="${product.prodNo }">
						����
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
		</tr>	
		</table> --%>
		<input type="hidden" name="pNo" value="${product.prodNo}"/>
		����
	</td>
		</c:if>
		<%-- <td align="center">
		
		${product.proTranCode}
		<c:if test="${param.menu == 'manage'}">
		<c:if test="${menu == 'manage'}">
			<c:choose>
				<c:when test="${product.proTranCode == 0 or product.proTranCode == null}">
					�Ǹ���
				</c:when>
				<c:when test="${product.proTranCode == 1}">
					���ſϷ� <a href="/updateTranCodeByProd.do?prodNo=${product.prodNo}&tranCode=2">����ϱ�</a>
					���ſϷ� 
				</c:when>
				<c:when test="${product.proTranCode == 2}">
					�����
				</c:when>
				<c:when test="${product.proTranCode == 3}">
					��ۿϷ�
				</c:when>
			</c:choose>
		</c:if>
		<c:if test="${param.menu == 'search' }">
		<c:if test="${menu == 'search' }">
			<c:choose>
				<c:when test="${product.proTranCode == 0 or product.proTranCode == null}">
					�Ǹ���
				</c:when>
				<c:otherwise>
					�������
				</c:otherwise>
			</c:choose>
		</c:if>
		</td>	 --%>
	</tr>
	<!-- ��ǰ ���� -->
	<tr>
	<td id="${product.prodNo}" align="center" colspan="20" bgcolor="92A8D1" height="1">
	<div id="updateView"></div>
	</td>
	</tr>
	<!-- <tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	 -->
	</c:forEach>
</table>
<!-- </div> -->

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<c:import var="importPage" url="/common/pageNavigator.jsp" scope="application"/>
		${ importPage }
		</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>

</div>

</body>
</html> 