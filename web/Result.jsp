<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/12/26
  Time: 4:49
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<div  class="panel panel-default" style="width:80%;margin-left: 50px;margin-right: 50px;margin: 20px">
    <div class="panel-heading" style="text-align:left;">搜索结果</div>
    <table width="100%"  class="table " style="border-collapse:separate; border-spacing:0px 0px;">
        <%
            // 获取参数
            String searchText = request.getParameter("searchText");

            //查找书籍id
            dbTool dbt = new dbTool();
            String sql = "select book_id from book where book_flag=0 and book_name like '%" + searchText + "%'";
            ArrayList<bookInfo> list =  dbt.findBookId(sql);
            for(int i = 0; i < list.size(); i++){
                bookInfo bookinfo = list.get(i);

                //根据书籍id查询书籍信息
                String book_sql = "select * from book,user where  book_flag =0 and author_id=user_id and book_id="+bookinfo.getBook_id()+";";
                ArrayList<bookInfo> book_list = dbt.findBook(book_sql);
                for(int j = 0; j < book_list.size(); j++){
                    bookInfo book_list_info = book_list.get(j);
        %>
        <tr>
            <td style="text-align:left;margin: 0px">
                <a href="BookDetailContent.jsp?book_id=<%=bookinfo.getBook_id()%>"><%=book_list_info.getBook_name()%>
                    <p class="text-muted" style="font-size:12px;text-align: left;margin: 0px"><%=book_list_info.getOne_line_describe()%></p>
                </a>
            </td>
            <td>
                <p style="text-align: right;margin: 0px"><%=book_list_info.getAuthor_name()%></p>
                <p style="font-size:12px;text-align: right;margin: 0px"><%=book_list_info.getUpdate_time()%></p>
            </td>
        </tr>
        <%
        }
    }
        %>
    </table>
</div>
<%@include file="footer.jsp"%>