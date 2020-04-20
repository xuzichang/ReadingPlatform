package servlet;

import toolbean.dbTool;
import valuebean.LoginUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

/**
 * 登录验证Servlet类
 */

@WebServlet(name = "LoginServlet", urlPatterns = "/servlet/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置编码格式
        req.setCharacterEncoding("UTF-8");

        //用于登录验证
        boolean flag=false;

        // 获取参数
        String account = req.getParameter("email");
        String password = req.getParameter("password");
        String username = "";

        //获取用户名
        dbTool dbt = new dbTool();
        String sql = "select email,password,user_name from user";
        ArrayList<LoginUser> list = dbt.findUserLogin(sql);

        //登录校验
        for(int i = 0; i < list.size(); i++) {
            if (account.equals(list.get(i).getUserId()) && password.equals(list.get(i).getPassword())) {
                flag = true;
                username = list.get(i).getUserName();
            }
        }

        //判断用户是否登录成功
        if (flag) {

            // 新建名为email的Cookie
            Cookie emailCookie = new Cookie("email", URLEncoder.encode(account, "utf-8"));

            // 新建名为password的Cookie
            Cookie passwordCookie = new Cookie("password", password);

            // 设置Cookie的使用路径
            emailCookie.setPath(req.getContextPath() + "/");
            passwordCookie.setPath(req.getContextPath() + "/");

            // 获取是否保存密码
            String rememberme = req.getParameter("rememberme");

            // 判断复选框是否被选中，如果选中则返回on
            if (rememberme == null){
                emailCookie.setMaxAge(0);                   // 设置将不保存Cookie
                passwordCookie.setMaxAge(0);
            }else  if (rememberme.equals("on")) {
                emailCookie.setMaxAge(7 * 24 * 60 * 60);    // 设置保存Cookie的时间长度，单位为秒
                passwordCookie.setMaxAge(7 * 24 * 60 * 60);
            }

            // 输出到客户端
            resp.addCookie(emailCookie);
            resp.addCookie(passwordCookie);

            //保存用户登录信息类
            LoginUser loginUser = new LoginUser();
            loginUser.setUserId(account);
            loginUser.setUserName(username);

            //记录Session相关信息
            HttpSession session = req.getSession();
            session.setAttribute("LoginUser", loginUser);

            // 跳转
            resp.sendRedirect(req.getContextPath() + "/IndexContent.jsp");
        } else {
            // 验证失败，则跳转到登录页面，并标记参数i为1表示登录失败
            resp.sendRedirect(req.getContextPath() + "/login.jsp?i=1");
        }
    }
}
