angular
	.module('theApp', [])
	.controller('todoCtrl' , todoCtrl);

todoCtrl.$inject = ['$scope' , '$http' , '$httpParamSerializer'];

function todoCtrl($scope , $http , $httpParamSerializer  ) {

	$http.get('/index.cfm/todo').success( function( data ) { $scope.todos = data } );

	$scope.saveTodo = function( idx ) {
		var todo = $scope.todos[idx];
		$http({
			method: 'POST',
			url: '/index.cfm/todo',
			data: $httpParamSerializer(todo),
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			} // set the headers so angular passing info as form data (not request payload)
		}).success(function(data){

			$scope.todos[idx] = data;

		});

	};

	$scope.deleteTodo = function( idx ) {

		var todo = $scope.todos[idx];

		$http.delete('/index.cfm/todo/' + todo.id).success(function(data){

				$scope.todos.splice( idx , 1 );

				});


		};


	$scope.newTodo = function() {

		$scope.todos.push( { "status":"new" }  );

	};


	$scope.reset = function( idx ) {

		var todo = $scope.todos[idx];

		$http.get('/index.cfm/todo/' + todo.id).success( function( data ) { $scope.todos[idx] = data } );

	}

};
