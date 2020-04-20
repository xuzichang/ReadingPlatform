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
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 * 编辑小说Servlet类
 */

@WebServlet(name = "NovelEditServlet", urlPatterns = "/servlet/NovelEditServlet")
public class NovelEditServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //设置编码格式
        req.setCharacterEncoding("utf-8");

        // 获取参数
        String book_id = req.getParameter("book_id");
        String book_name_original = req.getParameter("book_name_original");
        String original = req.getParameter("original");
        String progress = req.getParameter("progress");
        String noveltitle = req.getParameter("noveltitle");
        String one_line_describe = req.getParameter("one_line_describe");
        String novelintroduce = req.getParameter("novelintroduce");
        String label = original + ";" + progress;

        boolean flag = false;

        //获取用户邮箱
        String userEmail = "";
        LoginUser loginUser = (LoginUser) req.getSession().getAttribute("LoginUser");
        userEmail = loginUser.getUserId();

        //校验书名是否已存在,且是否与原来相同
        dbTool dbt = new dbTool();
        String book_check_exits = "select * from book,user where book_flag=0;";
        ArrayList<bookInfo> list = dbt.findBook(book_check_exits);
        for(int i = 0; i < list.size(); i++) {
            if (!(noveltitle.equals(book_name_original))){
                if (noveltitle.equals(list.get(i).getBook_name())) {
                    flag = true;
                }
            }
        }

        //判断书名是否已存在
        if (!flag) {

            //获取用户id
            String user_sql = "select * from user where email='" + userEmail + "';";
            userInfo userinfo = dbt.findOneUser(user_sql);

            //获取当前时间
            Date date = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            //编辑小说简介
            String sql = "update  book set book_name='" + noveltitle + "',one_line_describe='" + one_line_describe
                    + "',author_id='" + userinfo.getUser_id()
                    + "',label='"+label+"',introduction='" + novelintroduce + "',update_time='" + ft.format(date)
                    + "' where book_id='" + book_id + "';";
            dbt.update(sql);

            //跳转
            resp.sendRedirect(req.getContextPath() + "/MyBookDetail.jsp?book_name=" + URLEncoder.encode(noveltitle,"utf-8"));
        }else {
            // 验证失败，则重定向到编辑小说页面，并标记参数i为1表示编辑失败
            resp.sendRedirect(req.getContextPath() + "/NovelEdit.jsp?i=1");
        }
    }
}
