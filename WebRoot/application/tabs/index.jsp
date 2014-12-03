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
    <title>AngularJs Example: Tabs</title>
    <link rel="stylesheet" href="${ctx}/assets/plugins/bootstrap-3.1.1-dist/css/bootstrap.min.css">
</head>
<body>

<div class="container" ng-controller="TabsCtrl">

    <p>
        <button ng-repeat="menu in menus"  class="btn btn-default btn-sm" ng-click="addMenu(menu)" ng-bind="menu.title"></button>
    </p>


    <tabset>
        <tab heading="Static title">Static content</tab>
        <tab ng-repeat="tab in tabs" heading="{{tab.title}}" active="tab.active" disabled="tab.disabled" title="双击移除" ng-dblclick="dbclick(tab)">
           <div ng-include="tab.url"></div>
        </tab>
    </tabset>


</div>

<script>
    //不能少, 多多处js用到.
    window['ctx'] = '${ctx}';
</script>
<script src="${ctx}/assets/lib/jquery-1.8.3.min.js"></script>
<script src="${ctx}/assets/lib/angularjs/angular.js"></script>
<script src="${ctx}/assets/lib/angularjs/i18n/angular-locale_zh-cn.js"></script>
<script src="${ctx}/assets/plugins/ui-bootstrap-tpls-0.12.0.min.js"></script>
<script src="${ctx}/application/tabs/auto.tabs.js"></script>

</body>
</html>