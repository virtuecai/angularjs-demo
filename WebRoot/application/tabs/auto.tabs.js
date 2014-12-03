(function () {
    var a = angular.module('Application', ['ui.bootstrap']);

    a.controller('TabsCtrl', ['$scope', function ($scope) {
        $scope.menus = [
            {title: 'Dynamic Title 1', url: window['ctx'] + '/application/tabs/tpl/a.html'},
            {title: 'Dynamic Title 2', url: window['ctx'] + '/application/tabs/tpl/b.html'}
        ];
        $scope.tabs = [];
        //{title: 'Dynamic Title 1', url: 'app/tabs/tpl/a.html'},
        //{title: 'Dynamic Title 2', url: 'app/tabs/tpl/b.html'}
        $scope.addMenu = function (menu) {
            if($scope.tabs.indexOf(menu) == -1) $scope.tabs.push(menu);
        };
        $scope.dbclick = function (tab) {
            var idx = $scope.tabs.indexOf(tab);
            $scope.tabs.splice(idx, 1);
        };
    }]);
    ;
})();