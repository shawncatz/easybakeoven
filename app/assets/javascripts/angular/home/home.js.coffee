app.controller 'HomeCtrl', ['$scope', "$location", "$timeout", 'Home', ($scope, $location, $timeout, Home)->

]
app.controller 'HomeHeaderCtrl', ['$scope','$location','Session', ($scope, $location, Session)->
  $scope.view = Session.view()

  $scope.$watch 'view', ->
    Session.view($scope.view)

  $scope.isActive = Session.path
]
app.config ['$routeProvider', ($routeProvider) ->
  $routeProvider
  .when '/',
      templateUrl: "/assets/angular/home/templates/index.html"
  .when '/home/index',
      templateUrl: "/assets/angular/home/templates/index.html"

]
app.factory 'Home', ['$resource', ($resource) ->
  $resource '/home/:id', {id: '@id'}, {
    query: {method: 'GET', isArray: false},
  }
]
