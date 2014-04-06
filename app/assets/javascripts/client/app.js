angular.module('Combray', ['ngRoute'])
    .config(['$routeProvider', function ($routeProvider) {
        $routeProvider
            .when('/', {
                templateUrl: 'assets/client/templates/home.html'
            })
            .when('/current-stock:category?:subcategory?', {
                templateUrl: 'assets/client/templates/current-stock.html',
                controller: 'CurrentStockCtrl',
                reloadOnSearch: false,
                resolve: {
                    categories: ['$http', function ($http) {
                        return $http.get('/categories').then(function (res) {
                            return res.data;
                        })
                    }]
                }
            })
            .when('/current-stock/:itemId', {
                templateUrl: 'assets/client/templates/current-stock-item.html',
                controller: 'CurrentStockItemCtrl',
                resolve: {
                    item: ['$http', '$route', function ($http, $route) {
                        return $http.get('/items/' + $route.current.params.itemId).then(function (res) {
//                        return $http.get('/items').then(function (res) {
                            debugger;
                            return res.data;
                        })
                    }]
                }
            })
            .when('/about', {
                templateUrl: 'assets/client/templates/about.html'
            })
            .when('/contact', {
                templateUrl: 'assets/client/templates/contact.html'
            })
            .when('/services', {
                templateUrl: 'assets/client/templates/services.html'
            });
    }]);

angular.module('Combray').controller('AppCtrl', ['$scope', function ($scope) {
    $scope.test = 'test';
}])
.controller('CurrentStockCtrl', [
    '$scope', 
    '$location', 
    '$http',
    'categories', function ($scope, $location, $http, categories) {

    function getItems () {
        // need to:
        // fetch items based on value of subcategory query param
        $http.get('/items').then(function (res) {
            $scope.items = res.data;
        });
        console.log($location.search());
    }

    console.log('categories', categories);
    $scope.categories = categories;
    $scope.items = [];


    $scope.onCategoryClick = function (category, subcategory) {
        $location.search('subcategory', null);
        $location.search('category', category.name);

        if (subcategory) {
            $location.search('subcategory', subcategory.name);
            getItems();
        } else {
            category.open = !category.open;
        }
    }
}])
.controller('CurrentStockItemCtrl', [
    '$scope', 
    '$location', 
    'item', function ($scope, $location, item) {

    $scope.item = item;
}]);
