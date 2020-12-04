<?php
	$host = "ec2-75-101-212-64.compute-1.amazonaws.com";
	$user = "ghsgziqtqwxxvu";
	$pass = "54cc0317080f0d222757579a6688eb67e5951040c04604a1d97276c892742c7b";
	$port = "5432";
	$dbname = "d2ptmso1fkpds4";
	$conn = pg_connect("host=".$host." port=".$port." dbname=".$dbname." user=".$user." password=".$pass) or die("Gagal");
?>
