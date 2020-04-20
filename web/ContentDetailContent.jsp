<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/12/13
  Time: 15:46
--%>
<%@ page import="toolbean.dbTool" %>
<%@ page import="valuebean.bookInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%
    dbTool dbt = new dbTool();
    String sql = "select user_name,book_name,book.book_id,chapter_name,content.chapter_id,update_time,content,content_id "
            + "from content,chapter,book,user "
            + "where book_flag=0 and chapter_flag =0 and content_flag =0 and content.chapter_id=chapter.chapter_id "
            + "and chapter.book_id= book.book_id and book.author_id=user.user_id and content.chapter_id='"
            + request.getParameter("chapter_id") + "';";;
    bookInfo bookinfo = dbt.findBookContent(sql);
%>
<ul class="breadcrumb" style="text-align: left;margin-left:50px;width: 80%;margin-top: 10px">
    <li><a href="LibraryContent.jsp">文库</a> <span class="divider"></span></li>
    <li><a href="BookDetailContent.jsp?book_name=<%=bookinfo.getBook_name()%>&book_id=<%=bookinfo.getBook_id()%>"><%=bookinfo.getBook_name()%></a> <span class="divider"></span></li>
    <li class="active"><%=bookinfo.getChapter_name()%></li>
</ul>
<div  class="panel panel-default" style="width:80%;margin-left: 50px;margin-right: 50px">

    <div class="panel-heading" style="">
        <h1><%=bookinfo.getChapter_name()%></h1>
        <%=bookinfo.getAuthor_name()%>
        <br>
        <%=bookinfo.getUpdate_time()%>
        <br>
<%--<span>上一章节</span> <span>下一章节</span>--%>
        <br>
        <pre style="white-space:pre-wrap;  word-wrap:break-word;text-align: left;font-size: 16px"><%=bookinfo.getContent()%></pre>
        <br>
        <p style="text-align: right;margin: 0px">
            <i class="iconfont icon-praise_icon" style="font-size:14px;"></i>
            <i style="font-size:14px;" class="iconfont icon-pinglun"></i>
        </p>
    </div>
</div>
<%@include file="footer.jsp"%>