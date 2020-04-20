<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/12/24
  Time: 15:30
--%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="valuebean.themeInfo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%
    dbTool dbt = new dbTool();
    String sql = "select * from theme,user where theme_flag=0 and author_id=user_id and author_id=" + user.getUser_id()
            + " and theme_name='" + URLDecoder.decode(request.getParameter("theme_name"),"utf-8")+"';";
    ArrayList<themeInfo> list=dbt.findTheme(sql);
    themeInfo themeinfo = list.get(0);
%>
<ul class="breadcrumb" style="text-align: left;margin-left:50px;width: 80%;margin-top: 10px">
    <li><a href="StatusesContent.jsp">动态</a> <span class="divider"></span></li>
    <li class="active"><%=themeinfo.getTheme_name()%></li>
</ul>
<div  class="panel panel-default" style="width:80%;margin-left: 50px;margin-right: 50px;margin-top: 20px">
    <div class="panel-heading" style="text-align:left;">
        <%=themeinfo.getTheme_name()%>
        <a href="servlet/ThemeDeleteServlet?theme_id=<%=request.getParameter("theme_id")%>"
           onclick="return confirm('是否删除？')" class="btn btn-sm btn-default" style="font-size: 10px">删除主题</a>
    </div>
    <table width="100%"  class="table " style="border-collapse:separate; border-spacing:0px 0px;">
        <tr>
            <td style="text-align:left;margin: 0px">
                <p class="text-muted" style="padding:20px;font-size:16px;text-align: left;margin: 0px"><%=themeinfo.getTheme_content()%></p>
            </td>
            <td>
                <p style="padding:20px;text-align: right;margin: 0px"><a href="UserContent.jsp?user_id=<%=themeinfo.getAuthor_id()%>"><%=themeinfo.getAuthor_name()%></a>
                    <br><%=themeinfo.getUpdate_time()%>
                </p>
            </td>
        </tr>
    </table>
<%@include file="footer.jsp"%>