<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/12/26
  Time: 5:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<div  class="panel panel-default" style="width:80%;margin-left: 50px;margin-right: 50px;margin: 20px">
    <div class="panel-heading" style="text-align:left;">搜索结果</div>
    <table width="100%"  class="table " style="border-collapse:separate; border-spacing:0px 0px;">
        <%
            // 获取参数
            String selectText = request.getParameter("selectText");
            String searchText ="";

            //以；分割字符串
            String[] words2 = selectText.split(";");

            //以|合并字符串
            for (int i = 0; i < words2.length; i++){
                searchText += words2[i]+"|";
            }

            //查找书籍id
            dbTool dbt = new dbTool();
            String sql = "select book_id from book where book_flag=0 and label regexp '"+searchText.substring(0,searchText.length()-1)+"'";
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
            <td style="font-weight:bold;text-align:left;margin: 0px">
                <a href="BookDetailContent.jsp?book_id=<%=book_list_info.getBook_id()%>"><%=book_list_info.getBook_name()%></a>
                <p style="font-size:12px;text-align: left;margin: 0px"><%=book_list_info.getOne_line_describe()%></p>
                <p style="font-size:12px;text-align: left;margin: 0px">
                    <%
                        String sql_chapter = "select * from chapter where chapter_flag=0 and book_id='" + book_list_info.getBook_id()+"';";
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

                <p style="text-align: right;margin: 0px"><%=book_list_info.getAuthor_name()%></p>
                <p style="text-align: right;margin: 0px"><span><%=book_list_info.getLabel()%></span></p>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>
</div>
<%@include file="footer.jsp"%>