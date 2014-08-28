app.controller 'SearchCtrl', ['$scope', '$q', '$location', 'Search', ($scope, $q, $location, Search)->
  $scope.selected = null
  $scope.list = []

  $scope.selectTitle = (one, two, three, four)->
    found = $scope.find($scope.selected)
    url = "/"+found.plural+"/"+found.id
    $location.path(url)
    $scope.selected = null

  $scope.find = (title)->
    found = null
    $.each $scope.list, (i, v)->
      if title == v.title
        found = v
        return false
    return found

  $scope.search = (terms)->
    defer = $q.defer()
    if (terms)
      Search.query {terms: terms},
      (data, headers)->
        if !$scope.$$phase
          $rootScope.$apply ->
            defer.resolve(data)
            $scope.list = data
        else
          defer.resolve(data)
          $scope.list = data
      ,(response)->
        if !$scope.$$phase
          $rootScope.$apply ->
            defer.reject('Server rejected with status '+ response.status)
        else
          defer.reject('Servier rejected with status '+response.status)
    else
      if !$scope.$$phase
        $rootScope.$apply ->
          defer.reject('no terms')
      else
        defer.reject('no terms')

    defer.promise
]
app.factory 'Search', ['$resource', ($resource)->
  $resource '/search/:terms', {id: '@terms'}, {
    query: {method: 'GET', isArray: true},
    update: { method: 'PUT' }
  }
]
