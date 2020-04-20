package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 注销Servlet类
 */

@WebServlet(name = "LogoutServlet", urlPatterns = "/servlet/LogoutServlet")
public class LogoutServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //销毁session对象
        req.getSession().invalidate();

        //跳转
        resp.sendRedirect(req.getContextPath() + "/login.jsp");
    }
}
