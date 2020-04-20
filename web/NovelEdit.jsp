<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/12/24
  Time: 0:15
--%>
<%@ page import="valuebean.bookInfo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%
    dbTool dbt = new dbTool();
    String sql = "select * from book,user where book_flag=0 and author_id=user_id and author_id=" + user.getUser_id()
            + " and book_name='" + request.getParameter("book_name")+"';";
    ArrayList<bookInfo> list = dbt.findBook(sql);
    bookInfo bookinfo = list.get(0);
%>
<script>
    //页面初始化
    window.onload = function() {
        var i = getUrlParam("i");
        if (i == 1) {
            document.getElementById("spInfo").innerText = "修改失败，书名已存在";
        } else {
            document.getElementById("spInfo").innerText = "";
        }
    }

    //获取URL中的request参数
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) {
            return decodeURIComponent(r[2]);
        } else {
            return "";
        }
    }
</script>
<ul class="breadcrumb" style="text-align: left;margin-left:50px;width: 80%;margin-top: 10px">
    <li><a href="UserContent.jsp?user_id=<%=user.getUser_id()%>">个人中心</a> <span class="divider"></span></li>
    <li><a href="MyBookDetail.jsp?book_id=<%=bookinfo.getBook_id()%>&book_name=<%=bookinfo.getBook_name()%>"><%=bookinfo.getBook_name()%></a><span class="divider"></span></li>
    <li class="active">编辑小说简介</li>
</ul>
<div  class="panel panel-default" style="width:60%;margin-left: 50px;margin-right: 50px;">
    <div class="panel-heading" style="">编辑小说简介</div>
    <form action="servlet/NovelEditServlet" method="post" >
        <table >
            <tr ><td style="text-align: left">1 小说原创性</td></tr>
            <tr><td style="text-align: left">
                <% if ( bookinfo.getLabel().contains("原创小说")){%>
                <input type="radio" name="original" checked value="原创小说">原创小说
                <input type="radio" name="original" value="同人衍生">同人衍生
                <%}else{%>
                <input type="radio" name="original" value="原创小说">原创小说
                <input type="radio" name="original"  checked value="同人衍生">同人衍生
                <%}%>
            </td></tr>
            <tr><td style="text-align: left">2 小说进度</td></tr>
            <tr><td style="text-align: left">
                <% if ( bookinfo.getLabel().contains("连载")){%>
                <input type="radio" name="progress" checked value="连载">连载
                <%}else{%>
                <input type="radio" name="progress"  value="连载">连载
                <%}%>
                <% if ( bookinfo.getLabel().contains("完结")){%>
                <input type="radio" name="progress" checked value="完结">完结
                <%}else{%>
                <input type="radio" name="progress"  value="完结">完结
                <%}%>
                <% if ( bookinfo.getLabel().contains("暂停")){%>
                <input type="radio" name="progress" checked value="暂停">暂停
                <%}else{%>
                <input type="radio" name="progress"  value="暂停">暂停
                <%}%>
            </td></tr>
            <tr><td style="text-align: left">3 小说标题</td></tr>
            <tr><td style="text-align: left">
                <input  class="form-control"  value=<%=bookinfo.getBook_name()%> name="noveltitle" style="width: 50%;text-align: left">
            </td></tr>
            <tr><td style="text-align: left">4 一句话描述</td></tr>
            <tr><td style="text-align: left">
                <input  class="form-control" value=<%=bookinfo.getOne_line_describe()%>  name="one_line_describe" style="width: 50%;text-align: left">
            </td></tr>
            <tr><td style="text-align: left"> 5 小说简介</td></tr>
            <tr><td style="text-align: left">
                <input  class="form-control" value=<%=bookinfo.getIntroduction()%> name="novelintroduce" style="width: 50%;text-align: left">
                <span id="helpBlock" class="help-block">请输入您创建的小说简介，字数不超过30字~</span>
            </td></tr>
            <tr><td>
                <input type="hidden" name="book_id" checked value=<%=bookinfo.getBook_id()%>>
                <input type="hidden" name="book_name_original" checked value=<%=bookinfo.getBook_name()%>>
                <input type="submit" class="btn btn-success" value="修改" style="padding-left: 20px;padding-right: 20px;background-color: #5cb85c"/>
            </td></tr>
            <tr><td>
                <span id="spInfo" style="color:red"></span>
            </td></tr>
        </table>
    </form>
</div>

<%@include file="footer.jsp"%>