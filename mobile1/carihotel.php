<?php

	include('connect.php');
    $latit = $_GET['lat'];
    $longi = $_GET['long'];
	$rad=$_GET['rad'];

	$querysearch="SELECT gid, nama_hotel, alamat, contact_pe, fasilitas, tipe_kamar, harga, syarat_men, keterangan, st_x(st_centroid(geom)) as lng, st_y(st_centroid(geom)) as lat, st_distance_sphere(ST_GeomFromText('POINT(".$longi." ".$latit.")',-1), geom) as jarak FROM hotel_region where st_distance_sphere(ST_GeomFromText('POINT(".$longi." ".$latit.")',-1), geom) <= ".$rad.""; 

	$hasil=pg_query($querysearch);

        while($baris = pg_fetch_array($hasil))
            {
                $gid=$baris['gid'];
                $nama_hotel=$baris['nama_hotel'];
                $alamat=$baris['alamat'];
                $cp=$baris['contact_pe'];
                $fasilitas=$baris['fasilitas'];
                $tipe_kamar=$baris['tipe_kamar'];
                $harga=$baris['harga'];
                $syarat_menginap=$baris['syarat_men'];
                $keterangan=$baris['keterangan'];
                $latitude=$baris['lat'];
                $longitude=$baris['lng'];
                $dataarray[]=array('gid'=>$gid,'nama'=>$nama_hotel,'alamat'=>$alamat,'contact_pe'=>$cp, 'fasilitas'=>$fasilitas, 'tipe_kamar'=>$tipe_kamar, 'harga'=>$harga, 'syarat_men'=>$syarat_menginap, 'keterangan'=>$keterangan,  "latitude"=>$latitude,"longitude"=>$longitude);
            }
            echo json_encode ($dataarray);
?>