<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/11/28
  Time: 1:09
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    function shows1(a) {
        $('#btn').append('<button style="margin-right: 10px" class="btn" >'+
            '<span id='+a.text()+'>'+a.text()+'</span>'+'</button>');
        var aflength = $('#btn span').text();
        $('#pf li a').each(function () {
            $this = $(this);//有这一句才能获取，没有这一句获取到的是register按钮
            a.attr("onclick","null");
        });

        if (aflength.indexOf($('#pf li a').text()) >= 0){
            $('#pf li a').attr("onclick",'null');
            return;
        }

        if (aflength.indexOf($('#ycx li a').text()) >= 0){
            $('#ycx li a').attr("onclick",'null');
            return;
        }
    }
    function getSelectText() {
        var text="";

        if (typeof($("#原创小说")[0]) == "undefined"){} else text+="原创小说;";
        if (typeof($("#同人小说")[0])=="undefined"){} else text+="同人小说;";
        if (typeof($("#短篇")[0])=="undefined"){} else text+="短篇;";
        if (typeof($("#中篇")[0])=="undefined"){} else text+="中篇;";
        if (typeof($("#长篇")[0])=="undefined"){} else text+="长篇;";
        $("#selectText").val(text);
    }
</script>
<div style="margin-bottom: 20px;margin-top: 10px">
    <div  class="btn-group">
        <div class="btn-group">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" >原创性
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" id="ycx" role="menu">
                <li><a href="#"  onclick="shows1($(this))" >原创小说</a></li>
                <li><a href="#" onclick="shows1($(this))">同人小说</a></li>
            </ul>
        </div>
    </div>
    <div id="addgroups" class="btn-group">
        <div class="btn-group">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" >篇幅
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" id="pf" role="menu">
                <li><a href="#"  onclick="shows1($(this))" >短篇</a></li>
                <li><a href="#" onclick="shows1($(this))">中篇</a></li>
                <li><a href="#" onclick="shows1($(this))">长篇</a></li>
            </ul>
        </div>
    </div>

    <div style="display: inline-block">
        <form method="post" action="servlet/LabelSearchServlet">
            <input type="submit" class="btn btn-success" onclick="return getSelectText()" style="background-color: #5cb85c" value="搜索">
            <input id="selectText" name="selectText" type="hidden">
        </form>
    </div>

    <div id="btn"></div>


</div>
