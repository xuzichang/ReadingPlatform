<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/11/28
  Time: 13:46
--%>
<%@ page import="toolbean.dbTool" %>
<%@ page import="valuebean.themeInfo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%@include file="search.jsp"%>
<%--   实现页面内容改变 --%>
<script language="javascript">
    $(document).ready(function(){
        $("#headerbar a").click(function(){
            $this = $(this);
            if ($this[0].innerHTML=="讨论贴"){
                $("#headerbar li").removeClass("active");
                $this.parent().addClass("active");
                $this[0].attributes.href='#';
                $("#Recommended").hide();
                $("#QuestionBox").hide();
                $("#Threads").show();
            }else if($this[0].innerHTML=="精华"){
                $("#headerbar li").removeClass("active");
                $this.parent().addClass("active");
                $this[0].attributes.href='#';
                $("#Threads").hide();
                $("#QuestionBox").hide();
                $("#Recommended").show();
            }else if($this[0].innerHTML=="问题箱"){
                $("#headerbar li").removeClass("active");
                $this.parent().addClass("active");
                $this[0].attributes.href='#';
                $("#Threads").hide();
                $("#Recommended").hide();
                $("#QuestionBox").show();
            }
        });
    });
</script>

<div id="mianban" class="panel panel-default" style="width:80%;margin-left: 50px;margin-right: 50px">
    <table width="100%"  class="table " style="border-collapse:separate; border-spacing:0px 0px;">
        <tr>
            <ul class="nav nav-tabs" id="headerbar" >
                <li class="active"><a >讨论贴</a></li>
                <li><a >精华</a></li>
                <li><a>问题箱</a></li>
            </ul>
        </tr>
    </table>

    <table style="width: 100%" id="Threads">
        <%
            dbTool dbt = new dbTool();
            String sql = "select * from theme,user where theme_flag=0 and author_id=user_id;";
            ArrayList<themeInfo> list = dbt.findTheme(sql);
            for(int i = 0; i < list.size(); i++){
                themeInfo themeinfo = list.get(i);
        %>
        <tr>
            <td style="text-align:left;margin: 0px">
                <a href="ThemeContent.jsp?theme_id=<%=themeinfo.getTheme_id()%>"><%=themeinfo.getTheme_name()%></a>
                <small><%=themeinfo.getUpdate_time()%></small>
                <p style="font-size:12px;text-align: left;margin: 0px"><%=themeinfo.getTheme_content()%></p>
            </td>
            <td>
                <p></p>
                <p style="text-align: right;margin: 0px">
                    <i class="iconfont icon-praise_icon" style="font-size:14px;"></i>
                    <i style="font-size:14px;" class="iconfont icon-pinglun"></i>
                </p>
            </td>
        </tr>
        <%
            }
        %>
    </table>

    <table style="width: 100%;" hidden id="Recommended" >
        <%
            String sql_Recommended = "select * from theme,user where theme_flag=0 and author_id=user_id;";
            ArrayList<themeInfo> list_Recommended = dbt.findTheme(sql_Recommended);
            for(int i = 0; i < list_Recommended.size(); i++){
                themeInfo themeinfo = list_Recommended.get(i);
        %>
        <tr>
            <td style="text-align:left;margin: 0px">
                <a href="RecommendedContent.jsp?theme_id=<%=themeinfo.getTheme_id()%>"><%=themeinfo.getTheme_name()%></a>
                <small><%=themeinfo.getUpdate_time()%></small>
                <p style="font-size:12px;text-align: left;margin: 0px"><%=themeinfo.getTheme_content()%></p>
            </td>
            <td>
                <p></p>
                <p style="text-align: right;margin: 0px">
                    <i class="iconfont icon-praise_icon" style="font-size:14px;"></i>
                    <i style="font-size:14px;" class="iconfont icon-pinglun"></i>
                </p>
            </td>
        </tr>
        <%
            }
        %>
    </table>

    <table style="width: 100%;" hidden id="QuestionBox" >
        <%
            String sql_QuestionBox = "select * from theme,user where theme_flag=0 and author_id=user_id;";
            ArrayList<themeInfo> list_QuestionBox= dbt.findTheme(sql_QuestionBox);
            for(int i=0;i<list_QuestionBox.size();i++){
                themeInfo themeinfo = list_QuestionBox.get(i);
        %>
        <tr>
            <td style="text-align:left;margin: 0px">
                <a href="QuestionBoxContent.jsp?theme_id=<%=themeinfo.getTheme_id()%>"><%=themeinfo.getTheme_name()%></a>
                <small><%=themeinfo.getUpdate_time()%></small>
                <p style="font-size:12px;text-align: left;margin: 0px"><%=themeinfo.getTheme_content()%></p>
            </td>
            <td>
                <p></p>
                <p style="text-align: right;margin: 0px">
                    <i class="iconfont icon-praise_icon" style="font-size:14px;"></i>
                    <i style="font-size:14px;" class="iconfont icon-pinglun"></i>
                </p>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</div>
<%@include file="footer.jsp"%>