<?php
	$host = "localhost";
	$user = "postgres";
	$pass = "postgres";
	$port = "5432";
	$dbname = "worship_place";
	$conn = pg_connect("host=".$host." port=".$port." dbname=".$dbname." user=".$user." password=".$pass) or die("Gagal");
?>