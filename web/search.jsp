<%--
  Created by IntelliJ IDEA.
  User: wattmelon
  Date: 2019/11/22
  Time: 15:26
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div style="width: 80%;padding:20px;">
    <form method="post" action="servlet/SearchServlet">
        <input style="width: 200px;display:inline;" name="searchText" class="form-control" type="search">
        <input style="display:inline" class="btn btn-default  " type="submit" value="搜索">
    </form>
</div>