<%--
@Aothor: VirtueCai
@CreatedOn: 2014/12/3 11:30
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html ng-app="Application">
<head lang="en">
    <meta charset="UTF-8">
    <title>AngularJs Example: table</title>
    <link rel="stylesheet" href="${ctx}/assets/plugins/bootstrap-3.1.1-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/assets/plugins/jquery-resizableColumns/jquery.resizableColumns.css">
</head>
<body style="margin-top: 50px;">

<div class="container" ng-controller="Controller">

    <table class="table table-bordered" jquery-resizable-columns>
        <thead>
        <tr>
            <th>name</th>
            <th>age</th>
            <th>sex</th>
        </tr>
        </thead>
        <tbody>
        <tr ng-repeat="item in items">
            <td>{{item.name}}</td>
            <td>{{item.age}}</td>
            <td>{{item.sex}}</td>
        </tr>
        </tbody>
    </table>

    <hr/>

    <table id="myTable" border="1">
        <thead>
        <tr>
            <th><input type="checkbox"></th>
            <th>栏目类型 </th>
            <th>活动名称 </th>
            <th>状态 </th>
            <th>操作选项</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><input type="checkbox"></td>
            <td>青春日记</td>
            <td>2014年度青春日记征文 </td>
            <td>提交 </td>
            <td>审核</td>
        </tr>
        <tr>
            <td><input type="checkbox"></td>
            <td>我和孩子的成长故事</td>
            <td>成长故事 </td>
            <td>通过 </td>
            <td>审核</td>
        </tr>
        </tbody>
    </table>

</div>


<script src="${ctx}/assets/lib/jquery-1.8.3.min.js"></script>
<script src="${ctx}/assets/plugins/jquery-resizableColumns/jquery.resizableColumns.js"></script>
<script src="${ctx}/assets/plugins/jquery-resizableColumns/store.min.js"></script>
<script src="${ctx}/assets/lib/angularjs/angular.js"></script>
<script src="${ctx}/application/table/table.js"></script>

<script>
    //$('table').resizableColumns({store: window.store});

    $("#myTable").resizableColumns({
        store: window.store
    });
</script>

</body>
</html>