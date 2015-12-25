<div class="container">
	<div class="page-header">
	  <h1>Simple ToDo using CFML, FW1, Angularjs and Bootstrap</h1>
	</div>

	<div class="panel panel-default form-horizontal" >
		<div class="panel-heading">
			<h3 class="panel-title">List</h3>
		</div>
		<div class="panel-body">
		<p>
			<button class="btn button btn-default" ng-click="newTodo()"><span class="glyphicon glyphicon-plus"></span> New</button>
		</p>
		<table class="table table-striped table-bordered table-valign-middle">
			<thead>
			<tr>
				<th class="col-md-7">Item</th>
				<th>Status</th>
				<th class="col-md-3"></th>
			</tr>
			</thead>
			<tbody>
			<tr class="align-top" ng-form name="myForm" ng-repeat="todo in todos">
				<td>
					<input type="text" class="form-control" ng-model="todo.title" >
				</td>
				<td>
				<select type="select" style="background:#fff;" class="form-control" ng-model="todo.status">
					<option value="new">New</option>
					<option value="pending">Pending</option>
					<option value="complete">Complete</option>
				</select>
				</td>
				<td>
					<button class="btn button btn-default" ng-class="{'btn-success': !myForm.$pristine }" ng-disabled="myForm.$pristine" ng-click="saveTodo($index);myForm.$setPristine(true)" ><span class="glyphicon glyphicon-ok"></span> Save</button>
					<button class="btn button btn-default" ng-class="{'btn-warning': !myForm.$pristine }" ng-disabled="myForm.$pristine" ng-click="reset($index)" ><span class="glyphicon glyphicon-remove"></span> Cancel</button>
					<button class="btn button btn-default" ng-click="deleteTodo($index)"><span class="glyphicon glyphicon-plus"></span> Delete</button>
				</td>
			</tr>
			</tbody>
		</table>

		</div>
	</div>
</div>
<script src="/angular/angular.min.js" type="text/javascript"></script>
<script>

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

</script>
