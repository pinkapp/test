<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
        
        <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
        <script type="text/javascript" src="<%=path %>/js/popup.js"></script>
        <script language="javascript">
            function up()
		    {
		        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
	            pop.setContent("contentUrl","<%=path %>/upload/upload.jsp");
	            pop.setContent("title","文件上传");
	            pop.build();
	            pop.show();
		    }
		    function down1(fujianPath,fujianYuashiMing)
           {
               var url="<%=path %>/updown/updown.jsp?fujianPath="+fujianPath+"&fujianYuashiMing="+fujianYuashiMing;
		       url=encodeURI(url); 
               window.open(url,"_self");
           }
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/doc?type=shipinAdd" name="formAdd" method="post">
				  <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
			              <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
							    <td width="15%" bgcolor="#FFFFFF" align="center">
							        视频名称：
							    </td>
							    <td width="85%" bgcolor="#FFFFFF" align="left">
							        <input type="text" name="mingcheng"/>
							    </td>
							</tr>
							<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
							    <td width="15%" bgcolor="#FFFFFF" align="center">
							        附件：
							    </td>
							    <td width="85%" bgcolor="#FFFFFF" align="left">
							        <input type="text" name="fujian" id="fujian" size="30" readonly="readonly"/>
							        <input type="button" value="上传" onclick="up()"/>
							        <input type="hidden" name="fujianYuanshiming" id="fujianYuanshiming"/>
							    </td>
							</tr>
							<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
							    <td width="15%" bgcolor="#FFFFFF" align="center">
							        &nbsp;
							    </td>
							    <td width="85%" bgcolor="#FFFFFF" align="left">
							       <input type="submit" value="提交"/>&nbsp; 
							       <input type="reset" value="重置"/>&nbsp;
							    </td>
							</tr>
       			    </table>  
			</form>
   </body>
</html>
