<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍展示</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--BootStrap美化-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-olOxEXxDwd20BlATUibkEnjPN3sVq2YWmYOnsMYutq7X8YcUdD6y/1I+f+ZOq/47" crossorigin="anonymous">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>



</head>
<body>
<script type="text/javascript">
    function go() {
        //获取文本框中的当前页码
        var pc = $("#pageCode").val() ;
        location = "${pageContext.request.contextPath}/book/allbook?pn=" + pc;
    }
    function queryBook() {
        //获取文本框中的当前id
        var pc = $("#bookId").val() ;
        location = "${pageContext.request.contextPath}/book/toqueryBook?id=" + pc;
    }

</script>
<div class="container">

    <div class="row">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>书籍列表 —— 显示所有书籍</small>
                </h1>
            </div>
        </div>
    </div>


<div class="row">
    <div class="col-md-9 column">
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/toAddBook">新增书籍</a>
    </div>
    <div class="col">
        <div class="input-group">
            <span>输入id</span>
            <input style="width: 30px" type="text" class="inputPageCode" id="bookId" />
            <span>查询</span>
            <%--            <div class="input-group-append">--%>
            <a class="btn btn-primary" href=javascript:queryBook()>确定</a>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12 column">
        <table class="table table-hover ">
            <thead>
            <tr>
                <th>书籍编号</th>
                <th>书籍名字</th>
                <th>书籍数量</th>
                <th>书籍详情</th>
                <th>操作</th>
            </tr>
            </thead>


            <tbody>
            <c:forEach var="book" items="${pageInfo.list}">
                <tr>
                    <td>${book.bookID}</td>
                    <td>${book.bookName}</td>
                    <td>${book.bookCounts}</td>
                    <td>${book.detail}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/book/toUpdate?id=${book.bookID}">更改</a> |
                        <a href="${pageContext.request.contextPath}/book/deleteBook/${book.bookID}">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

    <!-- 显示分页信息 -->
<div class="row">
<%--    <!--分页文字信息  -->--%>
    <div class="col-sm-4">
        <span>——当前${pageInfo.pageNum}页，总共${pageInfo.pages}页，总共${pageInfo.total}条记录——</span>
    </div>
    <!--指定页面跳转-->
    <div class="col-sm-4">
        <div class="input-group">
            <span>到第</span>
            <input style="width: 30px" type="text" class="inputPageCode" id="pageCode" />
            <span>页</span>
            <%--            <div class="input-group-append">--%>
            <a class="btn btn-primary" href=javascript:go()>确定</a>
        </div>
    </div>
<%--    <!-- 分页条信息 -->--%>
    <div class="col-sm-4 ">

        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li>
                    <a class="page-link" href="${pageContext.request.contextPath}/book/allbook?pn=1">首页</a>
                </li>
                <c:if test="${pageInfo.hasPreviousPage}">
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/book/allbook?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                    <c:if test="${page_Num == pageInfo.pageNum}">
                        <li class="page-item active"><a class="page-link" href="#">${page_Num}</a></li>
                    </c:if>
                    <c:if test="${page_Num != pageInfo.pageNum}">
                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/book/allbook?pn=${page_Num}">${page_Num}</a></li>
                    </c:if>
                </c:forEach>
                <c:if test="${pageInfo.hasNextPage}">
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/book/allbook?pn=${pageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <li>
                    <a class="page-link" href="${pageContext.request.contextPath}/book/allbook?pn=${pageInfo.pages}">末页</a>
                </li>
            </ul>
        </nav>
    </div>


    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-NU/T4JKmgovMiPaK2GP9Y+TVBQxiaiYFJB6igFtfExinKlzVruIK6XtKqxCGXwCG" crossorigin="anonymous"></script>
</body>
</html>
