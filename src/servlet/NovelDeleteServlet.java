package servlet;

import toolbean.dbTool;
import valuebean.LoginUser;
import valuebean.bookInfo;
import valuebean.userInfo;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * 删除小说Servlet类
 */

@WebServlet(name = "NovelDeleteServlet", urlPatterns = "/servlet/NovelDeleteServlet")
public class NovelDeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置编码格式
        req.setCharacterEncoding("utf-8");

        //获取参数
        String book_id = req.getParameter("book_id");

        //获取用户邮箱
        String userEmail="";
        LoginUser loginUser = (LoginUser) req.getSession().getAttribute("LoginUser");
        userEmail = loginUser.getUserId();

        //通过邮箱获取用户id
        dbTool dbt = new dbTool();
        dbTool dbt_header = new dbTool();
        String user_sql = "select * from user where email='" + userEmail + "';";
        userInfo user = dbt_header.findOneUser(user_sql);

        //查询用户当前操作的小说
        String sql = "select * from book natural join chapter natural join content where book.book_id='" + book_id + "';";
        ArrayList<bookInfo> list = dbt.findBook_and_Chpater_and_Content(sql);

        //在删除小说前,需先删除章节内容和章节
        for(int i = 0; i < list.size(); i++){
            bookInfo bookinfo = list.get(i);
            //删除章节内容
//            String content_sql = "delete from content where chapter_id='" + bookinfo.getChapter_id() + "';";
            String content_sql = "update content set content_flag=1  where chapter_id='" + bookinfo.getChapter_id() + "';";

            dbt.delete(content_sql);
            //删除章节
//            String chapter_sql = "delete from chapter where chapter_id='" + bookinfo.getChapter_id() + "';";
            String chapter_sql = "update chapter set chapter_flag=1 where chapter_id='" + bookinfo.getChapter_id() + "';";
            dbt.delete(chapter_sql);
        }

        //删除小说
//        String book_sql = "delete from book where book_id='" + book_id + "';";
        String book_sql = "update book set book_flag=1 where book_id='" + book_id + "';";
        dbt.delete(book_sql);

        //跳转
        resp.sendRedirect(req.getContextPath() + "/UserContent.jsp?user_id=" + user.getUser_id());
    }
}
