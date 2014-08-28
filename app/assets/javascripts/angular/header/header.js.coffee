app.controller 'HeaderCtrl', ['$scope','$location', "$timeout", 'Home', 'toaster', ($scope, $location, $timeout, Home, toaster)->
  $scope.isActive = (location)->
    if location == '/'
      $location.path() == location
    else
      $location.path().indexOf(location) == 0
#  $scope.create_job = (klass)->
#    Job.save {job: {_type: klass}}
  $scope.create_job = (klass)->
    Home.worker {name: klass}
]
