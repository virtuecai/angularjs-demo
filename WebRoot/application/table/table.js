(function () {
    var a = angular.module('Application', []);

    a.controller('Controller', ['$scope', function ($scope) {
        $scope.items = [
            {name: 'a', age: 18, sex: 'male'},
            {name: 'b', age: 19, sex: 'female'},
        ];
    }]);
    a.directive('jqueryResizableColumns', function () {
        return {
            restrict: 'A',
            link: function (scope, element, attrs, ctrls) {
                console.log('$scope.item.length: ' + scope.items.length);
                element.resizableColumns({store: window.store});
            }
        };
    });
})();