<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <LINK href="<%=path %>/css/css.css" type=text/css rel=stylesheet>
  <head>
      <script type="text/javascript">
         function admin()
         {
            var url="<%=path %>/login.jsp";
            window.open(url,"_blank");
         } 
         function zuoyeFabu()
         {
            <c:if test="${sessionScope.user==null}">
                  alert("请先登录");
            </c:if>
            <c:if test="${sessionScope.user!=null && sessionScope.user.type==2}">
                  alert("你是学生用户不能发布作业");
            </c:if>
            <c:if test="${sessionScope.user!=null && sessionScope.user.type==1}">
                  var url="<%=path %>/doc.do?type=zuoyeMana";
                  window.location.href=url;
            </c:if>
         }
      
         
         function zuoyeXiazai()
         {
            <c:if test="${sessionScope.user==null}">
                  alert("请先登录");
            </c:if>
            <c:if test="${sessionScope.user!=null && sessionScope.type==2}">
                  var url="<%=path %>/doc.do?type=zuoyeAll";
                  window.location.href=url;
            </c:if>
            <c:if test="${sessionScope.user!=null && sessionScope.type==1}">
                  var url="<%=path %>/doc.do?type=zuoyeAll";
                  window.location.href=url;
            </c:if>
         }
          
         function liuyanAll1()
         {
             var url="<%=path %>/liuyan.do?type=liuyanAll1";
             window.location.href=url;
         } 
         
         function liuyanAll()
         {
            <c:if test="${sessionScope.user==null}">
                  alert("请先登录");
            </c:if>
            
            <c:if test="${sessionScope.user!=null}">
                var url="<%=path %>/liuyan.do?type=liuyanAll";
				var targetWinName="newWin";
				var features="width="+screen.width-200+" ,height="+screen.height-150+" ,toolbar=no, top=0, left=0, menubar=no, scrollbars=no, resizable=no,location=no, status=no"
				var new_win=window.open(url,targetWinName,features);
            </c:if>
         } 
      </script>
  </head>
  
  <body>
  <div id=lianjie>
       <A href="<%=path %>/qiantai/default.jsp">首 页</A> &nbsp;&nbsp;
       <a href="#" onclick="liuyanAll1()">在线留言</A> &nbsp;&nbsp;
       <a href="#" onclick="zuoyeFabu()">发布资料</A> &nbsp;&nbsp;
       <a href="#" onclick="zuoyeXiazai()">下载资料</A> &nbsp;&nbsp;
       <a href="<%=path %>/doc?type=shipinAll">教学视频</A> &nbsp;&nbsp;
      
	   <a href="#" onclick="admin()">后台管理</a> &nbsp;&nbsp;
	   </div>
  </body>
</html>
