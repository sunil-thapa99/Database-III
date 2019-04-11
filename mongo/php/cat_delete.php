<?php 
	require 'dbconnection.php';
	$id=$_POST['cat_id'];
	$connection=$db->selectCollection('category');
	$res = $collection->remove(['_id'=> new MongoId($id)]);
?>