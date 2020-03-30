<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>财务</title>
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

<%@ include file="/jsp/header.jsp" %>

<div class="container">
		<div class="row">
			<div style="margin:0 auto;margin-top:10px;width:950px;">
				<strong>订单详情</strong>
				<table class="table table-bordered">
					<tbody>
					<tr class="warning">
						<th colspan="5">订单编号:${order.orderNo}</th>
					</tr>
					<tr class="warning">
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
					</tr>
					<c:forEach items="${order.orderItemVoList}" var="item">
						<tr class="active">
							<td width="60" width="40%">
								<input type="hidden" name="id" value="22">
								<img src="${pageContext.request.contextPath}/products/${item.productImage}" width="70" height="60">
							</td>
							<td width="30%">
								<a target="_blank">${item.productName}</a>
							</td>
							<td width="20%">
								￥${item.currentUnitPrice}
							</td>
							<td width="10%">
									${item.quantity}
							</td>
							<td width="15%">
								<span class="subtotal">￥${item.totalPrice}</span>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>

			<div style="text-align:right;margin-right:120px;">
				商品金额: <strong style="color:#ff6600;">￥${order.payment}元</strong>
			</div>
		</div>
</div>

<div style="text-align: center;margin-top: 5px;margin-bottom:20px;">
	Copyright &copy; 2020 网易云 版权所有
</div>

</body>
</html>