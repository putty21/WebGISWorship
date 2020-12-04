<?php

	include('connect.php');
    $latit = $_GET['lat'];
    $longi = $_GET['long'];
	$rad=$_GET['rad'];

	$querysearch="SELECT id, nama, lokasi, jam_buka, jam_tutup, biaya, fasilitas, keterangan, st_x(st_centroid(geom)) as lng, st_y(st_centroid(geom)) as lat, st_distance_sphere(ST_GeomFromText('POINT(".$longi." ".$latit.")',-1), geom) as jarak FROM objekwisata where st_distance_sphere(ST_GeomFromText('POINT(".$longi." ".$latit.")',-1), geom) <= ".$rad.""; 

	$hasil=pg_query($querysearch);

        while($baris = pg_fetch_array($hasil))
            {
                $id=$baris['id'];
                $nama=$baris['nama'];
                $lokasi=$baris['lokasi'];
                $jam_buka=$baris['jam_buka'];
                $jam_tutup=$baris['jam_tutup'];
                $biaya=$baris['biaya'];
                $fasilitas=$baris['fasilitas'];
                $keterangan=$baris['keterangan'];
                $latitude=$baris['lat'];
                $longitude=$baris['lng'];
                $dataarray[]=array('id'=>$id,'nama'=>$nama,'lokasi'=>$lokasi,'jam_buka'=>$jam_buka, 'jam_tutup'=>$jam_tutup, 'biaya'=>$biaya, 'fasilitas'=>$fasilitas, 'keterangan'=>$keterangan, "latitude"=>$latitude,"longitude"=>$longitude);
            }
            echo json_encode ($dataarray);
?>