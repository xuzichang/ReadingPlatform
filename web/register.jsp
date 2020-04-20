<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/11/22
  Time: 15:27
--%>
<%@include file="headerForNotLogin.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    var InterValObj;                                           //timer变量，控制时间
    var count = 60;                                            //间隔函数，1秒执行
    var curCount;                                              //当前剩余秒数

    function sendMessage() {
        curCount = count;

        $("#btn").attr("disabled", "true");
        $("#btn").text(curCount + "秒后可重新发送");
        InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次请求后台发送验证码 TODO
    }

    //timer处理函数
    function SetRemainTime() {
        if (curCount == 0 || document.getElementById("spInfo").innerText!='') {
            window.clearInterval(InterValObj);                 //停止计时器
            $("#btn").removeAttr("disabled");                  //启用按钮
            $("#btn").text("重新发送验证码");
        } else {
            curCount--;
            $("#btn").text(curCount + "秒后可重新发送");
        }
    }
</script>
<script>
    //页面初始化
    window.onload = function() {
        var i = getUrlParam("i");
        if (i == 1) {
            document.getElementById("spInfo").innerText = "注册失败，验证码错误";
        }else  if (i == 2) {
            document.getElementById("spInfo").innerText = "注册失败，密码输入错误";
        }
        else {
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
<div style="margin: 20px;padding: 40px">
    <div class="panel panel-default" style="width:400px;margin: 0 auto;">
        <div class="panel-heading" ><h3 class="panel-title" >注册</h3></div>
        <div class="panel-body" >
            <form id="login-form"  action="servlet/RegisterServlet">
                <div class="registergroup">
                    <span style="font-size: 16px">邮箱</span>
                   <input type="text" name="email" id="email" style="text-align: left;">
                   <a href="#" class="btn btn-sm btn-default" id="btn" onclick="sendMessage()"  style="font-size: 10px">发送验证码</a>
                </div>
                <div class="registergroup">
                    <span style="font-size: 16px">验证码</span>
                    <div  id="ipt" style="display: inline">
                        <input name="w1" type="text" style="width:35px;height:25px;text-align:center;">
                        <input name="w2" type="text" style="width:35px;height:25px;text-align:center;">
                        <input name="w3" type="text" style="width:35px;height:25px;text-align:center;">
                        <input name="w4" type="text" style="width:35px;height:25px;text-align:center;">
                    </div>
                </div>
                <div class="registergroup">
                    <span  style="font-size: 16px">用户名</span>
                    <input name="username"  style="text-align: left;" >
                </div>
                <div class="registergroup">
                    <span  style="font-size: 16px">密码</span>
                    <input name="password" type="password" style="text-align: left;" >
                </div>
                <div class="registergroup">
                    <span style="font-size: 16px">确认密码</span>
                    <input name="checkpassword" type="password" style="text-align: left;" >
                </div>
                <div class="registergroup">
                    <span style="font-size: 16px">个人描述</span>
                    <input name="one_line_describe"  style="text-align: left;" >
                </div>
                <input type="submit" style="margin-top: 20px;" class="btn  btn-success" value="注册"/>
            </form>
            <span id="spInfo" style="color:red"></span>
        </div>
    </div>
</div>
<script type="text/javascript">
    var sms = "";
    $("#btn").click(function() {
        var email = $("#email").val();
        if (email != "") {
            $.ajax({
                url : "servlet/SendMailServlet",               //发送请求
                type : "post",
                data : {
                    "email" : email
                },
                success : function(result) {
                    sms = result;
                    document.getElementById("spInfo").innerText = sms;
                }
            });
        } else {
            alert("请输入邮箱");
            return false;
        }
    });

    //自动移动至下一位
    $('#ipt input:gt(0)').attr('readOnly', 'true');
    $('#ipt input').keyup(function() {
        if (/^[0-9]{1}$/g.test($(this).val())) {
            $(this).next().removeAttr('readOnly').focus();
        } else {
            alert('请输入1位数字');
            $(this).val('');
        }
    });
</script>
<%@include file="footer.jsp"%>