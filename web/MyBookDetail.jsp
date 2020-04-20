<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/12/23
  Time: 23:15
--%>
<%@ page import="valuebean.bookInfo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%
    dbTool dbt = new dbTool();
    String sql = "select * from book,user where book_flag=0 and author_id=user_id and author_id=" + user.getUser_id()
            + " and book_name='" + URLDecoder.decode(request.getParameter("book_name"),"utf-8")+"';";
    ArrayList<bookInfo> list = dbt.findBook(sql);
    bookInfo bookinfo = list.get(0);
%>
<ul class="breadcrumb" style="text-align: left;margin-left:50px;width: 80%;margin-top: 10px">
    <li><a href="UserContent.jsp?user_id=<%=user.getUser_id()%>">个人中心</a> <span class="divider"></span></li>
    <li class="active"><%=bookinfo.getBook_name()%></li>
</ul>
<div  class="panel panel-default" style="width:80%;margin-left: 50px;margin-right: 50px;margin-top: 20px">
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
    <ul class="list-group">
        <li class="list-group-item'"  style="text-decoration: none;list-style: none">
            <a href="NovelEdit.jsp?book_name=<%=bookinfo.getBook_name()%>" class="btn btn-sm btn-default" style="font-size: 10px">编辑书籍</a>
            <a href="ChapterCreated.jsp?book_id=<%=bookinfo.getBook_id()%>" class="btn btn-sm btn-default" style="font-size: 10px">写新章节</a>
            <a href="servlet/NovelDeleteServlet?book_id=<%=bookinfo.getBook_id()%>"  onclick="return confirm('是否删除？')" class="btn btn-sm btn-default" style="font-size: 10px">删除本书</a>
        </li>
    </ul>
</div>
<div  class="panel panel-default" style="width:80%;margin-left: 50px;margin-right: 50px">
    <div class="panel-heading" style="">章节目录
    </div>
    <table>
        <%
            String sql_chapter = "select * from chapter where chapter_flag=0 and book_id='"+bookinfo.getBook_id()+"';";
            ArrayList<bookInfo> list_chapter = dbt.findChapter(sql_chapter);
            for(int i = 0; i < list_chapter.size(); i++){
                bookInfo chapterinfo = list_chapter.get(i);
        %>
        <%
            if (chapterinfo.getChapter_name()==null){%>
        <%
            }else{
        %>
        <tr>
        <td width="90%">
             <a href="ContentDetailContent.jsp?chapter_id=<%=chapterinfo.getChapter_id()%>"  class="button_base b01_simple_rollover">
                 <%=chapterinfo.getChapter_name()%>
             </a>
        </td>
        <td>
            <a href="ChapterEdit.jsp?chapter_id=<%=chapterinfo.getChapter_id()%>&book_id=<%=bookinfo.getBook_id()%>"
               style=" margin-bottom: 20px;padding: 6px" class="btn btn-default">编辑</a>
        </td>
        <td>
            <a href="servlet/ChapterDeleteServlet?chapter_id=<%=chapterinfo.getChapter_id()%>&book_id=<%=bookinfo.getBook_id()%>"
               onclick="return confirm('是否删除？')"  style=" margin-bottom: 20px;padding: 6px" class="btn btn-default">删除</a>
        </td>
        </tr>
        <%
            }
            }%>
    </table>
<%@include file="footer.jsp"%>