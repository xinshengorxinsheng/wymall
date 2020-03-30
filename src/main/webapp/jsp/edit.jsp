<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>商品详情信息</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
	<!-- 引入自定义css文件 style.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"/>
	<style>
		body {
			margin-top: 20px;
			margin: 0 auto;
		}
		.carousel-inner .item img {
			width: 100%;
			height: 300px;
		}
	</style>
</head>
<body>
<%@ include file="/jsp/manageHeader.jsp" %>
		<div class="container">
				<div style="border: 1px solid #e4e4e4;width:930px;margin-bottom:10px;margin:0 auto;padding:10px;margin-bottom:10px;">
					<a href="${pageContext.request.contextPath}/jsp/manageHome.jsp">首页&nbsp;&nbsp;&gt;</a>
					<a>内容编辑</a>
				</div>
			<div style="text-align: center;margin-top: 5px;margin-bottom:20px;">
				<form name="form1" action="/manage/product/uploadEdit.do" method="post" enctype="multipart/form-data">
					<div style="border-bottom: 1px solid #faeac7;margin-top:20px;padding-left: 10px;">
						<table>
							<tr>
								<td ><label style="height:24px">商品图片:</label></td>
								<td><div style="height:40px"><input style="line-height:24px" type="file" name="upload_file"></div></td>
							</tr>
							<tr>
								<td>&nbsp&nbsp&nbsp&nbsp;</td>
								<td><div style="height:40px"><input style="line-height:24px" type="submit" value="上传"></div></td>
							</tr>
						</table>
					</div>
				</form>
				<form id="myForm" method="post" action="${pageContext.request.contextPath}/manage/product/save.do" enctype="multipart/form-data">
						<input type="hidden" name="categoryId" value=${manageProduct.categoryId}>
						<div style="border-bottom: 1px solid #faeac7;margin-top:20px;padding-left: 10px;">商品名称:
							<input id="pName" name="name" value=${manageProduct.name} maxlength="80" size="80" type="text">
						</div>
						<div style="border-bottom: 1px solid #faeac7;margin-top:20px;padding-left: 10px;">商品描述:
							<input id="pDec" name="subtitle" value=${manageProduct.subtitle} maxlength="80" size="80" type="text">
						</div>
						<c:if test="${empty uri}">
							<input type="hidden" name="mainImage" value=${manageProduct.mainImage}>
							<input type="hidden" name="subImages" value=${manageProduct.subImages}>
							<input type="hidden" name="detail" value=${manageProduct.detail}>
						</c:if>
						<c:if test="${not empty uri}">
							<input type="hidden" name="mainImage" value=${uri}>
							<input type="hidden" name="subImages" value=${uri}>
							<input type="hidden" name="detail" value=${uri}>
						</c:if>
						<div style="border-bottom: 1px solid #faeac7;margin-top:20px;padding-left: 10px;">商城价格:￥
							<input id="pPrice" name="price" value=${manageProduct.price} maxlength="80" size="80" type="text">
						</div>
						<div style="border-bottom: 1px solid #faeac7;margin-top:20px;padding-left: 10px;">商城库存：
							<input id="pStock" name="stock" value=${manageProduct.stock} maxlength="80" size="80" type="text">
						</div>
						<input type="hidden" name="status" value=${manageProduct.status}>
						<input type="hidden" name="id" value=${manageProduct.id}>
						<div style="margin:20px 0 10px 0;;text-align: center;">
							<a href="javascript:void(0)">
								<input id="btnId" style="background: url('${pageContext.request.contextPath}/img/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
										height:35px;width:100px;color:white;" value="确定" type="button">
							</a>
						</div>
				</form>
			</div>
		</div>
		<div class="container-fluid">
			<div style="text-align: center;margin-top: 5px;margin-bottom:20px;">
				Copyright &copy; 2020 网易云 版权所有
			</div>
		</div>
	</body>
<script>
	$(function(){
		$("#btnId").click(function(){
			var formObj=document.getElementById("myForm");
			formObj.submit();
		});
	});
</script>
<html>