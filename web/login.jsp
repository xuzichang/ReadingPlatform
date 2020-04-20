<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/11/22
  Time: 15:26
--%>
<%@ page import="java.net.URLDecoder" %>
<%@include file="headerForNotLogin.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    //页面初始化
    window.onload = function() {
        var i = getUrlParam("i");
        if (i == 1) {
            document.getElementById("spInfo").innerText = "登录失败，用户名或密码不正确。";
        } else {
            document.getElementById("spInfo").innerText = "";
        }
    }

    //获取URL中的request参数
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) {
            return decodeURIComponent(r[2]);
        } else {
            return "";
        }
    }
</script>
<%
    String email = "";                         // 用户登录邮箱
    String password = "";                      // 登录密码
    String checked = "";                       // 复选框是否选中
    Cookie[] cookies = request.getCookies();   // 获取的是请求里的所有cookie组成的数组

    // 如果cookies数组不为空对其进行遍历
    if (cookies != null && cookies.length > 0) {
        for (int i = 0; i < cookies.length; i++) {

            Cookie cookie = cookies[i];        // 获取Cookie对象

            // 将创建的cookie名与获取的cookie数组中已经存在的cookie名进行比较
            if ("email".equals(cookie.getName())) {
                email = URLDecoder.decode(cookie.getValue(), "utf-8");
                checked = "checked";           // 将“记住密码”设置为勾选
            }

            // 将创建的cookie名与获取的cookie数组中已经存在的cookie名进行比较
            if ("password".equals(cookie.getName())) {
                password = cookie.getValue();
            }
        }
    }
%>
<div style="margin: 20px;padding: 40px">
    <div class="panel panel-default" style="width:380px;margin: 0 auto;">
    <div class="panel-heading" ><h3 class="panel-title" >登录</h3></div>
        <div class="panel-body" >
            <form id="login-form" action="servlet/LoginServlet">
                <div class="group" >
                    <input type="text"  name="email" style="text-align: left" value="<%=email%>" required>
                    <span class="bar"></span>
                    <label>邮箱</label>
                 </div>

                <div class="group" style="margin: 0">
                    <input type="password" name="password" style="text-align: left" value="<%=password%>" required>
                    <span class="bar" style=""></span>
                    <label>密码</label>
                </div>

                <div style="text-align: right;top: -20px" ><a  href="#">(忘记密码)</a></div>
                <div class="checkbox" style="text-align: left;"><label><input type="checkbox"  name="rememberme" checked="<%=checked%>">记住密码 </label></div>
                <input type="submit" class="btn  btn-success" value="登录"></input>
                <input type="reset" class="btn  btn-success" value="重置"></input>
            </form>
            <span id="spInfo" style="color:red"></span>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
