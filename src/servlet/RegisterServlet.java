package servlet;


import toolbean.dbTool;
import valuebean.LoginUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 用户注册Servlet类
 */

@WebServlet(name = "RegisterServlet", urlPatterns = "/servlet/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //设置编码格式
        req.setCharacterEncoding("utf-8");

        // 获取参数
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String username = req.getParameter("username");
        String one_line_describe = req.getParameter("one_line_describe");
        String vc = req.getSession().getAttribute("vertifyCode").toString();
        String w1 = req.getParameter("w1");
        String w2 = req.getParameter("w2");
        String w3 = req.getParameter("w3");
        String w4 = req.getParameter("w4");
        String checkpassword = req.getParameter("checkpassword");

        //验证码拼接
        String vertifyCode = w1 + w2 + w3 + w4;

        //验证码校验
        if (vc.equals(vertifyCode)){
            if (password.equals(checkpassword)){

                //插入用户注册信息到数据库
                dbTool dbt = new dbTool();
                String sql = "insert into user(email,password,user_name,one_line_describe) values('" + email+ "','"
                        + password + "','" + username + "','" + one_line_describe +  "');";
                dbt.add(sql);

                //跳转
                resp.sendRedirect(req.getContextPath() + "/login.jsp");
            }else{
                // 验证失败，则重定向到注册页面，并标记参数i为2表示密码输入错误
                resp.sendRedirect(req.getContextPath() + "/register.jsp?i=2");
            }
        }else{
            // 验证失败，则重定向到登录页面，并标记参数i为1表示验证码错误
            resp.sendRedirect(req.getContextPath() + "/register.jsp?i=1");
        }

    }
}
