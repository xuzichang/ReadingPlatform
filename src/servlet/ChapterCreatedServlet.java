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
import java.util.ArrayList;

/**
 * 创建章节Servlet类
 */

@WebServlet(name = "ChapterCreatedServlet", urlPatterns = "/servlet/ChapterCreatedServlet")
public class ChapterCreatedServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //设置编码格式
        req.setCharacterEncoding("utf-8");

        //获取参数
        String text = req.getParameter("text");
        String chapter_name = req.getParameter("chapter_name");
        String book_id = req.getParameter("book_id");

        //创建新章节
        dbTool dbt = new dbTool();
        String sql = "insert into chapter(chapter_name,book_id) values('" + chapter_name+ "','" + book_id + "');";
        dbt.add(sql);

        //获取书籍名称传给MyBookDetail用于显示
        String book_sql = "select * from book where book_flag=0 and book_id=" + book_id;
        bookInfo book_info_name = dbt.findOneBook(book_sql);

        //获取章节id，用于创建章节内容
        String chapter_sql = "select * from chapter where chapter_flag=0 order by chapter_id desc limit 1";
        ArrayList<bookInfo> list = dbt.findChapter(chapter_sql);
        bookInfo bookinfo = list.get(0);
        String content_sql = "insert into content(content,chapter_id) values('" + text+ "','" + bookinfo.getChapter_id() + "');";
        dbt.add(content_sql);

        //跳转
        resp.sendRedirect(req.getContextPath() + "/MyBookDetail.jsp?book_name=" + URLEncoder.encode(book_info_name.getBook_name(),"utf-8"));
    }
}
