(function () {
    var a = angular.module('Application', ['ui.bootstrap']);

    a.controller('DatepickerDemoCtrl', ['$scope', function ($scope) {
        //获得今天日期时间
        $scope.today = function () {
            $scope.dt = new Date();
        };
        $scope.today();

        //空情表单日期信息
        $scope.clear = function () {
            $scope.dt = null;
        };

        // Disable weekend selection 自定义周几不能被选择, 比如周末休息, 周末将不能分配任务
        $scope.disabled = function (date, mode) {
            return ( mode === 'day' && ( date.getDay() === 0 || date.getDay() === 6 ) );
        };

        //最小日期, 应用场景, 比如要选择起始日期, 肯定是左右又大之类.. 或者不得小于今天
        $scope.toggleMin = function () {
            $scope.minDate = $scope.minDate ? null : new Date();
        };
        $scope.toggleMin();

        //用于处理弹出显示影藏
        $scope.open = function ($event) {
            $event.preventDefault();
            $event.stopPropagation();
            $scope.opened = true;
        };

        $scope.dateOptions = {
            formatYear: 'yy',
            startingDay: 1 //一周开始星期几
        };

        //日期格式化
        $scope.formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
        //默认选取第一个方式格式化
        $scope.format = $scope.formats[0];
    }]);
    ;
})();