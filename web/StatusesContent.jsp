<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/11/27
  Time: 10:21
--%>
<%@ page import="toolbean.dbTool" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="valuebean.themeInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<div id="mianban" class="panel panel-default" style="width:80%;margin-left: 50px;margin-right: 50px;margin-top: 20px">
    <%--   实现页面内容改变 --%>
    <script language="javascript">
        $(document).ready(function(){
            $("#headerbar a").click(function(){
                $this = $(this);
                if ($this[0].innerHTML=="全站动态"){
                    $("#headerbar li").removeClass("active");
                    $this.parent().addClass("active");
                    $this[0].attributes.href='#';
                    $("#StatusesCollection").hide();
                    $("#Statuses").show();
                }else if($this[0].innerHTML=="关注动态"){
                    $("#headerbar li").removeClass("active");
                    $this.parent().addClass("active");
                    $this[0].attributes.href='#';
                    $("#StatusesCollection").show();
                    $("#Statuses").hide();
                }
            });
        });
    </script>
    <table width="100%"  class="table " style="border-collapse:separate; border-spacing:0px 0px;">
        <tr>
            <ul class="nav nav-tabs" id="headerbar" >
                <li class="active"><a >关注动态</a></li>
                <li><a >全站动态</a></li>
            </ul>
        </tr>
    </table>
    <%--关注动态--%>
    <table style="width: 100%" id="StatusesCollection">
        <%
            dbTool dbt = new dbTool();
            String sql = "select * from\n" + "(select theme_id,theme.one_line_describe,author_id,theme_name,theme_content,update_time "
                    + "from theme,user where theme_flag=0 and author_id=following_id and user_id=" + user.getUser_id()+") as a join user where user_id=author_id";
            ArrayList<themeInfo>list = dbt.findTheme(sql);
            for(int i = 0; i < list.size(); i++){
                themeInfo themeinfo = list.get(i);
        %>
        <tr>
            <td style="text-align:left;margin: 0px">
                <a href="UserContent.jsp?user_id=<%=themeinfo.getAuthor_id()%>"><%=themeinfo.getAuthor_name()%></a>
                <small><%=themeinfo.getUpdate_time()%></small>
                <p style="font-size:12px;text-align: left;margin: 0px"><a href="ThemeContent.jsp?theme_id=<%=themeinfo.getTheme_id()%>"><%=themeinfo.getTheme_name()%></a></p>
            </td>
            <td>
                <p></p>
                <p style="text-align: right;margin: 0px"><i class="iconfont icon-praise_icon" style="font-size:14px;"></i><i style="font-size:14px;" class="iconfont icon-pinglun"></i></p>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    <%--全站动态--%>
    <table style="width: 100%;" hidden id="Statuses" >
        <%
            String sql_Statuses = "select * from theme,user where theme_flag=0 and author_id=user_id;";
            ArrayList<themeInfo>list_Statuses = dbt.findTheme(sql_Statuses);
            for(int i = 0; i < list_Statuses.size(); i++){
                themeInfo themeinfo_Statuses = list_Statuses.get(i);
        %>
        <tr>
            <td style="text-align:left;margin: 0px">
                <a href="UserContent.jsp?user_id=<%=themeinfo_Statuses.getAuthor_id()%>"><%=themeinfo_Statuses.getAuthor_name()%></a>
                <small><%=themeinfo_Statuses.getUpdate_time()%></small>
                <p style="font-size:12px;text-align: left;margin: 0px"><a href="ThemeContent.jsp?theme_id=<%=themeinfo_Statuses.getTheme_id()%>"><%=themeinfo_Statuses.getTheme_name()%></a></p>
            </td>
            <td>
                <p></p>
                <p style="text-align: right;margin: 0px"><i class="iconfont icon-praise_icon" style="font-size:14px;"></i><i style="font-size:14px;" class="iconfont icon-pinglun"></i></p>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</div>
<%@include file="footer.jsp"%>