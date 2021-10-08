<%--
  Created by IntelliJ IDEA.
  User: htk
  Date: 2021/10/8
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询书籍</title>
    <!--BootStrap美化-->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>书籍信息</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/book/queryBook" method="post">
        <%--    书籍名称：<input type="text" name="bookName"><br><br><br>--%>
        <%--    书籍数量：<input type="text" name="bookCounts"><br><br><br>--%>
        <%--    书籍详情：<input type="text" name="detail"><br><br><br>--%>
        <%--    <input type="submit" value="添加">--%>
        <input type="hidden" name="bookID" value="${QBook.bookID}">
        <div class="form-group">
            <label>书籍名称</label>
            <input type="text" name="bookName" class="form-control" value="${QBook.bookName}" required>
        </div>
        <div class="form-group">
            <label>书籍数量</label>
            <input type="text" name="bookCounts" class="form-control" value="${QBook.bookCounts}" required>
        </div>
        <div class="form-group">
            <label>书籍详情</label>
            <input type="text" name="detail" class="form-control" value="${QBook.detail}" required>
        </div>
        <div class="form-group">
            <input type="submit" class="form-control" value="返回">
        </div>
    </form>
</div>
</body>
</html>
