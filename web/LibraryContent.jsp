<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/11/28
  Time: 1:07
--%>
<%@ page import="toolbean.dbTool" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="valuebean.bookInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%@include file="DropdownLink.jsp"%>
<div id="mianban" class="panel panel-default" style="width:80%;margin-left: 50px;margin-right: 50px">
    <table width="100%"  class="table " style="border-collapse:separate; border-spacing:0px 0px;">
        <%
            dbTool dbt = new dbTool();
            String sql = "select * from book,user where book_flag=0 and author_id=user_id;";
            ArrayList<bookInfo> list = dbt.findBook(sql);
            for(int i = 0; i < list.size(); i++){
                bookInfo bookinfo = list.get(i);
        %>
        <tr>
            <td style="font-weight:bold;text-align:left;margin: 0px">
                <a href="BookDetailContent.jsp?book_id=<%=bookinfo.getBook_id()%>"><%=bookinfo.getBook_name()%></a>
                <p style="font-size:12px;text-align: left;margin: 0px"><%=bookinfo.getOne_line_describe()%></p>
                <p style="font-size:12px;text-align: left;margin: 0px">
                    <%
                    String sql_chapter = "select * from chapter where chapter_flag=0 and book_id='" + bookinfo.getBook_id()+"';";
                    ArrayList<bookInfo> list_chapter = dbt.findChapter(sql_chapter);
                    if (list_chapter.size() != 0){
                        bookInfo bookinfo_chapter = list_chapter.get(list_chapter.size() - 1);
                %>
                    <a href="ContentDetailContent.jsp?chapter_id=<%=bookinfo_chapter.getChapter_id()%>">
                        <%=bookinfo_chapter.getChapter_name()%>
                    </a>
                    <%}%>
                </p>
            </td>
            <td>
                <p style="text-align: right;margin: 0px"><%=bookinfo.getAuthor_name()%></p>
                <p style="text-align: right;margin: 0px"><span><%=bookinfo.getLabel()%></span></p>
            </td>
        </tr>
        <%

            }
        %>
    </table>
</div>
<%@include file="footer.jsp"%>