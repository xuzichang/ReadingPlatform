<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/11/22
  Time: 15:09
--%>
<%@ page import="valuebean.LoginUser" %>
<%@ page import="toolbean.dbTool" %>
<%@ page import="valuebean.userInfo" %>
<%@ page import="valuebean.bookInfo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <link rel="shortcut icon" href="images/favicon.ico"/>
  <link rel="bookmark" href="images/favicon.ico"/>
  <link type="text/css" rel="stylesheet"  href="stylesheets/style.css" />
  <link rel="stylesheet" href="//at.alicdn.com/t/font_1533885_iecglhs0dz.css">
  <link type="text/css" rel="stylesheet" href="css/style.css" />
  <link type="text/css" rel="stylesheet"  href="stylesheets/style.css" />
  <link type="text/css" rel="stylesheet"  href="stylesheets/editormd.css" />
  <%-- 先引入jquery,再引入bootstrap --%>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="js/jquery.min.js"></script>
  <link href="https://cdn.bootcss.com/twitter-bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.bootcss.com/twitter-bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="wangEditor/release/wangEditor.min.js"></script>
  <script src="js/editormd.min.js"></script>

<%--   实现页面跳转 --%>
  <script language="javascript">
        $(document).ready(function(){
            $(".nav a").each(function(){
                $this = $(this);
                if($this[0].href==String(window.location)){
                    $("#li").removeClass("active");
                    $this.parent().addClass("active");

                }
            });
        });
  </script>
  <title>中文阅读平台</title>
</head>
<body class="content" >
  <%
      //获取登录人姓名
      String userName = "";
      String userEmail = "";
      LoginUser loginUser = (LoginUser) session.getAttribute("LoginUser");
      userName = loginUser.getUserName();
      userEmail = loginUser.getUserId();

      //获取用户详情信息
      dbTool dbt_header = new dbTool();
      String user_sql ="select * from user where email='" + userEmail + "';";
      userInfo user = dbt_header.findOneUser(user_sql);

      //随机生成章节id，用于手气不错模块
      String random_chapter = "select * from chapter where chapter_flag=0";
      ArrayList<bookInfo> randomlist = dbt_header.findChapter(random_chapter);
      int[] arr = new int[randomlist.size()];
       for(int i = 0; i < randomlist.size(); i++){
         bookInfo randombookinfo = randomlist.get(i);
         arr[i] = Integer.parseInt(randombookinfo.getChapter_id());
       }

      //产生0-(arr.length-1)的整数值,也是数组的索引
      int index = (int) (Math.random() * arr.length);
      int rand = arr[index];
    %>
<div clas="nav"style="padding-top:10px;">
  <a class="navbar-brand" href="IndexContent.jsp"><img style="width: 30px;height:30px" src="images/pic.jpg"></a>
  <a class="navbar-brand" href="IndexContent.jsp">能力有限公司</a>
  <ul class="nav nav-tabs" >
    <li><a href="StatusesContent.jsp">动态</a></li>
    <li><a href="LibraryContent.jsp">文库</a></li>
<%--    <li><a href="ForumContent.jsp">论坛</a></li>--%>
    <li><a href="ContentDetailContent.jsp?chapter_id=<%=rand%>">手气不错</a></li>
    <li class="dropdown" style="float: right;margin-right: 30px;">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=userName%><span class="caret"></span></a>
      <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
        <li><a tabindex="-1" href="UserContent.jsp?user_id=<%=user.getUser_id()%>">个人中心</a></li>
        <li><a tabindex="-1" href="NovelCreated.jsp">发表小说</a></li>
        <li><a tabindex="-1" href="ThemeCreated.jsp">发表主题贴</a></li>
        <li class="divider"></li>
        <li><a href="servlet/LogoutServlet" onclick="return confirm('是否退出登录？')">退出登录</a></li>
      </ul>
    </li>
  </ul>
</div>
