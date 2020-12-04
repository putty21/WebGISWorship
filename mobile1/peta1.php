<!DOCTYPE html>
<html>
<head>
<meta name='viewport' content='initial-scale=1.0, user-scalable=no' /><style type='text/css'> 
html { height: 100%;width: 100% } 
body { height: 100%; width: 100%; margin: 0px; padding: 0px }
#map { height: 100%; width: 100% }
</style>
<script src="http://code.jquery.com/jquery.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/jquery.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBh7Xfdh42Ro9CNFPkvoZhFVhEpTeOP16g"></script>
<script src="../assets/js/GeoJSON.js"></script>
<script src='http://code.jquery.com/jquery-1.11.0.min.js' type='text/javascript'>
</script> 
<? 
$lat = $_GET['lat']; $lng = $_GET['lng']; $rad = $_GET['rad'];
?>

	<script type='text/javascript'>
	var server = '../';
	var circles=[];
			function init()
			{
				google.maps.visualRefresh = true;
			    map = new google.maps.Map(document.getElementById('map'), 
			    {
			      zoom: 12,
			      center: new google.maps.LatLng(-0.304820, 100.381421),
			      mapTypeId: google.maps.MapTypeId.ROADMAP
			    });
				aktifkanRadiusSekitar();
				kecamatan = new google.maps.Data();
    kecamatan.loadGeoJson(server+'kecamatan.php');
    kecamatan.setStyle(function(feature)
    {
      var gid = feature.getProperty('id');
      if (gid == 1){ color = '#ff3300' 
        return({
      fillColor:color,
          strokeWeight:2.0,
          strokeColor:'red',
          fillOpacity:0.3,
          clickable: false
        }); 
    }
      else if(gid == 2){ color = '#ffd777' 
        return({
        fillColor:color,
          strokeWeight:2.0,
          strokeColor:'blue',
          fillOpacity:0.3,
          clickable: false
        });
    }
      else if(gid == 3){ color = '#00b300' 
        return({
        fillColor:color,
          strokeWeight:2.0,
          strokeColor:'yellow',
          fillOpacity:0.3,
          clickable: false
        });

    }
    });
    kecamatan.setMap(map);
	
	ti = new google.maps.Data();
            ti.loadGeoJson(server+'masjid.php');
            ti.setStyle(function(feature){
            return({
                    fillColor: '#68dff0',
                    strokeColor: '#68dff0',
                    strokeWeight: 1,
                    fillOpacity: 0.6
                   });          
              });
            ti.setMap(map);
			}
			
			
		function aktifkanRadiusSekitar(){
          var pos = new google.maps.LatLng(<?PHP echo $lat; ?>, <?PHP echo $lng; ?>);
          map.setCenter(pos);
          map.setZoom(16);     
          hapusRadius();
		  rad_lat=<?PHP echo $lat; ?>;
		  rad_lng=<?PHP echo $lng; ?>;
          var inputradius1=<?PHP echo $rad; ?>;
		  console.log(inputradius1);
          var rad = parseFloat(inputradius1*50);
          var circle = new google.maps.Circle({
            center: pos,
            radius: rad,      
            map: map,
            strokeColor: "blue",
            strokeOpacity: 0.5,
            strokeWeight: 1,
            fillColor: "blue",
            fillOpacity: 0.35
          });        
          circles.push(circle); 
console.log('aada');	

			if (document.getElementById('check_t').checked) {
            owsekitar(rad_lat,rad_lng,rad);
			} 
			
			if (document.getElementById('check_h').checked) {
            hotelsekitar(rad_lat,rad_lng,rad);
			}
			
			if (document.getElementById('check_i').checked) {
            industrisekitar(rad_lat,rad_lng,rad);
			} 

			if (document.getElementById('check_oo').checked) {
            oleholehsekitar(rad_lat,rad_lng,rad);
			} 

			if (document.getElementById('check_k').checked) {
            kulinersekitar(rad_lat,rad_lng,rad);
			}  
			
			 
             

        }
		
function oleholehsekitar(latitude,longitude,rad){ // OLEH OLEH SEKITAR MASJID

          $.ajax({url: server+'carioleholeh.php?lat='+latitude+'&long='+longitude+'&rad='+rad, data: "", dataType: 'json', success: function(rows){ 
            for (var i in rows){ 
              var row = rows[i];
              var id_oleh_oleh = row.id_oleh_oleh;
              var nama_oleh_oleh = row.nama_oleh_oleh;
              var cp = row.cp;
              var pemilik = row.pemilik;
              var alamat = row.alamat;
              var produk = row.produk;
              var harga_barang = row.harga_barang;
              var syarat_menginap = row.syarat_men;
              var id_status_tempat = row.id_status_tempat;
			  var jumlah_karyawan = row.jumlah_karyawan;
              var lat=row.latitude;
              var lon = row.longitude;
			  console.log(nama_oleh_oleh);
              
              //POSISI MAP
              centerBaru = new google.maps.LatLng(lat, lon);
              map.setCenter(centerBaru);
              map.setZoom(16);  
              var marker = new google.maps.Marker({
                position: centerBaru,              
                icon:'assets/ico/shopping.png',
                animation: google.maps.Animation.DROP,
                map: map
                });
              markersDua.push(marker);
              map.setCenter(centerBaru);
			 
			 //INFO WINDOW
        // marker.info = new google.maps.InfoWindow({
          // content: "<bold>"+nama+"",
          // pixelOffset: new google.maps.Size(0, -1)
            // });
          // marker.info.open(map, marker);

            }//end for
          }});//end ajax 
        }
		
		function kulinersekitar(latitude,longitude,rad){ // KULINER SEKITAR MASJID

          $.ajax({url: server+'carikuline.php?lat='+latitude+'&long='+longitude+'&rad='+rad, data: "", dataType: 'json', success: function(rows){ 
            for (var i in rows){ 
              var row = rows[i];
              var gid = row.gid;
              var nama_kulin = row.nama_kulin;
              var alamat = row.alamat;
              var cp = row.cp;
              var menu_spesi = row.menu_spesi;
              var jam_buka = row.jam_buka;
              var jam_tutup = row.jam_tutup;
              var kapasitas = row.kapasitas;
              var fasilitas = row.fasilitas;
			  var harga = row.harga;
			  var jml_karyaw = row.jml_karyaw;
			  var status_ser = row.status_ser;
              var lat=row.latitude;
              var lon = row.longitude;
			  console.log(nama_kulin);
              
              //POSISI MAP
              centerBaru = new google.maps.LatLng(lat, lon);
              map.setCenter(centerBaru);
              map.setZoom(16);  
              var marker = new google.maps.Marker({
                position: centerBaru,              
                icon:'assets/ico/restaurants.png',
                animation: google.maps.Animation.DROP,
                map: map
                });
              markersDua.push(marker);
              map.setCenter(centerBaru);
			 
			 //INFO WINDOW
        // marker.info = new google.maps.InfoWindow({
          // content: "<bold>"+nama+"",
          // pixelOffset: new google.maps.Size(0, -1)
            // });
          // marker.info.open(map, marker);

            }//end for
          }});//end ajax 
        }

function hotelsekitar(latitude,longitude,rad){ // HOTEL SEKITAR MASJID

          $.ajax({url: server+'carihotel.php?lat='+latitude+'&long='+longitude+'&rad='+rad, data: "", dataType: 'json', success: function(rows){ 
            for (var i in rows){ 
              var row = rows[i];
              var id_hotel = row.id_hotel;
              var nama = row.nama;
              var alamat = row.alamat;
              var cp = row.contact_pe;
              var fasilitas = row.fasilitas;
              var tipe_kamar = row.tipe_kamar;
              var harga = row.harga;
              var syarat_menginap = row.syarat_men;
              var keterangan = row.keterangan;
              var lat=row.latitude;
              var lon = row.longitude;
			  console.log(nama);
              
              //POSISI MAP
              centerBaru = new google.maps.LatLng(lat, lon);
              map.setCenter(centerBaru);
              map.setZoom(16);  
              var marker = new google.maps.Marker({
                position: centerBaru,              
                icon:'assets/ico/hotels.png',
                animation: google.maps.Animation.DROP,
                map: map
                });
              markersDua.push(marker);
              map.setCenter(centerBaru);
			 
			 //INFO WINDOW
        // marker.info = new google.maps.InfoWindow({
          // content: "<bold>"+nama+"",
          // pixelOffset: new google.maps.Size(0, -1)
            // });
          // marker.info.open(map, marker);

            }//end for
          }});//end ajax  
        }

		function industrisekitar(latitude,longitude,rad){ // INDUSTRI SEKITAR MASJID
          $.ajax({url: server+'cariindustri.php?lat='+latitude+'&long='+longitude+'&rad='+rad, data: "", dataType: 'json', success: function(rows){ 
            for (var i in rows){ 
              var row = rows[i];
              var id_industri = row.id_industri;
              var nama_industri = row.nama_industri;
              var cp = row.cp;
              var pemilik = row.pemilik;
              var alamat = row.alamat;
              var produk = row.produk;
              var harga_barang = row.harga_barang;
              var syarat_menginap = row.syarat_men;
              var id_status_tempat = row.id_status_tempat;
			  var jumlah_karyawan = row.jumlah_karyawan;
              var lat=row.latitude;
              var lon = row.longitude;
			  console.log(nama_industri);
              
              //POSISI MAP
              centerBaru = new google.maps.LatLng(lat, lon);
              map.setCenter(centerBaru);
              map.setZoom(16);  
              var marker = new google.maps.Marker({
                position: centerBaru,              
                icon:'assets/ico/industries.png',
                animation: google.maps.Animation.DROP,
                map: map
                });
              markersDua.push(marker);
              map.setCenter(centerBaru);
			 
			 //INFO WINDOW
        // marker.info = new google.maps.InfoWindow({
          // content: "<bold>"+nama+"",
          // pixelOffset: new google.maps.Size(0, -1)
            // });
          // marker.info.open(map, marker);

            }//end for
          }});//end ajax  
        }
		
		function hapusRadius(){
  for(var i=0;i<circles.length;i++)
               {
                   circles[i].setMap(null);
               }
    circles=[];
  cekRadiusStatus = 'off';
  }
  
		
		</script>

</head>
<body onload='init()'> 
<div id='map'></div>
</body>
</html>