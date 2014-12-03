/**
 * 指令式文件上传, 使用简单. 依赖服务: ['angularFileUpload', 'ui.bootstrap']
 */
(function () {
    angular.module('ui.fileupload.modal', ['angularFileUpload', 'ui.bootstrap'])
        .controller('FileUploadModalCtrl', ['$scope', '$modalInstance', 'FileUploader', '$log', function ($scope, $modalInstance, FileUploader, $log) {
            $scope.uploadSuccessedFiles = $scope.$parent.getNgModelCtrlViewValue() || [];
            $scope.onFileUploadSuccess = function (fileItem) {
                $scope.uploadSuccessedFiles.push(fileItem);
                console.log('$scope.uploadSuccessedFiles.push(fileItem); this length: ' + $scope.uploadSuccessedFiles.length);
            };
            $scope.remove = function (fileItem) {
                var idx = $scope.uploadSuccessedFiles.indexOf(fileItem);
                if (idx != -1) $scope.uploadSuccessedFiles.splice(idx, 1);
            };
            $scope.ok = function () {
                $scope.$parent.responseResult($scope.uploadSuccessedFiles);
                $log.info('Modal dismissed at: ' + new Date());
                $modalInstance.close();
            };
            $scope.cancel = function () {
                $modalInstance.dismiss('cancel');
            };

            //-------------------------------- core begin
            var uploader = $scope.uploader = new FileUploader({
                url: window['ctx'] + '/api/UploadServlet'
            });

            // FILTERS
            uploader.filters.push({
                name: 'customFilter',
                fn: function (item /*{File|FileLikeObject}*/, options) {
                    return this.queue.length < 10;
                }
            });

            // CALLBACKS
            uploader.onWhenAddingFileFailed = function (item /*{File|FileLikeObject}*/, filter, options) {
                //console.info('onWhenAddingFileFailed', item, filter, options);
            };
            uploader.onAfterAddingFile = function (fileItem) {
                //console.info('onAfterAddingFile', fileItem);
            };
            uploader.onAfterAddingAll = function (addedFileItems) {
                //console.info('onAfterAddingAll', addedFileItems);
            };
            uploader.onBeforeUploadItem = function (item) {
                //console.info('onBeforeUploadItem', item);
            };
            uploader.onProgressItem = function (fileItem, progress) {
                //console.info('onProgressItem', fileItem, progress);
            };
            uploader.onProgressAll = function (progress) {
                //console.info('onProgressAll', progress);
            };
            uploader.onSuccessItem = function (fileItem, response, status, headers) {
                //console.info('onSuccessItem', fileItem, response, status, headers);
            };
            uploader.onErrorItem = function (fileItem, response, status, headers) {
                //console.info('onErrorItem', fileItem, response, status, headers);
            };
            uploader.onCancelItem = function (fileItem, response, status, headers) {
                // console.info('onCancelItem', fileItem, response, status, headers);
            };
            uploader.onCompleteItem = function (fileItem, response, status, headers) {
                //console.info('onCompleteItem', fileItem, response, status, headers);
                if(status == 200) $scope.onFileUploadSuccess(response);
            };
            uploader.onCompleteAll = function () {
                //console.info('onCompleteAll');
            };
            //console.info('uploader', uploader);
            //-------------------------------- core end
        }])

        //指令部分.....................
        .controller('fileUpload1_d', ['$scope', 'FileUploader', '$modal', function ($scope, FileUploader, $modal) {
            var ngModelCtrl = {$setViewValue: angular.noop}; // nullModelCtrl
            this.init = function (ngModelCtrl_) {
                ngModelCtrl = ngModelCtrl_;
            };
            $scope.responseResult = function (uploadedFiles) {
                angular.forEach(uploadedFiles, function (file) {
                    if ($(ngModelCtrl.$viewValue).filter(function () {
                            return this['filePath'] == file['filePath']
                        }).length == 0) ngModelCtrl.$viewValue.push(file);
                });
            };
            $scope.getNgModelCtrlViewValue = function () {
                return angular.copy(ngModelCtrl.$viewValue);
            };
            $scope.openFileUploadModal = function (size) {
                $modal.open({
                    templateUrl: window['ctx'] + '/application/fileupload-modal/file.upload.modal.tpl.html',
                    size: size,
                    scope: $scope,
                    windowClass: 'modal-file-upload',
                    backdrop: 'static',
                    controller: 'FileUploadModalCtrl'
                });
            };
        }])
        .directive('fileUpload1', function () {
            return {
                restrict: 'E',
                scope: {},
                require: ['fileUpload1', '?ngModel'], // get a hold of NgModelController,
                replace: true,
                controller: 'fileUpload1_d',
                template: '<div class="file-upload-btn"><button type="button" class="btn btn-info" ng-click="openFileUploadModal()">文件上传</button></div>',
                link: function (scope, element, attrs, ctrls) {
                    var FileUpload1Ctrl = ctrls[0], ngModelCtrl = ctrls[1];
                    if (!ngModelCtrl) {
                        return; // do nothing if no ng-model
                    }
                    FileUpload1Ctrl.init(ngModelCtrl);
                }
            };
        });
})();