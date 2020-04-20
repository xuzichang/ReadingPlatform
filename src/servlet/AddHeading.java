package servlet;

import toolbean.dbTool;
import valuebean.LoginUser;
import valuebean.userInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * 贡献题头Servlet类
 */

@WebServlet(name = "AddHeading", urlPatterns = "/servlet/AddHeading")
public class AddHeading extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //将输出转换成中文
        req.setCharacterEncoding("UTF-8");

        // 获取参数
        String newheading = req.getParameter("newheading");

        //获取用户邮箱
        String userEmail = "";
        LoginUser loginUser = (LoginUser) req.getSession().getAttribute("LoginUser");
        userEmail = loginUser.getUserId();

        //通过邮箱获取用户id
        dbTool dbt = new dbTool();
        String user_sql = "select * from user where email='"+userEmail+"';";
        userInfo userinfo =  dbt.findOneUser(user_sql);

        //添加入数据库
        String sql = "insert into heading(heading_content,user_id) values('" + newheading + "','"
                + userinfo.getUser_id()+ "');";
        dbt.add(sql);

        //显示首页
        resp.sendRedirect(req.getContextPath() + "/IndexContent.jsp");
    }
}
