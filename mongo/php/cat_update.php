<?php 
	require 'dbconnection.php';
	$id = $_POST['cat_id'];
	$new = $_POST['new_cat'];
	$collection = $db->selectCollection('category');
	$res = $collection->update(
		[
			'_id'=>new MongoId($id)
		],
		[	
			'$set'=>array("title"=>$new)
		]
	);
?>