<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>网易内容销售</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
</head>

<body>
<div class="container-fluid">
    <%@ include file="/jsp/header.jsp" %>
    <!--

        描述：商品显示
    -->
    <div class="container-fluid">
        <div class="col-md-12">
            <h2>热门商品&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/img/title2.jpg"/></h2>
        </div>
        <c:if test="${empty page.list}">
            <div class="row" style="width:1210px;margin:0 auto;">
                <div class="col-md-12">
                    <h1>暂无商品信息</h1>
                </div>
            </div>
        </c:if>
        <c:if test="${not empty page.list}">
            <div class="col-md-2" style="border:1px solid #E7E7E7;border-right:0;padding:0;">
                <img src="${pageContext.request.contextPath}/products/ad02.jpg" width="205" height="300" style="display: inline-block;"/>
            </div>
            <div class="col-md-10">
                <div class="col-md-6" style="text-align:center;height:200px;padding:0px;">
                    <img src="${pageContext.request.contextPath}/products/product06.jpg" width="350px" height="200px" style="display: inline-block;">
                </div>
                <c:forEach items="${page.list}" var="p">
                    <div class="col-md-2" style="text-align:center;height:200px;padding:10px 0px;">
                        <a href="${pageContext.request.contextPath}/product/detail.do?productId=${p.id}">
                            <img src="${pageContext.request.contextPath}/products/${p.mainImage}" width="130" height="130" style="display: inline-block;">
                        </a>
                        <p><a href="${pageContext.request.contextPath}/product/detail.do?productId=${p.id}" style='color:#666'>${p.name}</a></p>
                        <c:forEach items="${markProductByUserId}" var="proId">
                            <c:if test="${p.id==proId}">
                                已购买
                            </c:if>
                        </c:forEach>
                        <p><font color="#E4393C" style="font-size:16px">&yen;${p.price}</font></p>
                    </div>
                </c:forEach>
            </div>
        </c:if>
    </div>
</div>
<div class="container-fluid">
    <div style="text-align: center;margin-top: 20px;margin-bottom:20px;">
        <%@ include file="/jsp/pageProduct.jsp"%>
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


