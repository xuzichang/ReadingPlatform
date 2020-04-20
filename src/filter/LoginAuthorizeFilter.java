package filter;

import valuebean.LoginUser;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 登录验证过滤器
 */

@WebFilter(filterName = "LoginAuthorizeFilter", urlPatterns = "/*")
public class LoginAuthorizeFilter implements Filter{

    // 初始化方法
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    // 过滤处理方法
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        String servletPath = httpServletRequest.getServletPath();  //获取客户端所请求的脚本文件的文件路径

        //不过滤处理登录页面、JS和CSS文件
        if (!servletPath.equals("/login.jsp") && !servletPath.equals("/register.jsp") && !servletPath.equals("/servlet/LoginServlet")
                && !servletPath.equals("/servlet/RegisterServlet") && !servletPath.equals("/servlet/SendMailServlet")
                && !servletPath.endsWith(".js") && !servletPath.endsWith(".css")) {

            //校验结果
            boolean verifyRes = false;

            //获取Session对象
            HttpSession session = httpServletRequest.getSession();
            Object loginObj = session.getAttribute("LoginUser");

            if (loginObj instanceof LoginUser) {            //instanceof 运在运行时指出对象是否是特定类的一个实例
                LoginUser loginUser = (LoginUser) loginObj;
                if (loginUser.getUserId()!="null"){         //用户已登录
                    verifyRes = true;                       //校验成功
                }
            }

            //判断校验结果，如果校验失败则重定向到登录页面
            if (!verifyRes) {
                HttpServletResponse httpServletResponse = (HttpServletResponse) response;
                //重定向到登录页面
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/login.jsp");
            }
            else {
                // 传递给下一过滤器
                chain.doFilter(request, response);
            }
        }
        else {
            // 传递给下一过滤器
            chain.doFilter(request, response);
        }
    }

    // 销毁方法
    @Override
    public void destroy()
    {
        // 释放资源
    }

}
