<?php
	require 'dbconnection.php';
	$collection = $db->selectCollection('user');
	$username = $_POST['user'];
	$password = $_POST['pass'];
	$select = $collection->findOne([
		'$or'=>[['username'=>$username], ['email'=>$username]],
		'password'=>$password]
	);
?>