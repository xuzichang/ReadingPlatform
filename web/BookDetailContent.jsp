<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/12/2
  Time: 14:27
--%>
<%@ page import="valuebean.bookInfo" %>
<%@ page import="toolbean.dbTool" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%
    dbTool dbt = new dbTool();
    String sql = "select * from book,user where book_flag=0 and author_id=user_id  and book_id='" + request.getParameter("book_id")+"';";
    ArrayList<bookInfo> list = dbt.findBook(sql);
    for(int i = 0; i < list.size(); i++){
        bookInfo bookinfo = list.get(i);
%>
<ul class="breadcrumb" style="text-align: left;margin-left:50px;width: 80%;margin-top: 10px">
    <li><a href="LibraryContent.jsp">文库</a> <span class="divider"></span></li>
    <li class="active"><%=bookinfo.getBook_name()%></li>
</ul>
<div  class="panel panel-default" style="width:80%;margin-left: 50px;margin-right: 50px">
    <div class="panel-heading">
        <h1><%=bookinfo.getBook_name()%></h1>
        <%=bookinfo.getOne_line_describe()%>
        <br>
        <%=bookinfo.getAuthor_name()%>
        <br>
        <%=bookinfo.getUpdate_time()%>
        <br>
        <%=bookinfo.getLabel()%>
        <br>
        <%=bookinfo.getIntroduction()%>
    </div>
    <%}%>
</div>
<div  class="panel panel-default" style="width:80%;margin-left: 50px;margin-right: 50px">
    <div class="panel-heading">章节目录</div>
    <ul class="list-group">
        <li class="list-group-item">
            <%
                String sql_chapter = "select * from chapter where chapter_flag=0 and book_id='" + request.getParameter("book_id")+"';";
                ArrayList<bookInfo> list_chapter = dbt.findChapter(sql_chapter);
                for(int i = 0; i < list_chapter.size(); i++){
                    bookInfo bookinfo = list_chapter.get(i);
            %>
            <a href="ContentDetailContent.jsp?chapter_id=<%=bookinfo.getChapter_id()%>" class="button_base b01_simple_rollover">
                <%=bookinfo.getChapter_name()%></a>
            <%}%>
        </li>
    </ul>
</div>
<%@include file="footer.jsp"%>