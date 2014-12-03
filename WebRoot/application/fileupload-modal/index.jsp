<%--
  @Aothor: VirtueCai 
  @CreatedOn: 2014/12/3 11:30
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-ch" ng-app="Application">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AngularJs Example: FileUpload-Modal</title>
    <link rel="stylesheet" href="${ctx}/assets/plugins/bootstrap-3.1.1-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/application/fileupload-modal/style.css">
</head>
<body ng-controller="FileUploadDemoCtrl">

<div class="container" style="margin-top: 50px;">
    <!-- 此方式一定得有结尾标签 -->
    <file-upload1 ng-model="fileItems"></file-upload1>
    <ul>
        <li ng-repeat="item in fileItems">文件名: <a ng-href="{{item.filePath | fs}}" target="_self">{{item.fileName}}</a>,
            文件大小: {{item.fileSize}}
        </li>
    </ul>
</div>

<script>
    //不能少, 多多处js用到.
    window['ctx'] = '${ctx}';
    window['ResourceBase'] = window['ctx'] + '/upload';
</script>
<script src="${ctx}/assets/lib/jquery-1.8.3.min.js"></script>
<script src="${ctx}/assets/lib/angularjs/angular.js"></script>
<script src="${ctx}/assets/plugins/ui-bootstrap-tpls-0.12.0.min.js"></script>
<script src="${ctx}/assets/plugins/angular-file-upload/angular-file-upload.js"></script>
<script src="${ctx}/application/fileupload-modal/fileupload.modal.js"></script>
<script>
    (function () {
        var app = angular.module('Application', ['ui.fileupload.modal']);
        app.controller('FileUploadDemoCtrl', ['$scope', function ($scope) {
            $scope.fileItems = [];
        }]);

        // file system
        app.filter('fs', function () {
            return function (input) {
                return window['ResourceBase'] + '/' + (input ? input : "images/404.jpg")
            };
        })
    })();
</script>
</body>
</html>
