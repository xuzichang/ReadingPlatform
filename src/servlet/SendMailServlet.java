package servlet;

import toolbean.Send;
import toolbean.dbTool;
import valuebean.LoginUser;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

/**
 * 发送邮件Servlet类
 */

@WebServlet(name = "SendMailServlet", urlPatterns = "/servlet/SendMailServlet")
public class SendMailServlet extends HttpServlet {

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
        String str = "0123456789";

        //用于判断邮箱是否已注册
        boolean flag = false;

        //随机生成四位验证码
        StringBuilder sb = new StringBuilder(4);
        for(int i = 0; i < 4; i++) {
            char ch = str.charAt(new Random().nextInt(str.length()));
            sb.append(ch);
        }

        //校验邮箱
        dbTool dbt = new dbTool();
        String sql = "select email,password,user_name from user";
        ArrayList<LoginUser> list= dbt.findUserLogin(sql);
        for(int i = 0; i < list.size(); i++) {
            if (email.equals(list.get(i).getUserId())) {
                flag = true;
            }
        }

        //判断用户邮箱是否已被注册
        if (!flag) {

            //发送邮件
            new Send(email, "欢迎注册能力有限公司中文阅读产品", "以下是您的验证码" + "\n" + sb.toString()).send();

            //记录Session相关信息
            HttpSession session = req.getSession();
            session.setAttribute("vertifyCode", sb);

        }else{
            // 验证失败，则重定向到登录页面，并标记参数i为1表示邮箱已被注册
//            String s="Your Mail has been registered!Please change your email.";
            String s="您的邮箱已被注册，请更换您的邮箱。";
            resp.getWriter().println(s);
        }
    }
}
