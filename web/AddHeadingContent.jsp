<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/12/23
  Time: 15:45
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<ul class="breadcrumb" style="text-align: left;margin-left:50px;width: 80%;margin-top: 10px">
    <li><a href="IndexContent.jsp">首页</a> <span class="divider"></span></li>
    <li class="active">贡献题头</li>
</ul>
<div  class="panel panel-default" style="width:80%;margin-left: 50px;margin-right: 50px;margin-top: 20px">
    <div class="panel-heading" style="text-align:left;">贡献题头</div>
    <form action="servlet/AddHeading">
        <table width="100%"  class="table " style="border-collapse:separate; border-spacing:0px 0px;">
            <tr>
                <td style="text-align:left;margin: 0px"><textarea class="form-control" rows="5" name="newheading" style="resize:none;text-align: left;" ></textarea></td>
            </tr>
            <tr>
                <td colspan="1"><input type="submit" class="btn btn-sm btn-default" style="font-size: 10px;float: right;margin-left:5px" value="提交"></td>
            </tr>
        </table>
    </form>
</div>
<%@include file="footer.jsp"%>