(function () {
    angular.module('Application', [])
        .controller('Ctrl', ['$scope','$http', function ($scope, $http) {
            $scope.selectedItem = null;
            //$scope.selected = 1;
            $scope.selected2 = 1;
            $http.get(window['ctx'] + '/application/ngselect/data.json').success(function (data) {
                $scope.selectItems = data;
            });
        }])
        .directive('someSelect', ['$http', function ($http) {
            return {
                restrict: 'E',
                scope: {},
                require: ['ngModel'], // get a hold of NgModelController,
                replace: true,
                template: '<select ng-options="item.id as item.name for item in selectItems"><option value="">-- 请选择 --</option></select>',
                link: function (scope, element, attrs, ctrls) {
                    $http.get(window['ctx'] + '/application/ngselect/data.json').success(function (data) {
                        scope.selectItems = data;
                    });
                }
            };
        }])
        .directive('commonSelect', ['$http', function ($http) {
            return {
                restrict: 'E',
                scope: {
                    url: '@',
                    value: '@',
                    text: '@'
                },
                require: ['ngModel'], // get a hold of NgModelController,
                replace: true,
                template: '<select ng-options="item[\'{{value}}\'] as item[\'{{text}}\'] for item in selectItems"><option value="" ng-selected="selected">-- 请选择 --</option></select>',
                link: function (scope, element, attrs, ctrls) {
                    console.log(attrs)
                    scope.value = attrs.value;
                    scope.text = attrs.text;
                    $http.get(window['ctx'] + attrs.url).success(function (data) {
                        scope.selectItems = data;
                    });
                }
            };
        }]);
})();