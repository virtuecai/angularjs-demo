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
    <meta charset="utf-8">
    <title>AngularJs Example: ng-select with directive</title>
    <link rel="stylesheet" href="${ctx}/assets/plugins/bootstrap-3.1.1-dist/css/bootstrap.min.css">
</head>

<!-- 1. nv-file-drop="" uploader="{Object}" options="{Object}" filters="{String}" -->
<body ng-controller="Ctrl" style="margin-top: 50px;">

<div class="container">

    <div class="row">
        selected: {{selected}} <br/>
        <some-select ng-model="selected"></some-select>
    </div>

    <div class="row">
        selected: {{selected2}} <br/>
        <common-select ng-model="selected2" value="id" text="name" data-url="/application/ngselect/data.json"></common-select>
    </div>

    <div class="row">
        selected: {{selectedItem2}} <br/>
        <select ng-model="selectedItem2" ng-options="item.id as item.name for item in selectItems">
            <option value="">-- 请选择 --</option>
        </select>
    </div>

</div>

<script>
    //不能少, 多多处js用到.
    window['ctx'] = '${ctx}';
</script>
<script src="${ctx}/assets/lib/jquery-1.8.3.min.js"></script>
<script src="${ctx}/assets/lib/angularjs/angular.js"></script>
<script src="${ctx}/application/ngselect/c-ng-select.js?time=<%=System.currentTimeMillis()%>"></script>

</body>
</html>