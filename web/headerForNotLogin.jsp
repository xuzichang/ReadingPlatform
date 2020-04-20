<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/12/23
  Time: 1:34
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="shortcut icon" href="images/favicon.ico"/>
    <link rel="bookmark" href="images/favicon.ico"/>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet"  href="stylesheets/style.css" />
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1533885_iecglhs0dz.css">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="https://cdn.bootcss.com/twitter-bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
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
<div clas="nav"style="padding-top:10px;">
    <a class="navbar-brand" href="index.jsp"><img style="width: 30px;height:30px" src="images/pic.jpg"></a>
    <a class="navbar-brand" href="index.jsp">能力有限公司</a>
    <ul class="nav nav-tabs" >
        <li><a href="StatusesContent.jsp">动态</a></li>
        <li><a href="LibraryContent.jsp">文库</a></li>
<%--        <li><a href="ForumContent.jsp">论坛</a></li>--%>
        <li><a href="register.jsp">注册</a></li>
    </ul>
</div>
