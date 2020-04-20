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
import java.awt.*;
import java.io.IOException;
import java.util.ArrayList;

/**
 * 删除主题帖Servlet类
 */

@WebServlet(name = "ThemeDeleteServlet", urlPatterns = "/servlet/ThemeDeleteServlet")
public class ThemeDeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //设置编码格式
        req.setCharacterEncoding("utf-8");

        //获取参数
        String theme_id = req.getParameter("theme_id");
        String userEmail = "";
        dbTool dbt = new dbTool();

        //获取用户邮箱
        LoginUser loginUser = (LoginUser) req.getSession().getAttribute("LoginUser");
        userEmail = loginUser.getUserId();

        //通过邮箱获取用户id
        dbTool dbt_header = new dbTool();
        String user_sql ="select * from user where email='"+userEmail+"';";
        userInfo user=dbt_header.findOneUser(user_sql);

        //删除主题贴
//        String sql = "delete from theme where theme_id='"+theme_id+"';";
        String sql = "update theme set theme_flag=1 where theme_id='"+theme_id+"';";
        dbt.delete(sql);

        //跳转
        resp.sendRedirect(req.getContextPath() + "/UserContent.jsp?user_id="+ user.getUser_id());
    }
}
