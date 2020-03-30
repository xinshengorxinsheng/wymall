<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%--分页显示的开始 --%>
    	<div style="text-align:center">
    		共${page.pages}页/第${page.pageNum}页
    		
    		
    		<!-- <a href="/store_v5/ProductServlet?method=findProductsByCidWithPage&cid=1&num=1">首页</a> -->
    		
    		<%-- <a href="${pageContext.request.contextPath}/OrderServlet?method=findMyOrdersWithPage&num=1">首页</a> --%>
    		
    		<%-- <a href="${pageContext.request.contextPath}/AdminProductServlet?method=findAllProductsWithPage&num=1">首页</a> --%>
    		
    		<a href="${pageContext.request.contextPath}/order/list.do?pageNum=1&pageSize=9">首页</a>
    		<a href="${pageContext.request.contextPath}/order/list.do?pageNum=${page.prePage}&pageSize=9">上一页</a>
    		<%--显示的页码，使用forEach遍历显示的页面 --%>
    		<c:forEach begin="${page.firstPage}" end="${page.lastPage}" var="pagenum">
    			<a href="${pageContext.request.contextPath}/order/list.do?pageNum=${pagenum}&pageSize=9">${pagenum}</a>
    		</c:forEach>
    		
    		<a href="${pageContext.request.contextPath}/order/list.do?pageNum=${page.nextPage}&pageSize=9">下一页</a>
    		<a href="${pageContext.request.contextPath}/order/list.do?pageNum=${page.lastPage}&pageSize=9">末页</a>
    		<input type="text" id="pagenum" name="pagenum" size="1"/><input type="button" value="前往" onclick="jump()" />
    		<script type="text/javascript">
    			function jump(){
    				var totalpage = ${page.pages};
    				var pagenum = document.getElementById("pagenum").value;
    				//判断输入的是一个数字
    				var reg =/^[1-9][0-9]{0,1}$/;
    				if(!reg.test(pagenum)){
    					//不是一个有效数字
    					alert("请输入符合规定的数字");
    					return ;
    				}
    				//判断输入的数字不能大于总页数
    				if(parseInt(pagenum)>parseInt(totalpage)){
    					//超过了总页数
    					alert("不能大于总页数");
    					return;
    				}
    				//转向分页显示的Servlet
    				window.location.href="${pageContext.request.contextPath}/order/list.do?pageNum="+pagenum+"&pageSize=9";
    			}
    		</script>
    	</div>
    	<%--分页显示的结束--%>
