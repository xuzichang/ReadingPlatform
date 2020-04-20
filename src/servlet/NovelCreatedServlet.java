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
 * 创建小说Servlet类
 */

@WebServlet(name = "NovelCreatedServlet", urlPatterns = "/servlet/NovelCreatedServlet")
public class NovelCreatedServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //设置编码格式
        req.setCharacterEncoding("utf-8");

        // 获取参数
        String original =req.getParameter("original");
        String progress = req.getParameter("progress");
        String noveltitle = req.getParameter("noveltitle");
        String one_line_describe = req.getParameter("one_line_describe");
        String novelintroduce = req.getParameter("novelintroduce");
        String label = original+","+progress;

        //用于书名验证
        boolean flag = false;

        //获取用户邮箱
        String userEmail = "";
        LoginUser loginUser = (LoginUser) req.getSession().getAttribute("LoginUser");
        userEmail = loginUser.getUserId();

        //校验书名是否已存在
        dbTool dbt = new dbTool();
        String book_check_exits = "select * from book,user where book_flag=0;";
        ArrayList<bookInfo> list = dbt.findBook(book_check_exits);
        for(int i = 0; i < list.size(); i++) {
            if (noveltitle.equals(list.get(i).getBook_name())) {
                flag = true;
            }
        }
        //判断书名是否存在
        if (!flag) {

            //获取用户id
            String user_sql = "select * from user where email='" + userEmail + "';";
            userInfo userinfo = dbt.findOneUser(user_sql);

            //获取当前时间
            Date date = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            //创建小说
            String sql = "insert into book(book_name,one_line_describe,author_id,label,introduction,update_time) values('" + noveltitle + "','"
                    + one_line_describe + "','" + userinfo.getUser_id() + "','"
                    + label + "','" + novelintroduce + "','" + ft.format(date) + "');";
            dbt.add(sql);

            //跳转
            resp.sendRedirect(req.getContextPath() + "/MyBookDetail.jsp?book_name=" + URLEncoder.encode(noveltitle,"utf-8"));
        }else {
            // 验证失败，则重定向到创建小说页面，并标记参数i为1表示创建失败
            resp.sendRedirect(req.getContextPath() + "/NovelCreated.jsp?i=1");
        }
    }
}
