<?php

	include('connect.php');
    $latit = $_GET['lat'];
    $longi = $_GET['long'];
	$rad=$_GET['rad'];

	$querysearch="SELECT id_oleh_oleh, nama_oleh_oleh, pemilik, cp, alamat, produk, harga_barang, id_status_tempat, jumlah_karyawan, st_x(st_centroid(geom)) as lng, st_y(st_centroid(geom)) as lat, st_distance_sphere(ST_GeomFromText('POINT(".$longi." ".$latit.")',-1), geom) as jarak FROM oleholeh where st_distance_sphere(ST_GeomFromText('POINT(".$longi." ".$latit.")',-1), geom) <= ".$rad.""; 

	$hasil=pg_query($querysearch);

        while($baris = pg_fetch_array($hasil))
            {
                $id_oleh_oleh=$baris['id_oleh_oleh'];
                $nama_oleh_oleh=$baris['nama_oleh_oleh'];
                $pemilik=$baris['pemilik'];
                $cp=$baris['cp'];
                $alamat=$baris['alamat'];
                $produk=$baris['produk'];
                $harga_barang=$baris['harga_barang'];
                $id_status_tempat=$baris['id_status_tempat'];
                $jumlah_karyawan=$baris['jumlah_karyawan'];
                $latitude=$baris['lat'];
                $longitude=$baris['lng'];
                $dataarray[]=array('id_oleh_oleh'=>$id_oleh_oleh,'nama_oleh_oleh'=>$nama_oleh_oleh,'pemilik'=>$pemilik,'cp'=>$cp, 'alamat'=>$alamat, 'produk'=>$produk, 'harga_barang'=>$harga_barang, 'id_status_tempat'=>$id_status_tempat, 'jumlah_karyawan'=>$jumlah_karyawan,  "latitude"=>$latitude,"longitude"=>$longitude);
            }
            echo json_encode ($dataarray);
?>