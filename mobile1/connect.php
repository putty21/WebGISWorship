<?php
	$host = "localhost";
	$user = "postgres";
	$pass = "postgres";
	$port = "5432";
	$dbname = "tempatibadah";
	$conn = pg_connect("host=".$host." port=".$port." dbname=".$dbname." user=".$user." password=".$pass) or die("Gagal");
?>