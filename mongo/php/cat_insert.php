<?php 
	require 'dbconnection.php';
	$collection = $db->selectCollection('category');
	$collection->insert([
		'title'=>$_POST['cat']
	]
	);
?>