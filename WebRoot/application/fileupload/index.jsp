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
    <title>AngularJs Example: FileUpload</title>
    <link rel="stylesheet" href="${ctx}/assets/plugins/bootstrap-3.1.1-dist/css/bootstrap.min.css">
</head>

<!-- 1. nv-file-drop="" uploader="{Object}" options="{Object}" filters="{String}" -->
<body ng-controller="AppController" nv-file-drop="" uploader="uploader" filters="queueLimit, customFilter">

<div class="container">

    <div class="row">

        <div class="col-md-3">
            <h3>选择文件</h3>
            <!-- Example: nv-file-select="" uploader="{Object}" options="{Object}" filters="{String}" -->
            多个
            <input type="file" nv-file-select="" uploader="uploader" multiple  /><br/>
            单个
            <input type="file" nv-file-select="" uploader="uploader" />
        </div>

        <div class="col-md-9" style="margin-bottom: 40px">
            <h3>上传 队列</h3>
            <p>队列 长度: {{ uploader.queue.length }}</p>
            <table class="table">
                <thead>
                <tr>
                    <th width="50%">名称</th>
                    <th ng-show="uploader.isHTML5">大小</th>
                    <th ng-show="uploader.isHTML5">进度</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="item in uploader.queue">
                    <td><strong>{{ item.file.name }}</strong></td>
                    <td ng-show="uploader.isHTML5" nowrap>{{ item.file.size/1024/1024|number:2 }} MB</td>
                    <td ng-show="uploader.isHTML5">
                        <div class="progress" style="margin-bottom: 0;">
                            <div class="progress-bar" role="progressbar" ng-style="{ 'width': item.progress + '%' }"></div>
                        </div>
                    </td>
                    <td class="text-center">
                        <span ng-show="item.isSuccess"><i class="glyphicon glyphicon-ok"></i></span>
                        <span ng-show="item.isCancel"><i class="glyphicon glyphicon-ban-circle"></i></span>
                        <span ng-show="item.isError"><i class="glyphicon glyphicon-remove"></i></span>
                    </td>
                    <td nowrap>
                        <button type="button" class="btn btn-success btn-xs" ng-click="item.upload()" ng-disabled="item.isReady || item.isUploading || item.isSuccess">
                            <span class="glyphicon glyphicon-upload"></span> 上传
                        </button>
                        <button type="button" class="btn btn-warning btn-xs" ng-click="item.cancel()" ng-disabled="!item.isUploading">
                            <span class="glyphicon glyphicon-ban-circle"></span> 取消
                        </button>
                        <button type="button" class="btn btn-danger btn-xs" ng-click="item.remove()">
                            <span class="glyphicon glyphicon-trash"></span> 移除
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
            <div>
                <div>
                    队列 进度:
                    <div class="progress" style="">
                        <div class="progress-bar" role="progressbar" ng-style="{ 'width': uploader.progress + '%' }"></div>
                    </div>
                </div>
                <button type="button" class="btn btn-success btn-s" ng-click="uploader.uploadAll()" ng-disabled="!uploader.getNotUploadedItems().length">
                    <span class="glyphicon glyphicon-upload"></span> 上传所有
                </button>
                <button type="button" class="btn btn-warning btn-s" ng-click="uploader.cancelAll()" ng-disabled="!uploader.isUploading">
                    <span class="glyphicon glyphicon-ban-circle"></span> 取消所有
                </button>
                <button type="button" class="btn btn-danger btn-s" ng-click="uploader.clearQueue()" ng-disabled="!uploader.queue.length">
                    <span class="glyphicon glyphicon-trash"></span> 移除所有
                </button>
            </div>

        </div>

    </div>

</div>

<script>
    //不能少, 多多处js用到.
    window['ctx'] = '${ctx}';
</script>
<script src="${ctx}/assets/lib/jquery-1.8.3.min.js"></script>
<script src="${ctx}/assets/lib/angularjs/angular.js"></script>
<script src="${ctx}/assets/lib/angularjs/i18n/angular-locale_zh-cn.js"></script>
<script src="${ctx}/assets/plugins/ui-bootstrap-tpls-0.12.0.min.js"></script>
<script src="${ctx}/assets/plugins/angular-file-upload/angular-file-upload.js"></script>
<script src="${ctx}/application/fileupload/fileupload.demo.js"></script>

</body>
</html>