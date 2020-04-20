<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/12/1
  Time: 23:12
--%>
<%@ page import="valuebean.bookInfo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="toolbean.dbTool" %>
<%@ page import="valuebean.headingInfo" %>
<%@ page import="valuebean.themeInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%@ include file="search.jsp" %>
<%--轮播图--%>
<div id="myCarousel" class="carousel slide" style="height: 200px;width: 80%;margin-left: 50px;margin-right: 50px">
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner" >
        <div class="item active">
            <div class="carousel-caption d-none d-md-block">
                <h1>欢迎使用中文阅读平台☆ﾐ(o*･ω･)ﾉ </h1>
                <p>————from you know</p>
                <a class="btn btn-default" href="AddHeadingContent.jsp" type="button" value="贡献题头">贡献题头</a>
            </div>
            <img src="images/bg.jpg" alt="First slide" style="width: 100%;height: 200px">
        </div>
        <%
            dbTool dbt = new dbTool();
            String sql = "select heading_content,user_name from heading natural join user";
            ArrayList<headingInfo> headinglist = dbt.findHeading(sql);
            for(int i = 0; i < headinglist.size(); i++){
                headingInfo headinginfo = headinglist.get(i);
        %>
        <div class="item">
            <div class="carousel-caption d-none d-md-block">
                <h1><%=headinginfo.getHeading_content()%></h1>
                <p>————<%=headinginfo.getHeading_author()%></p>
                <a class="btn btn-default" href="AddHeadingContent.jsp" type="button">贡献题头</a>
            </div>
            <img src="images/bg.jpg" alt="First slide" style="width: 100%;height: 200px">
        </div>
        <%
            }
        %>
    </div>
    <!-- 轮播（Carousel）导航 -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<%--编辑推荐--%>
<div  class="panel panel-default" style="width:80%;margin-left: 50px;margin-right: 50px">
    <div class="panel-heading" style="text-align:left;">编辑推荐</div>
    <ul class="list-group">
        <%
            sql = "select * from book,user where is_recommend='1' and book_flag =0 and author_id=user_id;";
            ArrayList<bookInfo> list = dbt.findBook(sql);
            for(int i = 0; i < list.size(); i++){
                bookInfo bookinfo = list.get(i);
        %>
        <li class="list-group-item"  style="text-align:left;">
            <a href="BookDetailContent.jsp?book_id=<%=bookinfo.getBook_id()%>">《<%=bookinfo.getBook_name()%>》
                <small class="text-muted"><%=bookinfo.getOne_line_describe()%></small>
            </a>
        </li>
        <%
            }
        %>
    </ul>
</div>
<%--原创小说--%>
<div  class="panel panel-default" style="width:80%;margin-left: 50px;margin-right: 50px">
    <div class="panel-heading" style="text-align:left;">原创小说</div>
    <table width="100%"  class="table " style="border-collapse:separate; border-spacing:0px 0px;">
        <%
            sql = "select * from book,user where label like '%原创小说%' and book_flag=0 and author_id=user_id;";
            list = dbt.findBook(sql);
            for(int i = 0; i < list.size(); i++){
                bookInfo bookinfo = list.get(i);
        %>
        <tr>
            <td style="text-align: left;margin: 0px">
                <a href="BookDetailContent.jsp?book_id=<%=bookinfo.getBook_id()%>"><%=bookinfo.getBook_name()%>
                    <p class="text-muted" style="font-size:12px;text-align: left;margin: 0px"><%=bookinfo.getOne_line_describe()%></p>
                </a>
            </td>
            <td>
                <p style="text-align: right;margin: 0px"><%=bookinfo.getAuthor_name()%></p>
                <p style="font-size:12px;text-align: right;margin: 0px"><%=bookinfo.getUpdate_time()%></p>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</div>
<%--同人衍生--%>
<div class="panel panel-default" style="width:80%;margin-left: 50px;margin-right: 50px">
    <div class="panel-heading" style="text-align:left;">同人衍生</div>
    <table width="100%"  class="table " style="border-collapse:separate; border-spacing:0px 0px;">
        <%
            sql = "select * from book,user where label like '%同人小说%' and book_flag=0 and author_id=user_id;";
            list = dbt.findBook(sql);
            for(int i = 0; i < list.size(); i++){
                bookInfo bookinfo = list.get(i);
        %>
        <tr>
            <td style="text-align:left;margin: 0px">
                <a href="BookDetailContent.jsp?book_id=<%=bookinfo.getBook_id()%>"><%=bookinfo.getBook_name()%>
                    <p class="text-muted" style="font-size:12px;text-align: left;margin: 0px"><%=bookinfo.getOne_line_describe()%></p>
                </a>
            </td>
            <td>
                <p style="text-align: right;margin: 0px"><%=bookinfo.getAuthor_name()%></p>
                <p style="font-size:12px;text-align: right;margin: 0px"><%=bookinfo.getUpdate_time()%></p>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</div>
<%--读写交流--%>
<div  class="panel panel-default" style="width:80%;margin-left: 50px;margin-right: 50px">
    <div class="panel-heading" style="text-align:left;">读写交流</div>
    <table width="100%"  class="table " style="border-collapse:separate; border-spacing:0px 0px;">
        <%
            sql = "select * from theme,user where theme_flag =0 and author_id=user_id;";
            ArrayList<themeInfo> themeList = dbt.findTheme(sql);
            for(int i = 0; i < themeList.size(); i++){
                themeInfo themeinfo = themeList.get(i);
        %>
        <tr>
            <td style="text-align:left;margin: 0px">
                <a href="BookDetailContent.jsp?book_id=<%=themeinfo.getTheme_id()%>"><%=themeinfo.getTheme_name()%>
                    <p class="text-muted" style="font-size:12px;text-align: left;margin: 0px"><%=themeinfo.getOne_line_describe()%></p>
                </a>
            </td>
            <td>
                <p style="text-align: right;margin: 0px"><%=themeinfo.getAuthor_name()%></p>
                <p style="font-size:12px;text-align: right;margin: 0px"><%=themeinfo.getUpdate_time()%></p>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</div>
<%@include file="footer.jsp"%>