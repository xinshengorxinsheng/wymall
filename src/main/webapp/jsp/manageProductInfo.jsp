﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
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
			<div class="row">
				<div style="border: 1px solid #e4e4e4;width:930px;margin-bottom:10px;margin:0 auto;padding:10px;margin-bottom:10px;">
					<a href="${pageContext.request.contextPath}/jsp/manageHome.jsp">首页&nbsp;&nbsp;&gt;</a>
					<a>音乐专辑</a>
				</div>
				<div style="margin:0 auto;width:950px;">

					<form id="myForm" method="post" action="${pageContext.request.contextPath}/manage/product/edit.do">
					<div class="col-md-6">
						<img style="opacity: 1;width:400px;height:350px;" title="" class="medium" src="${pageContext.request.contextPath}/products/${manageProduct.mainImage}">
					</div>
					<div class="col-md-6">
						<div><strong>${manageProduct.name}</strong></div>
						<div style="border-bottom: 1px dotted #dddddd;width:350px;margin:10px 0 10px 0;">
							<div>编号：${manageProduct.id}</div>
						</div>
						<div style="margin:10px 0 10px 0;">参考价: <strong style="color:#ef0101;">￥：${manageProduct.price}元/份</strong>
						</div>
						<div style="padding:10px;border:1px solid #e7dbb1;width:330px;margin:15px 0 10px 0;;background-color: #fffee6;">
							<div style="margin:5px 0 10px 0;"/>
							<div style="border-bottom: 1px solid #faeac7;margin-top:20px;padding-left: 10px;">购买数量:
								<input id="quantity" name="count" value="1" maxlength="4" size="10" type="text"> </div>
							<input type="hidden" name="productId" value="${manageProduct.id}"/>

							<div style="margin:20px 0 10px 0;;text-align: center;">
								<a href="javascript:void(0)">
									<input id="btnId" style="background: url('${pageContext.request.contextPath}/img/product.gif') no-repeat scroll 0 -600px rgba(0, 0, 0, 0);height:36px;width:127px;" value="编辑商品" type="button">
								</a></div>
						</div>
					</div>
					</form>
				</div>
				<div class="clear"></div>
				<div class="clear"></div>
				<div style="width:950px;margin:0 auto;">
					<div style="background-color:#d3d3d3;width:930px;padding:10px 10px;margin:10px 0 10px 0;">
						<strong>热度点评</strong>
						<h3>${manageProduct.subtitle}</h3>
					</div>
				</div>
			</div>
		</div>
		<div style="text-align: center;margin-top: 5px;margin-bottom:20px;">
			Copyright &copy; 2020 网易云 版权所有
		</div>
	</body>
	<script>
        console.log(${pageContext.request.contextPath});
		$(function(){
			$("#btnId").click(function(){
				var formObj=document.getElementById("myForm");
				formObj.submit();
			});
		});
	</script>
</html>