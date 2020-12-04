<?php

	include('connect.php');
    $latit = $_GET['lat'];
    $longi = $_GET['long'];
	$rad=$_GET['rad'];

	$querysearch="SELECT gid, nama_kulin, alamat, cp, menu_spesi, jam_buka, jam_tutup, kapasitas, fasilitas, harga, jml_karyaw, status_ser, id_kat, st_x(st_centroid(geom)) as lng, st_y(st_centroid(geom)) as lat, st_distance_sphere(ST_GeomFromText('POINT(".$longi." ".$latit.")',-1), geom) as jarak FROM rm where st_distance_sphere(ST_GeomFromText('POINT(".$longi." ".$latit.")',-1), geom) <= ".$rad.""; 

	$hasil=pg_query($querysearch);

        while($baris = pg_fetch_array($hasil))
            {
                $gid=$baris['gid'];
                $nama_kulin=$baris['nama_kulin'];
				$alamat=$baris['alamat'];
                $cp=$baris['cp'];
                $menu_spesi=$baris['menu_spesi'];
                $jam_buka=$baris['jam_tutup'];
                $kapasitas=$baris['kapasitas'];
                $fasilitas=$baris['fasilitas'];
                $harga=$baris['harga'];
                $jml_karyaw=$baris['jml_karyaw'];
				$status_ser=$baris['status_ser'];
				$id_kat=$baris['id_kat'];
                $latitude=$baris['lat'];
                $longitude=$baris['lng'];
                $dataarray[]=array('gid'=>$gid,'nama_kulin'=>$nama_kulin, 'alamat'=>$alamat, 'cp'=>$cp,'menu_spesi'=>$menu_spesi, 'jam_buka'=>$jam_buka, 'jam_tutup'=>$jam_tutup, 'kapasitas'=>$kapasitas, 'fasilitas'=>$fasilitas, 'harga'=>$harga, 'jml_karyaw'=>$jml_karyaw, 'status_ser'=>$status_ser, 'id_kat'=>$id_kat,  "latitude"=>$latitude,"longitude"=>$longitude);
            }
            echo json_encode ($dataarray);
?>