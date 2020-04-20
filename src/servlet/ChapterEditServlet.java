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
 * 编辑章节Servlet类
 */

@WebServlet(name = "ChapterEditServlet", urlPatterns = "/servlet/ChapterEditServlet")
public class ChapterEditServlet extends HttpServlet {

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
        String chapter_id = req.getParameter("chapter_id");

        //更新章节名称
        dbTool dbt = new dbTool();
        String sql = "update chapter set chapter_name = '" + chapter_name + "',book_id ='" + book_id + "' where chapter_id='" + chapter_id + "';";
        dbt.update(sql);

        //获取书籍名称传给MyBookDetail用于显示
        String book_sql = "select * from book where book_flag=0 and book_id=" + book_id;
        bookInfo book_info_name=dbt.findOneBook(book_sql);

        //获取章节内容
        String find_content_sql = "select * from content where content_flag=0 and chapter_id=" + chapter_id;
        bookInfo bookinfo = dbt.findContent(find_content_sql);

        //更新章节内容
        String content_sql = "update content set content='" + text + "',chapter_id ='" + chapter_id + "' where content_id = '" + bookinfo.getContent_id() + "';";
        dbt.update(content_sql);

        //跳转
        resp.sendRedirect(req.getContextPath() + "/MyBookDetail.jsp?book_name=" + URLEncoder.encode(book_info_name.getBook_name(),"utf-8"));
    }
}
