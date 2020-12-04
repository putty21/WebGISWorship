<?php
	$host = "localhost";
	$user = "postgres";
	$pass = "14juni";
	$port = "5432";
	$dbname = "tebe";
	$conn = pg_connect("host=".$host." port=".$port." dbname=".$dbname." user=".$user." password=".$pass) or die("Gagal");
?>
