<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/12/23
  Time: 0:59
--%>
<%@ page import="toolbean.dbTool" %>
<%@ page import="valuebean.themeInfo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<div  class="panel panel-default" style="width:80%;margin-left: 50px;margin-right: 50px;margin-top: 20px">
    <%
        dbTool dbt = new dbTool();
        String sql = "select theme_id,theme.one_line_describe,author_id,user_name,theme_name,theme_content,update_time,like_count,comment_count "
                + "from theme,user " + "where theme_flag=0 and author_id=user_id and theme_id='"+request.getParameter("theme_id")+"';";
        ArrayList<themeInfo> list = dbt.findTheme(sql);
        for(int i = 0; i < list.size(); i++){
            themeInfo themeinfo = list.get(i);
    %>
    <div class="panel-heading" style="text-align:left;"><%=themeinfo.getTheme_name()%></div>
    <table width="100%"  class="table " style="border-collapse:separate; border-spacing:0px 0px;">
        <tr>
            <td style="text-align:left;margin: 0px">
                <p class="text-muted" style="padding:20px;font-size:16px;text-align: left;margin: 0px"><%=themeinfo.getTheme_content()%></p>
            </td>
            <td>
                <p style="padding:20px;text-align: right;margin: 0px"><a href="User.jsp?user_id=<%=themeinfo.getAuthor_id()%>"><%=themeinfo.getAuthor_name()%></a>
                    <br><%=themeinfo.getUpdate_time()%>
                </p>
            </td>
        </tr>
        <%}%>
    </table>
</div>
<%@include file="footer.jsp"%>