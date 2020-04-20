package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

/**
 * 标签搜索Servlet类
 */

@WebServlet(name = "LabelSearchServlet", urlPatterns = "/servlet/LabelSearchServlet")
public class LabelSearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //设置编码格式
        req.setCharacterEncoding("utf-8");

        // 获取参数
        String selectText = req.getParameter("selectText");

        //跳转
        resp.sendRedirect(req.getContextPath() + "/LabelResult.jsp?selectText=" + URLEncoder.encode(selectText,"utf-8"));
    }
}
