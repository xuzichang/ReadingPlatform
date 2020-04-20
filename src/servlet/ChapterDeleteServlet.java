package servlet;

import toolbean.dbTool;
import valuebean.bookInfo;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

/**
 * 删除章节Servlet类
 */

@WebServlet(name = "ChapterDeleteServlet", urlPatterns = "/servlet/ChapterDeleteServlet")
public class ChapterDeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //设置编码格式
        req.setCharacterEncoding("utf-8");

        //获取参数
        String chapter_id = req.getParameter("chapter_id");
        String book_id = req.getParameter("book_id");

        //获取书籍名称传给MyBookDetail用于显示
        dbTool dbt = new dbTool();
        String book_sql = "select * from book where book_id=" + book_id;
        bookInfo book_info_name = dbt.findOneBook(book_sql);

        //删除章节内容
//        String content_sql = "delete from content where chapter_id=" + chapter_id;
        String content_sql = "update content set content_flag=1 where chapter_id=" + chapter_id;
        dbt.delete(content_sql);

        //删除章节
//        String chapter_sql = "delete from chapter where chapter_id=" + chapter_id;
        String chapter_sql = "update chapter set chapter_flag=1 where chapter_id=" + chapter_id;
        dbt.delete(chapter_sql);

        //跳转
        resp.sendRedirect(req.getContextPath() + "/MyBookDetail.jsp?book_name=" + URLEncoder.encode(book_info_name.getBook_name(),"utf-8"));
    }
}
