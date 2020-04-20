<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/12/22
  Time: 22:59
--%>
<%@ page import="toolbean.dbTool" %>
<%@ page import="valuebean.userInfo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="valuebean.bookInfo" %>
<%@ page import="valuebean.themeInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%--   实现页面内容改变 --%>
<script language="javascript">
    $(document).ready(function(){
        $("#headerbar a").click(function(){
            $this = $(this);
            if ($this[0].innerHTML=="书籍"){
                $("#headerbar li").removeClass("active");
                $this.parent().addClass("active");
                $this[0].attributes.href='#';
                $("#Book").show();
                $("#Statuses").hide();
            }else if($this[0].innerHTML=="动态"){
                $("#headerbar li").removeClass("active");
                $this.parent().addClass("active");
                $this[0].attributes.href='#';
                $("#Book").hide();
                $("#Statuses").show();
            }
        });
    });
</script>
<div  class="panel panel-default" style="width:80%;margin-left: 50px;margin-right: 50px;margin-top: 20px">
    <div class="panel-heading" style="">
        <%
            dbTool dbt = new dbTool();
            String sql = "select * from user where user_id=" + request.getParameter("user_id")+";";
            ArrayList<userInfo> list = dbt.findUser(sql);
            for(int i = 0; i < list.size(); i++){
                userInfo userinfo = list.get(i);
        %>
        <h1><%=userinfo.getUser_name()%></h1>
        <hr>
        <%=userinfo.getOne_line_describe()%>
        <%}%>
    </div>
</div>
<div id="mianban" class="panel panel-default" style="width:80%;margin-left: 50px;margin-right: 50px">
    <table width="100%"  class="table " style="border-collapse:separate; border-spacing:0px 0px;">
        <tr>
            <ul class="nav nav-tabs" id="headerbar" >
                <li class="active"><a >书籍</a></li>
                <li><a >动态</a></li>
            </ul>
        </tr>
    </table>
    <%--书籍--%>
    <table style="width: 100%" id="Book">
    <%
        sql = "select * from book,user where book_flag=0 and author_id=user_id and user_id=" + request.getParameter("user_id")+";";
        ArrayList<bookInfo> book_list = dbt.findBook(sql);
        for(int i = 0; i < book_list.size(); i++){
            bookInfo bookinfo = book_list.get(i);
    %>
        <tr>
            <td style="text-align:left;margin: 0px">
                <% if (user.getUser_id().equals(request.getParameter("user_id"))){%>
                <a href="MyBookDetail.jsp?book_id=<%=bookinfo.getBook_id()%>&book_name=<%=bookinfo.getBook_name()%>"><%=bookinfo.getBook_name()%></a>
                <%}else{%>
                <a href="BookDetail.jsp?book_id=<%=bookinfo.getBook_id()%>"><%=bookinfo.getBook_name()%></a>
                <%}%>
                <small><%=bookinfo.getUpdate_time()%></small>
                <p style="font-size:12px;text-align: left;margin: 0px"><%=bookinfo.getOne_line_describe()%></p>
            </td>
            <td>
                <p></p>
                <p style="text-align: right;margin: 0px"><i class="iconfont icon-praise_icon" style="font-size:14px;"></i><i style="font-size:14px;" class="iconfont icon-pinglun"></i></p>
            </td>
        </tr>
        <%}%>
    </table>
    <table style="width: 100%;" hidden id="Statuses" >
        <%
            sql = "select * from theme,user where theme_flag=0 and author_id=user_id and user_id=" + request.getParameter("user_id")+";";
            ArrayList<themeInfo> status_list = dbt.findTheme(sql);
            for(int i = 0; i < status_list.size(); i++){
                themeInfo statusinfo = status_list.get(i);
        %>
        <tr>
            <td style="text-align:left;margin: 0px">
                <% if (user.getUser_id().equals(request.getParameter("user_id"))){%>
                <a href="MyThemeDetail.jsp?theme_name=<%=statusinfo.getTheme_name()%>&theme_id=<%=statusinfo.getTheme_id()%>"><%=statusinfo.getTheme_name()%></a>
                <%}else{%>
                <a href="ThemeContent.jsp?theme_name=<%=statusinfo.getTheme_name()%>&theme_id=<%=statusinfo.getTheme_id()%>"><%=statusinfo.getTheme_name()%></a>
                <%}%>
               <small><%=statusinfo.getUpdate_time()%></small>
                <p style="font-size:12px;text-align: left;margin: 0px"><%=statusinfo.getOne_line_describe()%></p>
            </td>
            <td>
                <p></p>
                <p style="text-align: right;margin: 0px"><i class="iconfont icon-praise_icon" style="font-size:14px;"></i><i style="font-size:14px;" class="iconfont icon-pinglun"></i></p>
            </td>
        </tr>
        <%}%>
    </table>
</div>
<%@include file="footer.jsp"%>