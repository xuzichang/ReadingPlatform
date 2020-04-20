<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/12/24
  Time: 14:51
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<script>
    //页面初始化
    window.onload = function() {
        var i = getUrlParam("i");
        if (i == 1) {
            document.getElementById("spInfo").innerText = "创建失败，主题名已存在";
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
<ul class="breadcrumb" style="text-align: left;margin-left:50px;width: 60%;margin-top: 10px">
    <li><a href="UserContent.jsp?user_id=<%=user.getUser_id()%>">个人中心</a> <span class="divider"></span></li>
    <li class="active">发表主题贴</li>
</ul>
<div  class="panel panel-default" style="width:60%;margin-left: 50px;margin-right: 50px;">
    <div class="panel-heading" style="">发表主题贴</div>
    <form action="servlet/ThemeCreatedServlet" method="post" >
        <table >
            <tr><td style="text-align: left">1 主题帖标题</td></tr>
            <tr><td style="text-align: left"><input  class="form-control"  name="themetitle" style="width: 50%;text-align: left"></td></tr>
            <tr><td style="text-align: left">2 一句话描述</td></tr>
            <tr><td style="text-align: left"><input  class="form-control"  name="one_line_describe" style="width: 50%;text-align: left"></td></tr>
            <tr><td style="text-align: left">3 主题帖内容</td></tr>
            <tr><td style="text-align: left" width="800px">
                <div id="test-editormd">
                <textarea style="display:none;text-align: left" class="editormd-html-textarea"  name="edit" id="editormd"></textarea>
                <textarea class="editormd-html-textarea" name="theme_content" id="editormdhtml"></textarea>
            </div>
            </td></tr>
            <tr><td><input type="submit" class="btn btn-success" value="发布" style="padding-left: 20px;padding-right: 20px;background-color: #5cb85c"/></td></tr>
            <tr><td><span id="spInfo" style="color:red"></span></td></tr>
        </table>

    </form>

</div>
<script>
    var testEditor;
    $(function() {
        testEditor = editormd("test-editormd", {/*配置*/
            width   : "98%",
            height  : 300,
            syncScrolling : "single",
            path    : "lib/", //依赖lib文件夹路径
            emoji : true,
            taskList : true,
            tocm     : true,
            imageUpload: true,
            imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL: "servlet/ImageUploadServlet",//上传图片控制器Mapping
            saveHTMLToTextarea : true
        });
    });
</script>
<%@include file="footer.jsp"%>