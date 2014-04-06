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
                        console.log('resolve...');
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

angular.module('Combray').controller('AppCtrl', ['$scope', function ($scope) { }])
.controller('CurrentStockCtrl', [
    '$scope', 
    '$location', 
    '$http',
    'categories', function ($scope, $location, $http, categories) {

    function getItemsBySubcategory (subcategory_id) {
        // need to:
        // fetch items based on value of subcategory query param
        var reqUrl = '/items';

        if (subcategory_id) {
            reqUrl += '?subcategory_id=' + subcategory_id;
        }
        
        $http.get(reqUrl).then(function (res) {
            $scope.items = res.data;
        });
    }

    console.log('categories', categories);
    $scope.categories = categories;
    $scope.items = [];


    $scope.onCategoryClick = function (category, subcategory) {
        $location.search('subcategory', null);
        $location.search('category', category.name);

        if (subcategory) {
            $location.search('subcategory', subcategory.id.toString());
            getItemsBySubcategory(subcategory.id);
        } else {
            category.open = !category.open;
        }
    }
}])
.controller('CurrentStockItemCtrl', [
    '$scope', 
    '$location', 
    'item', function ($scope, $location, item) {

    var $mainImage = angular.element('.main-image img');

    $scope.onThumbClick = function (thumb) {
        $mainImage.attr('src', thumb.photo.main_show.url);
    }
    $scope.item = item;
}]);
