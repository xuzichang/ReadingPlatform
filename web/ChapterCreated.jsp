<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/12/24
  Time: 1:30
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<script>
    //页面初始化
    window.onload = function() {
        var i = getUrlParam("i");
        if (i == 1) {
            document.getElementById("spInfo").innerText = "创建失败，书名已存在";
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

    function setText() {
        $("#text").val(editor.txt.text());
        return true;
    }

</script>
<%
    dbTool dbt = new dbTool();
    String sql = "select * from book,user where book_flag=0 and author_id=user_id and author_id=" + user.getUser_id()
            + " and book_id='" + request.getParameter("book_id")+"';";
    ArrayList<bookInfo> list = dbt.findBook(sql);
    bookInfo bookinfo = list.get(0);
%>
<ul class="breadcrumb" style="text-align: left;margin-left:50px;width: 80%;margin-top: 10px">
    <li><a href="UserContent.jsp?user_id=<%=user.getUser_id()%>">个人中心</a> <span class="divider"></span></li>
    <li><a href="MyBookDetail.jsp?book_id=<%=bookinfo.getBook_id()%>&book_name=<%=bookinfo.getBook_name()%>"><%=bookinfo.getBook_name()%></a><span class="divider"></span></li>
    <li class="active">发表新章节</li>
</ul>
<div  class="panel panel-default" style="width:80%;margin-left: 50px;margin-right: 50px;">
    <div class="panel-heading" style="">发表新章节</div>
    <form action="servlet/ChapterCreatedServlet" method="post" >
        <div style="padding: 10px">
            章节名称
            <input  class="form-control"  name="chapter_name" style="display:inline-block;width: 50%;text-align: left">
            <input  class="form-control"  type="hidden" name="book_id" value=<%=request.getParameter("book_id")%>
                    style="display:inline-block;">
            <input  type="submit" onclick="return setText()" class="btn btn-success" value="发布" style="display:inline-block;padding-left: 20px;padding-right: 20px;background-color: #5cb85c"/>
        </div>
        <textarea name="text" id="text" hidden></textarea>
        <!--文本显示区域，名字id是editor-->
        <div id="editor" style="text-align: left;width: 80%;padding:10px;padding-left: 20%;"></div>
        <span id="spInfo" style="color:red"></span>
    </form>
</div>

<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#editor')
    // 或者 var editor = new E( document.getElementById('editor') )
    //这里我们选用base64来上传图片
    editor.customConfig.uploadImgShowBase64 = true
    editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024
    editor.customConfig.uploadImgMaxLength = 5
    editor.create()
</script>

<%@include file="footer.jsp"%>