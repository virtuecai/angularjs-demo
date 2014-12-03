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
    <title>AngularJs Example: DatePicker Use</title>
    <link rel="stylesheet" href="${ctx}/assets/plugins/bootstrap-3.1.1-dist/css/bootstrap.min.css">
</head>
<body>

<div class="container">

    <div ng-controller="DatepickerDemoCtrl">
        <pre>Selected date is: <em>{{dt | date:'fullDate' }}</em></pre>

        <h4>Inline</h4>
        <div style="display:inline-block; min-height:290px;">
            <datepicker ng-model="dt" min-date="minDate" show-weeks="true" class="well well-sm"></datepicker>
        </div>

        <h4>Popup</h4>
        <div class="row">
            <div class="col-md-6">
                <p class="input-group">
                    <input type="text" class="form-control"
                           datepicker-popup="{{format}}"
                           ng-model="dt"
                           is-open="opened"
                           min-date="minDate"
                           max-date="'2014-11-27'"
                           datepicker-options="dateOptions"
                           date-disabled="disabled(date, mode)"
                           ng-required="true"
                           show-weeks="false"
                           close-text="关闭"
                           clear-text="清空"
                           current-text="今天" />
              <span class="input-group-btn">
                <button type="button" class="btn btn-default" ng-click="open($event)"><i class="glyphicon glyphicon-calendar"></i></button>
              </span>
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label>Format:</label> <select class="form-control" ng-model="format" ng-options="f for f in formats"><option></option></select>
            </div>
        </div>

        <hr />
        <button type="button" class="btn btn-sm btn-info" ng-click="today()">Today</button>
        <button type="button" class="btn btn-sm btn-default" ng-click="dt = '2009-08-24'">2009-08-24</button>
        <button type="button" class="btn btn-sm btn-danger" ng-click="clear()">Clear</button>
        <button type="button" class="btn btn-sm btn-default" ng-click="toggleMin()" tooltip="After today restriction">Min date</button>
    </div>

</div>


<script src="${ctx}/assets/lib/jquery-1.8.3.min.js"></script>
<script src="${ctx}/assets/lib/angularjs/angular.js"></script>
<script src="${ctx}/assets/lib/angularjs/i18n/angular-locale_zh-cn.js"></script>
<script src="${ctx}/assets/plugins/ui-bootstrap-tpls-0.12.0.min.js"></script>
<script src="${ctx}/application/datepicker/datepicker.use.js"></script>

</body>
</html>