<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"/>

    <style>
        body {
            margin-top: 20px;
            margin: 0 auto;
            width: 100%;
        }
        .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }
    </style>
</head>
<body>
<%@ include file="/jsp/manageHeader.jsp" %>
<c:if test="${empty page.list}">
    <div class="row" style="width:1210px;margin:0 auto;">
        <div class="col-md-12">
            <h1>暂无商品信息</h1>
        </div>
    </div>
</c:if>
<c:if test="${not empty page.list}">
    <div class="row" style="width:1210px;margin:0 auto;">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
            </ol>
        </div>
        <c:forEach items="${page.list}" var="p">
            <div class="col-md-2" style="text-align:center;height:200px;padding:10px 0px;">
                <a href="${pageContext.request.contextPath}/manage/product/detail.do?productId=${p.id}">
                    <img src="${pageContext.request.contextPath}/products/${p.mainImage}" width="130" height="130" style="display: inline-block;">
                </a>
                <p><a href="${pageContext.request.contextPath}/manage/product/detail.do?productId=${p.id}" style='color:#666'>${p.name}</a></p>
                <c:forEach items="${markProductByUserId}" var="proId">
                    <c:if test="${p.id==proId}">
                        已售出
                    </c:if>
                </c:forEach>
                <p><font color="#E4393C" style="font-size:16px">&yen;${p.price}</font></p>
            </div>
        </c:forEach>
    </div>
</c:if>
<div class="container-fluid">
    <div style="text-align: center;margin-top: 5px;margin-bottom:20px;">
        <%@ include file="/jsp/pageProduct.jsp" %>
    </div>
</div>
<!--
        描述：页脚部分
    -->
<div class="container-fluid">
    <div style="text-align: center;margin-top: 5px;margin-bottom:20px;">
        Copyright &copy; 2020 网易云 版权所有
    </div>
</div>
</body>
</html>