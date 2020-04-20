package servlet;

import toolbean.dbTool;
import valuebean.LoginUser;
import valuebean.themeInfo;
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
 * 创建主题帖Servlet类
 */
@WebServlet(name = "ThemeCreatedServlet", urlPatterns = "/servlet/ThemeCreatedServlet")
public class ThemeCreatedServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //设置编码格式
        req.setCharacterEncoding("utf-8");

        // 获取参数
        String themetitle = req.getParameter("themetitle");
        String one_line_describe = req.getParameter("one_line_describe");
        String theme_content = req.getParameter("theme_content");

        boolean flag=false;
        //校验主题贴名是否已存在
        dbTool dbt = new dbTool();
        String book_check_exits = "select * from theme,user where theme_flag=0;";
        ArrayList<themeInfo> list = dbt.findTheme(book_check_exits);
        for(int i = 0; i < list.size(); i++) {
            if (themetitle.equals(list.get(i).getTheme_name())) {
                flag = true;
            }
        }

        //获取用户邮箱
        String userEmail = "";
        LoginUser loginUser = (LoginUser) req.getSession().getAttribute("LoginUser");
        userEmail = loginUser.getUserId();

        //判断主题贴是否存在
        if (!flag) {

            //获取用户id
            String user_sql = "select * from user where email='" + userEmail + "';";
            userInfo userinfo = dbt.findOneUser(user_sql);

            //获取当前时间
            Date date = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            //创建主题帖
            String sql = "insert into theme(theme_name,one_line_describe,author_id,theme_content,update_time) values('" + themetitle + "','"
                    + one_line_describe + "','" + userinfo.getUser_id() + "','"+ theme_content + "','"
                    + ft.format(date) + "');";
            dbt.add(sql);

            //跳转
            resp.sendRedirect(req.getContextPath() + "/MyThemeDetail.jsp?theme_name=" + URLEncoder.encode(themetitle,"utf-8"));
        }else {
            // 验证失败，则重定向到创建主题帖页面，并标记参数i为1表示创建失败
            resp.sendRedirect(req.getContextPath() + "/ThemeCreated.jsp?i=1");
        }
    }
}
