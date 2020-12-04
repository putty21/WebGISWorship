var infoDua = [];
var markers = [];
var markersDua = [];
var markersDua1 = [];
var circles=[];
var angkot = [];
var jalurAngkot=[];
var rute = [];  //NAVIGASI
var pos ='null';
var infowindow;
var centerBaru;
var centerLokasi;
var fotosrc = 'foto/';
var directionsDisplay;
var marker_1 = []; //MARKER UNTUK POSISI SAAT INIvar marker_2 = []; //MARKER UNTUK POSISI SAAT INI
var marker_2 = [];
var map;
var awal = 0;
var tujuan = 0;
var server = "https://iisi-webgisworship-puty.herokuapp.com/";
var markersReal = []; //HIMPUNAN MARKER

var cekRadiusStatus = "off";
function init(){
    $('#result').hide();
    basemap();
    tempatibadah();
    kecamatanTampil();
}

function basemap() //google maps
{

    map = new google.maps.Map(document.getElementById('map'),
        {
          zoom: 13,
          center: new google.maps.LatLng(-0.304820, 100.381421),
          mapTypeId: google.maps.MapTypeId.ROADMAP,
        });
}

function aktifkanGeolocation(){ //posisi saat ini
        google.maps.event.clearListeners(map, 'click');
        navigator.geolocation.getCurrentPosition(function(position)
        {
          pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude};
          koordinat = {
            lat: position.coords.latitude,
            lng: position.coords.longitude };

          centerBaru = new google.maps.LatLng(koordinat.lat, koordinat.lng);
          centerLokasi = centerBaru;
          map.setCenter(centerBaru)
          map.setZoom(15);
          
          var marker = new google.maps.Marker({
                    position: koordinat,
                    animation: google.maps.Animation.DROP,
                    map: map});

          marker.info = new google.maps.InfoWindow({
              content: "<center><a style='color:black;'>You're Here <br> lat : "+koordinat.lat+" <br> long : "+koordinat.lng+"</a></center>",
              pixelOffset: new google.maps.Size(0, -1)
                });
              marker.info.open(map, marker);
              markersReal.push(marker);

          rad_lat = koordinat.lat;
          rad_lng = koordinat.lng;
           document.getElementById('myLatLocation').value = koordinat.lat;
          document.getElementById('myLngLocation').value = koordinat.lng;
          a =  document.getElementById('myLngLocation').value = koordinat.lng;
  
          console.log(a);
          console.log(rad_lat);
          console.log(rad_lng);
        })
          }

function manualLocation(){ //posisi manual
  hapusRadius();
  for (var i = 0; i < markers.length; i++) {
          markers[i].setMap(null);       
        }
  for (var i = 0; i < markersReal.length; i++) {
          markersReal[i].setMap(null);       
  }
  alert('Click the map');
  map.addListener('click', function(event) {
    addMarker(event.latLng);
    });
  }

    function addMarker(location){
    hapusposisi();
    marker = new google.maps.Marker({
      position : location,
      map: map,
      animation: google.maps.Animation.DROP,
      });
    pos = {
      lat: location.lat(), lng: location.lng()
    }
    centerLokasi = new google.maps.LatLng(pos.lat, pos.lng);
    markers.push(marker);
    infowindow = new google.maps.InfoWindow();
    infowindow.setContent('Current Position');
    infowindow.open(map, marker);
    usegeolocation=true;
    google.maps.event.clearListeners(map, 'click');
  console.log(pos);

}

function aktifkanRadius(){ //fungsi radius mesjid
    if (pos == 'null'){
    alert ('Click button current position or manual position first !');
    }
    else {
    hapusRadius();
    var inputradiusmes=document.getElementById("inputradiusmes").value;
  console.log(inputradiusmes);
    var circle = new google.maps.Circle({
      center: pos,
      radius: parseFloat(inputradiusmes*100),
      map: map,
      strokeColor: "blue",
      strokeOpacity: 0.8,
      strokeWeight: 2,
      fillColor: "blue",
      fillOpacity: 0.35
      });
      map.setZoom(14);
      map.setCenter(pos);
      circles.push(circle);
    }
    cekRadiusStatus = 'on';
    masjidradius();
  }

  function aktifkanRadiusAngkot(){ //fungsi radius angkot
  console.log("hai")
    if (pos == 'null'){
    alert ('Click button current position or manual position first !');
    }
    else {
    hapusRadius();
    var inputradiusangkot=document.getElementById("inputradiusangkot").value;
  console.log(inputradiusangkot);
    var circle = new google.maps.Circle({
      center: pos,
      radius: parseFloat(inputradiusangkot*100),
      map: map,
      strokeColor: "red",
      strokeOpacity: 0.8,
      strokeWeight: 2,
      fillColor: "red",
      fillOpacity: 0.35
      });
      map.setZoom(14);
      map.setCenter(pos);
      circles.push(circle);
    }
    cekRadiusStatus = 'on';
    angkotradius();
  }


 function masjidradius(){ //menampilkan masjid berdasarkan radius
        $('#hasilcari1').show();
    $('#hasilcari').empty();
      hapusInfo();
      clearroute2();
    clearroute();
    clearangkot();
      hapusMarkerTerdekat();
      hapusMarkerTerdekat1();
      cekRadius();
      console.log(pos.lat);
      console.log(pos.lng);
        $.ajax({
        url: server+'masjidradius.php?lat='+pos.lat+'&lng='+pos.lng+'&rad='+rad, data: "", dataType: 'json', success: function(rows)
        {
            console.log("hy");
            for (var i in rows)
            {
              var row     = rows[i];
              var id   = row.id;
              var nama   = row.name;
              var latitude  = row.lat ;
              var longitude = row.lng ;
              centerBaru = new google.maps.LatLng(latitude, longitude);
              var marker = new google.maps.Marker({
                position: centerBaru,
                icon:'assets/ico/marker_masjid.png',
                map: map,
                animation: google.maps.Animation.DROP,
              });
              console.log(nama);
              markersDua.push(marker);
              klikInfoWindow(id,marker);
              map.setCenter(centerBaru);
              map.setZoom(14);
              $('#hasilcari').append("<tr><td>"+nama+"</td><td><a role='button' title='info' class='btn btn-success fa fa-info' onclick='detailmasjid(\""+id+"\");info1();'></a></td><td><a role='button' class='btn btn-success fa fa-bus' title='Local Transportation' onclick='angkotmesjid(\""+id+"\",\""+latitude+"\",\""+longitude+"\");info12();'></a></td></tr>");
            }
            }
          });
}

function angkotradius(){

       $('#hasilcari1').show();
    $('#hasilcari').empty();
    $('#hasilcari').append("<tr><th class='centered'>Major</th><th class='centered'>Local Transportation</th></tr>");
      hapusInfo();
      clearroute2();
    clearroute();
    clearangkot();
      hapusMarkerTerdekat();
        cekRadiusangkot();
        hapusMarkerTerdekat();
        hapusInfo();

        console.log(pos.lat);
        console.log(pos.lng);
        console.log(rad);
        $.ajax({
          url: server+'angkotradius.php?lat='+pos.lat+'&lng='+pos.lng+'&rad='+rad, data: "", dataType: 'json', success: function(rows)
          {

            for (var i in rows)
            {
              var row     = rows[i];
              var id_angkot   = row.id;
              var jurusan   = row.destination;
              var jalur_angkot   = row.track;
              var latitude  = row.latitude;
              var longitude = row.longitude ;
              console.log(jurusan);
              centerBaru      = new google.maps.LatLng(latitude, longitude);
             $('#hasilcari').append("<tr><td>"+jurusan+"</td><td><a role='button' class='btn btn-success fa fa-bus' onclick='data_angkot_1_rute(\""+id_angkot+"\")'></a></td></tr>");
              }
            }
          });
        }

function tampilsemua(){ //menampilkan semua masjid
  $('#populer').hide();
  $.ajax({ url: server+'carimasjid.php', data: "", dataType: 'json', success: function (rows){
    cari_masjid(rows);
  }});
}

//cari berdasarkan nama masjid
function carinamamasjid(){
  if(carimasjid.value==''){
    alert("Fill the input form first!");
    }else{

    $.ajax({ url: server+'carimasjid.php?cari_nama='+carimasjid.value, data: "", dataType: 'json', success: function (rows){
      cari_masjid(rows);
    }});
  }
}

function carinamaresangkot(){
  if(cariress.value==''){
    alert("Fill the input form first!");
    }else{

    $.ajax({ url: server+'cariresangkot.php?cari_nama='+cariress.value, data: "", dataType: 'json', success: function (rows){
      cari_resutkangkot(rows);
    }});
  }
}


  function caritglk(rows) //fungsi cari event berdasarkan date
  {
     $('#hasilcari1').show();
     $('#hasilcari').show();
     $('#hasilcari').empty();
   $('#hasilcari').append("<tr><th class='centered'>Mosque</th><th class='centered'>Event</th><th class='centered'>Info</th><th class='centered'>Route LT</th></tr>");
      hapusInfo();
      clearroute2();
    clearroute();
    hapusRadius();
    clearangkot();
      hapusMarkerTerdekat();
    var mesjidevent=[''];
            if(rows==null)
            {
              alert('No Data');
            }
        for (var i in rows)
        {
          var row     = rows[i];
          var id   = row.id_worship_place;
          var nama_keg   = row.event_name;
          var nama_mes = row.worship_place_name;
          var date = row.date;
          var time = row.time;
           var latitude  = row.latitude ;
        var longitude = row.longitude ;
        console.log(id);
        console.log(date);
        mesjidevent.push(row.id_worship_place);
              centerBaru = new google.maps.LatLng(latitude, longitude);
              map.setCenter(centerBaru);
              map.setZoom(14);
              var marker = new google.maps.Marker({
               position: centerBaru,
               icon:'assets/ico/marker_masjid.png',
               animation: google.maps.Animation.DROP,
               map: map
                });
              markersDua.push(marker);
              map.setCenter(centerBaru);


          $('#hasilcari').append("<tr><td>"+nama_mes+"</td><td>"+nama_keg+"</td><td><a role='button' title='detail event' class='btn btn-success fa fa-info' onclick='detailevent(\""+id+"\", \""+time+"\", \""+date+"\");infoev();'></a></td><td><a role='button' class='btn btn-success fa fa-bus' title='Local Transportation' onclick='angkotmesjid(\""+id+"\",\""+latitude+"\",\""+longitude+"\");info12();'></a></td></tr>");

          console.log("auuu");
        }
$.ajax({ url: server+'caritglkeg.php?id_worship_place='+mesjidevent, data: "", dataType: 'json', success: function (rows){
    console.log("huuuuu");
      console.log(server+'caritglkeg.php?id_worship_place='+mesjidevent);
    for (var i in rows)
        {
          var row     = rows[i];
           var latitude  = row.latitude ;
        var longitude = row.longitude ;
              centerBaru = new google.maps.LatLng(latitude, longitude);
              map.setCenter(centerBaru);
              map.setZoom(12);
              var marker = new google.maps.Marker({
               position: centerBaru,
               icon:'assets/ico/66.png',
               animation: google.maps.Animation.DROP,
               map: map
                });
              markersDua.push(marker);
              map.setCenter(centerBaru);
        }
  }})
  }

  //memunculkan info ketika di klik marker
function klikInfoWindow(id)
{
    google.maps.event.addListener(marker, "click", function(){
        detailmes_infow(id);
      });

}

function klikInfoWindow_ow(id)
{
    google.maps.event.addListener(marker, "click", function(){
        detailow_infow(id);

      });

}

function klikInfoWindow_industri(id)
{
    google.maps.event.addListener(marker, "click", function(){
        detailindustri_infow(id);

      });

}

function klikInfoWindow_oleh(id)
{
    google.maps.event.addListener(marker, "click", function(){
        detailoleh_infow(id);

      });

}

function klikInfoWindow_kuliner(id)
{
    google.maps.event.addListener(marker, "click", function(){
        detailkuliner_infow(id);

      });

}

function klikInfoWindow_hotel(id)
{
    google.maps.event.addListener(marker, "click", function(){
        detailhotel_infow(id);

      });

}

function klikInfoWindow_res(id)
{
    google.maps.event.addListener(marker, "click", function(){
        detailres_infow(id);

      });

}

function tempatibadah() //tampil digitasi tempat ibadah
    {
            ti = new google.maps.Data();
            ti.loadGeoJson(server+'masjid.php');
            ti.setStyle(function(feature){
            return({
                    fillColor: '#2a9dd6',
                    strokeColor: '#2a9dd6',
                    strokeWeight: 1,
                    fillOpacity: 7
                   });
              });
            ti.setMap(map);
        }

function kecamatanTampil()
  {
    kecamatan = new google.maps.Data();
    kecamatan.loadGeoJson(server+'kecamatan.php');
    kecamatan.setStyle(function(feature)
    {
      var gid = feature.getProperty('id');
      if (gid == 'K001'){ color = '#ff3300'
        return({
      fillColor:color,
          strokeWeight:2.0,
          strokeColor:'black',
          fillOpacity:0.3,
          clickable: false
        });
    }
      else if(gid == 'K002'){ color = '#ffd777'
        return({
        fillColor:color,
          strokeWeight:2.0,
          strokeColor:'black',
          fillOpacity:0.3,
          clickable: false
        });
    }
      else if(gid == 'K003'){ color = '#ec87ec'
        return({
        fillColor:color,
          strokeWeight:2.0,
          strokeColor:'black',
          fillOpacity:0.3,
          clickable: false
        });

    }



    });
    kecamatan.setMap(map);
  }

function tempatibadah() //tampil digitasi tempat ibadah
    {
            ti = new google.maps.Data();
            ti.loadGeoJson(server+'masjid.php');
            ti.setStyle(function(feature){
            return({
                    fillColor: '#42cb6f',
                    strokeColor: '#42cb6f',
                    strokeWeight: 1,
                    fillOpacity: 7
                   });
              });
            ti.setMap(map);
        }

function ow() //tampil digitasi objek wisata
    {
            ow = new google.maps.Data();
            ow.loadGeoJson(server+'ow.php');
            ow.setStyle(function(feature){
            return({
                    fillColor: '#f18989',
                    strokeColor: '#f18989',
                    strokeWeight: 1,
                    fillOpacity: 0.6
                   });
              });
            ow.setMap(map);
        }


  function caritpkec() //fungsi cari mesjid berdasarkan kecamatan
  {


    var kec=document.getElementById('kecamatan').value;
    $('#hasilcari1').show();
    $('#hasilcari').empty();
      hapusInfo();
      clearroute2();
    clearroute();
    clearangkot();
  hapusRadius();
      hapusMarkerTerdekat();
    //var kecamatan= kec.value;
    $.ajax({
        url: server+'kecamatan_tp.php?kecamatan='+kec, data: "", dataType: 'json', success: function(rows)
          {
            if(rows==null)
            {
              alert('Data Tidak Ditemukan');
            }
          for (var i in rows)
            {
              var row     = rows[i];
              var id   = row.id;
              var nama   = row.name;
              var latitude  = row.latitude ;
              var longitude = row.longitude ;
              centerBaru = new google.maps.LatLng(latitude, longitude);
              marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/marker_masjid.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
              map.setCenter(centerBaru);
        klikInfoWindow(id);
              map.setZoom(14);
              $('#hasilcari').append("<tr><td>"+nama+"</td><td><a role='button' title='info' class='btn btn-success fa fa-info' onclick='detailmasjid(\""+id+"\");info1();'></a></td><td><a role='button' class='btn btn-success fa fa-bus' title='Local Transportation' onclick='angkotmesjid(\""+id+"\",\""+latitude+"\",\""+longitude+"\");info12();'></a></td></tr>");
            }

          }
        });
  }

function carikategori()
  {

    $('#hasilcari1').show();
    $('#hasilcari').empty();
      hapusInfo();
      clearroute2();
    clearroute();
    clearangkot();
  hapusRadius();
      hapusMarkerTerdekat();
   var kat=id_kategori.value;
    console.log(kat);
    $.ajax({
        url: server+'carikat.php?id_kategori='+kat, data: "", dataType: 'json', success: function(rows)
          {
            console.log("hai riri");
            if(rows==null)
            {
              alert('Worship Place Not Found');
            }
          for (var i in rows)
            {
              var row     = rows[i];
              var id   = row.id;
              var nama   = row.name;
              var latitude  = row.latitude ;
              var longitude = row.longitude ;
              centerBaru = new google.maps.LatLng(latitude, longitude);
              marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/marker_masjid.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
              map.setCenter(centerBaru);
        klikInfoWindow(id);
              map.setZoom(14);
              $('#hasilcari').append("<tr><td>"+nama+"</td><td><a role='button' title='info' class='btn btn-success fa fa-info' onclick='detailmasjid(\""+id+"\");info1();'></a></td><td><a role='button' class='btn btn-success fa fa-bus' title='Local Transportation' onclick='angkotmesjid(\""+id+"\",\""+latitude+"\",\""+longitude+"\");info12();'></a></td></tr>");
            }

          }
        });
  }

  function pilihkendaraan() //fungsi cari mesjid berdasarkan kendaraaan yang digunakan
  {

    $('#hasilcari1').show();
    $('#hasilcari').empty();
      hapusInfo();
      clearroute2();
    clearroute();
    clearangkot();
  hapusRadius();
      hapusMarkerTerdekat();
    kend=pilihkend.value;

    $.ajax({
        url: server+'carikendaraan.php?status='+kend, data: "", dataType: 'json', success: function(rows)
          {
              console.log("yuhuuuuuuuu");
            if(rows==null)
            {
              alert('Worship Place Not Found !');
            }
          for (var i in rows)
            {
              var row     = rows[i];
              var id   = row.id;
              var nama   = row.name;
              var latitude  = row.latitude ;
              var longitude = row.longitude ;
              centerBaru = new google.maps.LatLng(latitude, longitude);
              marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/marker_masjid.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
            console.log(id);
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
              map.setCenter(centerBaru);
         klikInfoWindow(id);
              map.setZoom(14);
              $('#hasilcari').append("<tr><td>"+nama+"</td><td><a role='button' title='info' class='btn btn-success fa fa-info' onclick='detailmasjid(\""+id+"\");info1();'></a></td><td><a role='button' class='btn btn-success fa fa-bus' title='Local Transportation' onclick='angkotmesjid(\""+id+"\",\""+latitude+"\",\""+longitude+"\");info12();'></a></td></tr>");
            }

          }
        });
  }

  function cari_masjid(rows) //fungsi cari mesjid berdasarkan nama
  {
     $('#hasilcari1').show();
    $('#hasilcari').empty();
      hapusInfo();
      clearroute2();
    clearroute();
    clearangkot();
  hapusRadius();
      hapusMarkerTerdekat();
            if(rows==null)
            {
              alert('Mosque Not found');
            }
        for (var i in rows)
            {
              var row     = rows[i];
              var id   = row.id;
              var nama   = row.name;
              var latitude  = row.latitude ;
              var longitude = row.longitude ;
              centerBaru = new google.maps.LatLng(latitude, longitude);
              marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/marker_masjid.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
            console.log(id);
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
              map.setCenter(centerBaru);
             klikInfoWindow(id);
              map.setZoom(13);
              $('#hasilcari').append("<tr><td>"+nama+"</td><td><a role='button' title='info' class='btn btn-success fa fa-info' onclick='detailmasjid(\""+id+"\");info1();'></a></td><td><a role='button' class='btn btn-success fa fa-bus' title='Local Transportation' onclick='angkotmesjid(\""+id+"\",\""+latitude+"\",\""+longitude+"\");info12();'></a></td></tr>");
            }
            }

      function cari_resutkangkot(rows) //fungsi cari mesjid berdasarkan nama
  {
     $('#hasilcari1').show();
    $('#hasilcari').empty();
      hapusInfo();
      clearroute2();
    clearroute();
    clearangkot();
      hapusMarkerTerdekat();
            if(rows==null)
            {
              alert('Mosque Not found');
            }
        for (var i in rows)
            {
              var row     = rows[i];
              var id   = row.id;
              var nama   = row.name;
              var latitude  = row.latitude ;
              var longitude = row.longitude ;
              centerBaru = new google.maps.LatLng(latitude, longitude);
              marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/marker_masjid.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
            console.log(id);
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
              map.setCenter(centerBaru);
              map.setZoom(14);
              $('#hasilcari').append("<tr><td>"+nama+"</td><td><a role='button' title='info' class='btn btn-success fa fa-info' onclick='detailmasjid(\""+id+"\");info1();'></a></td><td><a role='button' class='btn btn-success fa fa-bus' title='Local Transportation' onclick='angkotmesjid(\""+id+"\",\""+latitude+"\",\""+longitude+"\");info12();'></a></td></tr>");
            }
            }

function angkotmesjid(id_angkot, lat1, lng1){
 $('#infoak').empty();
   hapusInfo();
      clearroute2();
    clearroute();
    clearangkot();
      hapusMarkerTerdekat();
      console.log("d");
    $('#rute1').hide();
      $('#view_data_tengah').hide();
       $('#info').empty();
       $('#rute').empty();
       clearroute2();
    $('#infoak').append("<thead><th class='centered'>Destination</th><th class='centered'>Action</th></thead>");

     $.ajax({
        url: server+'angkotmesjid.php?id='+id_angkot, data: "", dataType: 'json', success: function(rows)
          {

            if(rows==null)
            {
              alert('Urban transport route not found');
            }
          for (var i in rows)
            {
              var row     = rows[i];
              var id_angkot   = row.id_angkot;
              var jurusan   = row.destination;
              var route_color = row.route_color;
              var latitude  = row.latitude ;
              var longitude = row.longitude ;
      var lat = row.lat;
        var lng = row.lng;
        console.log(latitude);
        console.log(longitude);
              listgeom(id_angkot);
              tampilrute(id_angkot, route_color, latitude, longitude);
      centerBaru = new google.maps.LatLng(latitude, longitude);
              marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/marker_masjid.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
            console.log(id_angkot);
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
              map.setCenter(centerBaru);
              map.setZoom(13);
               $('#infoak').append("<tr><td>"+jurusan+"</td><td class='centered'><a role='button' title='Route from LT' class='btn btn-success fa fa-road' onclick='detailangkot(\""+id_angkot+"\",\""+lat+"\",\""+lng+"\",\""+lat1+"\",\""+lng1+"\")'></a></td></tr> ");
            }

          }
        });

}

function angkotkuliner(id_angkot, lat1, lng1){
 $('#infoak').empty();
   hapusInfo();
      clearroute2();
    clearroute();
    clearangkot();
      hapusMarkerTerdekat();
      console.log("d");
    $('#infoak').append("<thead><th class='centered'>Destination</th><th class='centered'>Action</th></thead>");

     $.ajax({
        url: server+'angkotkuliner.php?id='+id_angkot, data: "", dataType: 'json', success: function(rows)
          {
            if(rows==null)
            {
              alert('Urban transport route not found');
            }
          for (var i in rows)
            {
              var row     = rows[i];
              var id_angkot   = row.id_angkot;
              var jurusan   = row.destination;
              var route_color = row.route_color;
              var latitude  = row.latitude ;
              var longitude = row.longitude ;
        var lat  = row.lat ;
              var lng = row.lng ;

              listgeom(id_angkot)
              tampilrute(id_angkot, route_color, latitude, longitude);
      centerBaru = new google.maps.LatLng(latitude, longitude);
              marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/food.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
            console.log(id_angkot);
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
              map.setCenter(centerBaru);
              map.setZoom(13);
               $('#infoak').append("<tr><td>"+jurusan+"</td><td><a role='button' title='route from LT' class='btn btn-success fa fa-road' onclick='detailangkot(\""+id_angkot+"\",\""+lat+"\",\""+lng+"\",\""+lat1+"\",\""+lng1+"\")'></a></td></tr> ");
            }

          }
        });

}

function angkotindustri(id_angkot, lat1, lng1){
 $('#infoak').empty();
   hapusInfo();
      clearroute2();
    clearroute();
    clearangkot();
      hapusMarkerTerdekat();
      console.log("d");
    $('#infoak').append("<thead><th class='centered'>Destination</th><th class='centered'>Action</th></thead>");

     $.ajax({
        url: server+'angkotindustri.php?id='+id_angkot, data: "", dataType: 'json', success: function(rows)
          {
            if(rows==null)
            {
              alert('Urban transport route not found');
            }
          for (var i in rows)
            {
              var row     = rows[i];
              var id_angkot   = row.id_angkot;
              var jurusan   = row.destination;
              var route_color = row.route_color;
              var latitude  = row.latitude ;
              var longitude = row.longitude ;
        var lat  = row.lat ;
              var lng = row.lng ;

              listgeom(id_angkot)
              tampilrute(id_angkot, route_color, latitude, longitude);
      centerBaru = new google.maps.LatLng(latitude, longitude);
              marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/industries.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
            console.log(id_angkot);
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
              map.setCenter(centerBaru);
              map.setZoom(13);
               $('#infoak').append("<tr><td>"+jurusan+"</td><td><a role='button' title='route from LT' class='btn btn-success fa fa-road' onclick='detailangkot(\""+id_angkot+"\",\""+lat+"\",\""+lng+"\",\""+lat1+"\",\""+lng1+"\")'></a></td></tr> ");
            }

          }
        });

}

function angkotsouvenir(id_angkot, lat1, lng1){
 $('#infoak').empty();
   hapusInfo();
      clearroute2();
    clearroute();
    clearangkot();
      hapusMarkerTerdekat();
      console.log("d");
    $('#infoak').append("<thead><th class='centered'>Destination</th><th class='centered'>Action</th></thead>");

     $.ajax({
        url: server+'angkotsouvenir.php?id='+id_angkot, data: "", dataType: 'json', success: function(rows)
          {
            if(rows==null)
            {
              alert('Urban transport route not found');
            }
          for (var i in rows)
            {
              var row     = rows[i];
              var id_angkot   = row.id_angkot;
              var jurusan   = row.destination;
              var route_color = row.route_color;
              var latitude  = row.latitude ;
              var longitude = row.longitude ;
        var lat  = row.lat ;
              var lng = row.lng ;

              listgeom(id_angkot)
              tampilrute(id_angkot, route_color, latitude, longitude);
      centerBaru = new google.maps.LatLng(latitude, longitude);
              marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/shopping.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
            console.log(id_angkot);
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
              map.setCenter(centerBaru);
              map.setZoom(13);
               $('#infoak').append("<tr><td>"+jurusan+"</td><td><a role='button' title='route from LT' class='btn btn-success fa fa-road' onclick='detailangkot(\""+id_angkot+"\",\""+lat+"\",\""+lng+"\",\""+lat1+"\",\""+lng1+"\")'></a></td></tr> ");
            }

          }
        });

}

function angkotrestaurant(id_angkot, lat1, lng1){
 $('#infoak').empty();
   hapusInfo();
      clearroute2();
    clearroute();
    clearangkot();
      hapusMarkerTerdekat();
      console.log("d");
    $('#infoak').append("<thead><th class='centered'>Destination</th><th class='centered'>Action</th></thead>");

     $.ajax({
        url: server+'angkotrestaurant.php?id='+id_angkot, data: "", dataType: 'json', success: function(rows)
          {

            if(rows==null)
            {
              alert('Urban transport route not found');
            }
          for (var i in rows)
            {
              var row     = rows[i];
              var id_angkot   = row.id_angkot;
              var jurusan   = row.destination;
        var route_color = row.route_color;
              var latitude  = row.latitude ;
              var longitude = row.longitude ;
        var lat = row.lat;
        var lng = row.lng;
        var description = row.description;

              listgeom(id_angkot)
              tampilrute(id_angkot, route_color, latitude, longitude);
      centerBaru = new google.maps.LatLng(row.latitude, row.longitude);
            marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/restaurants.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
            console.log(id_angkot);
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
              map.setCenter(centerBaru);
              map.setZoom(14);
                $('#infoak').append("<tr><td>"+jurusan+"</td><td><a role='button' title='route from LT' class='btn btn-success fa fa-road' onclick='detailangkot(\""+id_angkot+"\",\""+lat+"\",\""+lng+"\",\""+lat1+"\",\""+lng1+"\")'></a></td></tr> ");

        /* route_sekitar(lat,lng,lat1,lng1); */

            }

          }
        });

}

function angkothotel(id_angkot, lat1, lng1){
 $('#infoak').empty();
   hapusInfo();
      clearroute2();
    clearroute();
    clearangkot();
      hapusMarkerTerdekat();
      console.log("d");
    $('#infoak').append("<thead><th class='centered'>Destination</th><th class='centered'>Action</th></thead>");

     $.ajax({
        url: server+'angkothotel.php?id='+id_angkot, data: "", dataType: 'json', success: function(rows)
          {

            if(rows==null)
            {
              alert('Urban transport route not found');
            }
          for (var i in rows)
            {
              var row     = rows[i];
              var id_angkot   = row.id_angkot;
              var jurusan   = row.destination;
        var route_color = row.route_color;
              var latitude  = row.latitude;
              var longitude = row.longitude;
        var lat = row.lat;
        var lng = row.lng;
        var description = row.description;
        console.log(latitude);
        console.log(longitude);
              listgeom(id_angkot)
              tampilrute(id_angkot, route_color, latitude, longitude);
      centerBaru = new google.maps.LatLng(row.latitude, row.longitude);
            marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/marker_hotel.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
            console.log(id_angkot);
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
              map.setCenter(centerBaru);
              map.setZoom(14);
                $('#infoak').append("<tr><td>"+jurusan+"</td><td><a role='button' title='route from LT' class='btn btn-success fa fa-road' onclick='detailangkot(\""+id_angkot+"\",\""+lat+"\",\""+lng+"\",\""+lat1+"\",\""+lng1+"\")'></a></td></tr> ");

        /* route_sekitar(lat,lng,lat1,lng1); */

            }

          }
        });

}

function angkotwisata(id_angkot, lat1, lng1){
 $('#infoak').empty();
   hapusInfo();
      clearroute2();
    clearroute();
    clearangkot();
      hapusMarkerTerdekat();
      console.log("d");
    $('#infoak').append("<thead><th class='centered'>Destination</th><th class='centered'>Action</th></thead>");

     $.ajax({
        url: server+'angkotwisata.php?id='+id_angkot, data: "", dataType: 'json', success: function(rows)
          {

            if(rows==null)
            {
              alert('Urban transport route not found');
            }
          for (var i in rows)
            {
              var row     = rows[i];
              var id_angkot   = row.id_angkot;
              var jurusan   = row.destination;
        var route_color = row.route_color;
              var latitude  = row.latitude;
              var longitude = row.longitude;
        var lat = row.lat;
        var lng = row.lng;
        var description = row.description;
        console.log(latitude);
        console.log(longitude);
              listgeom(id_angkot)
              tampilrute(id_angkot, route_color, latitude, longitude);
      centerBaru = new google.maps.LatLng(row.latitude, row.longitude);
            marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/hotels.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
            console.log(id_angkot);
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
              map.setCenter(centerBaru);
              map.setZoom(14);
                $('#infoak').append("<tr><td>"+jurusan+"</td><td><a role='button' title='route from LT' class='btn btn-success fa fa-road' onclick='detailangkot(\""+id_angkot+"\",\""+lat+"\",\""+lng+"\",\""+lat1+"\",\""+lng1+"\")'></a></td></tr> ");

        /* route_sekitar(lat,lng,lat1,lng1); */

            }

          }
        });

}

function detailangkot(id_angkot, lat, lng, lat1, lng1){
      clearroute2();
    clearangkot();
    hapusMarkerTerdekat1();
  console.log("D");
  $.ajax({
    url: server+'tampilrute.php?id_angkot='+id_angkot, data: "", dataType: 'json', success: function(rows){
       console.log("Dii");
      for (var i in rows.features){
              console.log("Diii");
        var id_angkot=rows.features[i].properties.id;
        var route_color=rows.features[i].properties.route_color;
        var latitude=rows.features[i].properties.latitude;
        var longitude=rows.features[i].properties.longitude;
        var jalur_angkot=rows.features[i].properties.track;
        var jurusan=rows.features[i].properties.destination;

        console.log(id_angkot);

        tampilrute(id_angkot, route_color,latitude, longitude);
    route_sekitar(lat,lng,lat1,lng1);

      }
      jalurAngkot.push(ja);
    }
  });
}

function listgeom(id_angkot){
        hapusInfo();
        $.ajax({
            url: server+'tampilrute.php?id_angkot='+id_angkot, data: "", dataType: 'json', success: function(rows)
            {
              arraylatlngangkot=[];
              var count=0;
              for (var i in rows.features[0].geometry.coordinates)
                {
                  for (var n in rows.features[0].geometry.coordinates[i])
                  {
                    var latlng=rows.features[0].geometry.coordinates[i][n];
                    // var latlng=rows.features[0].geometry.coordinates[i][n][0];
                    count++;
                    arraylatlngangkot.push(latlng);
                  }
                  console.log("a");
                }
              console.log(count);
              if(count%2==1){
                count++;
              }
              console.log(mid);
              var mid=count/2;
              // arraylatlngangkot[mid];
              var lat=arraylatlngangkot[mid][1];
              var lon=arraylatlngangkot[mid][0];
              var id_angkot=rows.features[0].properties.id;
              var jalur_angkot=rows.features[0].properties.track;
              var jurusan=rows.features[0].properties.destination;

           }
         });
        }

function tampilrute(id_angkot, route_color, latitude, longitude){
  console.log("ini rute");
  console.log(route_color);
  ja = new google.maps.Data();
  ja.loadGeoJson(server+'tampilrute.php?id_angkot='+id_angkot);
  ja.setStyle(function(features){
    return({
      fillColor : 'yellow',
      strokeColor: route_color,
      strokeWeight : 2,
      fillOpacity : 0.5,

    });

  });
  ja.setMap(map);
    angkot.push(ja);
    map.setZoom(14);
}
function detailmasjid(id1){  //menampilkan informasi masjid

  $('#info').empty();
  hapusall();
  hapusRadius();
  hapusMarkerTerdekat();
  hapusMarkerTerdekat1();
  hapusInfo();
  clearroute2();
  clearroute();
  clearangkot();
  console.log("hiaiii");
       $.ajax({
      url: server+'detailmasjid.php?cari='+id1, data: "", dataType: 'json', success: function(rows)
        {
          console.log(id1);
         for (var i in rows.data)
          {

            console.log('dd');
            var row = rows.data[i];
            var id = row.id;
            var nama = row.name_mesjid;
            var alamat=row.address;
            var luas_tanah=row.land_size;
            var luas_bangunan=row.building_size;
            var luas_area_parkir=row.park_area_size;
            var kapasitas=row.capacity;
            var thn_berdiri=row.est;
            var thn_renovasi_terakhir=row.last_renovation;
            var jml_imam=row.imam;
            var jml_jamaah=row.jamaah;
            var jml_remaja=row.teenager;
            var nama_kat=row.name_category;
            var image = row.image;
            var latitude  = row.latitude;
            var longitude = row.longitude ;
            centerBaru = new google.maps.LatLng(row.latitude, row.longitude);
            marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/marker_masjid.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
            map.setCenter(centerBaru);
            map.setZoom(18);
            infowindow = new google.maps.InfoWindow({
            position: centerBaru,
            content: "<span style=color:black><center><b>Information</b><br><img src='"+fotosrc+image+"' alt='image in infowindow' width='150'></center><br><i class='fa fa-home'></i> "+nama+"<br><i class='fa fa-map-marker'></i> "+alamat+"<br><center><a role='button' title='route from user' class='btn btn-success fa fa-road' value='Route' onclick='callRoute(centerLokasi, centerBaru);rutetampil();resetangkot();'></a>&nbsp<a role='button' class='btn btn-success fa fa-info' value='Gallery' onclick='galeri(\""+id+"\")' title='Info'></a>&nbsp<a class='btn btn-success fa fa-compass' role=button' onclick='pilih_sekitar_masjid(\""+id+"\",\""+latitude+"\",\""+longitude+"\")' title='Nearby' aria-controls='Nearby' id='btn_angkot'></a>&nbsp<a class='btn btn-success fa fa-location-arrow' role=button' onclick='setLastPos(\""+latitude+"\",\""+longitude+"\")' title='Location' id='btn_here'></a></center></span>",
            pixelOffset: new google.maps.Size(0, -33)
            });
          infoDua.push(infowindow);
          hapusInfo();
          infowindow.open(map);
      // //FASILITAS MASJID
   //        isi = isi + "</ol>";
   //        $('#info').append(isi);



          }


        }
      });
}
function pilih_sekitar_masjid(id1, rad_lat, rad_lng){

  $('#rute1').hide();
  $('#info').empty();
  $('#rute').empty();
  clearroute2();
  var pos = new google.maps.LatLng(rad_lat, rad_lng);
          map.setCenter(pos);
          map.setZoom(16);
          console.log(pos);
          console.log(rad_lat);
          console.log(rad_lng);
  $.ajax({
      url: server+'detailmasjid.php?cari='+id1, data: "", dataType: 'json', success: function(rows)
        {
          console.log(id1);
         for (var i in rows.data)
          {

            console.log('dd');
            var row = rows.data[i];
            var id = row.id;
            var nama = row.name_mesjid;
            var alamat=row.address;
            var luas_tanah=row.land_size;
            var luas_bangunan=row.building_size;
            var luas_area_parkir=row.park_area_size;
            var kapasitas=row.capacity;
            var thn_berdiri=row.est;
            var thn_renovasi_terakhir=row.last_renovation;
            var jml_imam=row.imam;
            var jml_jamaah=row.jamaah;
            var jml_remaja=row.teenager;
            var nama_kat=row.name_category;
            var image = row.image;
            var latitude  = row.latitude;
            var longitude = row.longitude ;
            
            $('#info').append("<tr><td><a class='btn btn-success' role=button' data-toggle='collapse' href='#terdekat1' onclick='tampil_sekitar(\""+latitude+"\",\""+longitude+"\",\""+nama+"\")' title='Nearby' aria-controls='Nearby'><i class='fa fa-compass' style='color:black;text-align:center;'></i><label>&nbsp Attraction Nearby</label></a><div class='collapse' id='terdekat1'><div class='well' style='width:auto;margin: 0px 20px 20px 20px;color:black'><div class='checkbox'><label style='float:left'><input id='check_tw' type='checkbox'>Tourism</label></div><div class='checkbox'><label style='float:left'><input id='check_i' type='checkbox'>Small Industry</label></div><div class='checkbox'><label style='float:left'><input id='check_oo' type='checkbox' value=''>Souvenir</label></div><div class='checkbox'><label style='float:left'><input id='check_k' type='checkbox' value=''>Culinary</label></div><div class='checkbox'><label style='float:left'><input id='check_h' type='checkbox' value='5'>Hotel</label></div><div class='checkbox'><label style='float:left'><input id='check_r' type='checkbox' value=''>Restaurant</label></div><label style='float:left'><b>Radius&nbsp</b></label><label style='color:black' id='km1'><b>0</b></label>&nbsp<label><b>m</b></label><br><input  type='range' onchange='cek1();aktifkanRadiusSekitar();resultt1();info1();' id='inputradius1' name='inputradius1' data-highlight='true' min='1' max='15' value='1' ></div></div></td></tr>")
           $("#view_data_tengah").show();


          }


        }
      });
       
}
function setLastPos(rad_lat, rad_lng, name){
        document.cookie = "lat_akhir"+"="+rad_lat;
        document.cookie = "lng_akhir"+"="+rad_lng;
        // alert(rad_lat);
        alert("Location is on "+rad_lat+", "+rad_lng);
      }
function detailmes_infow(id){  //menampilkan informasi masjid

  $('#info').empty();
   hapusInfo();
      clearroute2();
    clearroute();
   clearangkot();
       $.ajax({
      url: server+'detailmasjid1.php?cari='+id, data: "", dataType: 'json', success: function(rows)
        {
     console.log("hiaiii");
          console.log(id);
         for (var i in rows)
          {

            console.log('dd');
            var row = rows[i];
            var id = row.id;
            var nama = row.name_mesjid;
            var alamat=row.address;
      var image = row.image;
            var latitude  = row.latitude;
            var longitude = row.longitude ;
            centerBaru = new google.maps.LatLng(row.latitude, row.longitude);
            marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/marker_masjid.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
            map.setCenter(centerBaru);
            map.setZoom(18);
            infowindow = new google.maps.InfoWindow({
            position: centerBaru,
            content: "<span style=color:black><center><b>Information</b><br><img src='"+fotosrc+image+"' alt='image in infowindow' width='150'></center><br><i class='fa fa-home'></i> "+nama+"<br><i class='fa fa-map-marker'></i> "+alamat+"<br><a role='button' title='tracking' class='btn btn-success fa fa-car' value='Route' onclick='callRoute(centerLokasi, centerBaru);rutetampil();resetangkot();'></a>&nbsp<a role='button' title='gallery' class='btn btn-success fa fa-picture-o' value='Gallery' onclick='galeri(\""+id+"\")'></a></span>",
            pixelOffset: new google.maps.Size(0, -33)
            });
          infoDua.push(infowindow);
          hapusInfo();
          infowindow.open(map);

          }


        }
      });
}

function galeri(a){
      console.log(a);
    window.open(server+'gallery.php?idgallery='+a);
   }

function detailoleh(id1){  //menampilkan Information oleh oleh


   hapusInfo();
      clearroute2();
    clearroute();
      hapusMarkerTerdekat();
      console.log('ini souvenir');
       $.ajax({
      url: server+'detailoleh.php?cari='+id1, data: "", dataType: 'json', success: function(rows)
        {
          console.log(id1);
         for (var i in rows)
          {

            console.log('dd');
            var row = rows[i];
            var id = row.id;
            var name = row.name;
            var address=row.address;
            var owner=row.owner;
            var cp=row.cp;
            var employee=row.employee;
            var latitude  = row.latitude;
            var longitude = row.longitude ;
            centerBaru = new google.maps.LatLng(row.latitude, row.longitude);
            marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/shopping.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
            map.setCenter(centerBaru);
            map.setZoom(18);
           infowindow = new google.maps.InfoWindow({
            position: centerBaru,
            content: "<span style=color:black><center><b>Information</b></center><br><i class='fa fa-home'></i> "+name+"<br><i class='fa fa-map-marker'></i> "+address+"<br></span>",
            pixelOffset: new google.maps.Size(0, -33)
            });
          infoDua.push(infowindow);
          hapusInfo();
          infowindow.open(map);

          }


        }
      });
}

function detailoleh_infow(id){  //menampilkan Information oleh oleh

   hapusInfo();
      clearroute2();
    clearroute();
      console.log('ini souvenir');
       $.ajax({
      url: server+'detailoleh.php?cari='+id, data: "", dataType: 'json', success: function(rows)
        {
          console.log(id);
         for (var i in rows)
          {

            console.log('dd');
            var row = rows[i];
            var id = row.id;
            var name = row.name;
            var address=row.address;
            var latitude  = row.latitude;
            var longitude = row.longitude ;
            centerBaru = new google.maps.LatLng(row.latitude, row.longitude);
            marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/shopping.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
            map.setCenter(centerBaru);
            map.setZoom(18);
            infowindow = new google.maps.InfoWindow({
            position: centerBaru,
            content: "<span style=color:black><center><b>Information</b></center><br><i class='fa fa-home'></i> "+name+"<br><i class='fa fa-map-marker'></i> "+address+"<br></span>",
            pixelOffset: new google.maps.Size(0, -33)
            });
          infoDua.push(infowindow);
          hapusInfo();
          infowindow.open(map);

          }


        }
      });
}

function detailrestaurant(id1){  //menampilkan Information rm

   hapusInfo();
      clearroute2();
    clearroute();
      hapusMarkerTerdekat();
       $.ajax({
      url: server+'detailrestaurant.php?cari='+id1, data: "", dataType: 'json', success: function(rows)
        {
          console.log(id1);
         for (var i in rows)
          {

            console.log('dd');
            var row = rows[i];
            var id = row.id;
            var name = row.name;
            var address=row.address;
            var cp=row.cp;
            var open=row.open;
            var close=row.close;
            var capacity=row.capacity;
            var mushalla=row.mushalla;
            var park_area=row.park_area;
            var employee=row.employee;
            var bathroom = row.bathroom;
            var latitude  = row.latitude;
            var longitude = row.longitude ;
            centerBaru = new google.maps.LatLng(row.latitude, row.longitude);
            marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/restaurants.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
            map.setCenter(centerBaru);
            map.setZoom(18);
           infowindow = new google.maps.InfoWindow({
            position: centerBaru,
            content: "<span style=color:black><center><b>Information</b></center><br><i class='fa fa-home'></i> "+name+"<br><i class='fa fa-map-marker'></i> "+address+"<br></span>",
            pixelOffset: new google.maps.Size(0, -33)
            });
          infoDua.push(infowindow);
          hapusInfo();
          infowindow.open(map);

          }


        }
      });
}

function detailres_infow(id){  //menampilkan Information rm
   hapusInfo();
      clearroute2();
    clearroute();
        $.ajax({
      url: server+'detailrestaurant.php?cari='+id, data: "", dataType: 'json', success: function(rows)
        {
          console.log(id);
         for (var i in rows)
          {

            console.log('dd');
            var row = rows[i];
            var id = row.id;
            var name = row.name;
            var address=row.address;
            var latitude  = row.latitude;
            var longitude = row.longitude ;
            centerBaru = new google.maps.LatLng(row.latitude, row.longitude);
            marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/restaurants.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
            map.setCenter(centerBaru);
            map.setZoom(18);
            infowindow = new google.maps.InfoWindow({
            position: centerBaru,
            content: "<span style=color:black><center><b>Information</b></center><br><i class='fa fa-home'></i> "+name+"<br><i class='fa fa-map-marker'></i> "+address+"<br></span>",
            pixelOffset: new google.maps.Size(0, -33)
            });
          infoDua.push(infowindow);
          hapusInfo();
          infowindow.open(map);

          }


        }
      });
}

function detailik(id1){  //menampilkan Information rm
   hapusInfo();
      clearroute2();
    clearroute();
      hapusMarkerTerdekat();
       $.ajax({
      url: server+'detailik.php?cari='+id1, data: "", dataType: 'json', success: function(rows)
        {
          console.log(id1);
         for (var i in rows)
          {

            console.log('dd');
            var row = rows[i];
            var id = row.id;
            var name = row.name;
            var address=row.address;
            var cp=row.cp;
            var owner=row.owner;
            var employee=row.employee;
            var capacity=row.capacity;
            var latitude  = row.latitude;
            var longitude = row.longitude ;
            centerBaru = new google.maps.LatLng(row.latitude, row.longitude);
            marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/industries.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
            map.setCenter(centerBaru);
            map.setZoom(18);
         infowindow = new google.maps.InfoWindow({
            position: centerBaru,
            content: "<span style=color:black><center><b>Information</b></center><br><i class='fa fa-home'></i> "+name+"<br><i class='fa fa-map-marker'></i> "+address+"<br></span>",
            pixelOffset: new google.maps.Size(0, -33)
            });
          infoDua.push(infowindow);
          hapusInfo();
          infowindow.open(map);

          }


        }
      });
}
function modal_industry(id1){  //menampilkan Information rm
      //DATA SMALL INDUSTRY
        document.getElementById('mg_title').innerHTML="Information";
        console.log(server+'_data_small_industry_1.php?cari='+id1);
        $.ajax({url: server+'_data_small_industry_1.php?cari='+id1, data: "", dataType: 'json', success: function(rows){ 
          for (var i in rows.data){ 
            var row = rows.data[i];
            var id = row.id;
            var name = row.name;
            var owner = row.owner;
            var address = row.address;
            var cp = row.cp;
            var employee = row.employee;
            var type_industry = row.type_industry;
            var lat=row.lat;
            var lng = row.lng;
            console.log(name);
            document.getElementById('mg_body').innerHTML="<h2>"+name+"</h2><h4>"+type_industry+"</h4><br><div style='margin-left:20px'>Address: "+address+"<br>Cp: "+cp+"<br>Employee: "+employee+"<br>Industry Type: "+type_industry+"</div>";
          }//end for

          $('#modal_gallery').modal('show');
        }});//end ajax  
}
function modal_hotel(id){ // DATA HOTEL

        //DATA HOTEL
        document.getElementById('mg_title').innerHTML="Information";
        console.log(server+'_data_hotel_1.php?cari='+id);
        $.ajax({url: server+'_data_hotel_1.php?cari='+id, data: "", dataType: 'json', success: function(rows){ 
          for (var i in rows.data){ 
            var row = rows.data[i];
            var id = row.id;
            var name = row.name;
            var address = row.address;
            var cp = row.cp;
            var ktp = row.ktp;
            var marriage_book = row.marriage_book;
            var mushalla = row.mushalla;
            var type_hotel = row.type_hotel;
            var lat=row.lat;
            var lng = row.lng;

            if (mushalla == 1) {
              mushalla= "Available";
            } else {
              mushalla= "Not Available";
            }
            console.log(name);
            var syarat = "-";
            if (marriage_book == 1 && ktp == 1) {
              syarat= "Marriage Book & KTP";
            } else if (marriage_book == 1) {
              syarat= "Marriage Book";
            } else if (ktp == 1) {
              syarat= "KTP";
            }
            document.getElementById('mg_body').innerHTML="<h2>"+name+"</h2><h4>"+type_hotel+"</h4><br><div style='margin-left:20px'>Address: "+address+"<br>Cp: "+cp+"<br>Mushalla: "+mushalla+"<br>Requirement: "+syarat+"</div>";
          }//end for

          //FASILITAS HOTEL
          var isi="<br><b style='margin-left:20px'>Facility</b> <br><ol>";
          for (var i in rows.fasilitas){ 
            var row = rows.fasilitas[i];
            var id = row.id;
            var name = row.name;
            console.log(name);
            isi = isi+"<li>"+name+"</li>";
          }//end for
          isi = isi + "</ol>";
          $('#mg_body').append(isi);

          //KAMAR HOTEL
          var isi="<b style='margin-left:20px'>Room</b> <br><ol>";
          for (var i in rows.kamar){ 
            var row = rows.kamar[i];
            var id = row.id;
            var name = row.name;
            var price = row.price;
            console.log(name);
            isi = isi+"<li>"+name+" - "+price+"</li>";
          }//end for
          isi = isi + "</ol>";
          $('#mg_body').append(isi);

          $('#modal_gallery').modal('show');
        }});//end ajax  
 
      }
      function modal_kuliner(id){ //DATA KULINER

        //DATA KULINER
        document.getElementById('mg_title').innerHTML="Information";
        console.log(server+'_data_culinary_place_1.php?cari='+id);
        $.ajax({url: server+'_data_culinary_place_1.php?cari='+id, data: "", dataType: 'json', success: function(rows){ 
          for (var i in rows.data){ 
            var row = rows.data[i];
            var id = row.id;
            var name = row.name;
            var cp = row.cp;
            var address = row.address;
            var capacity = row.capacity;
            var open = row.open;
            var close = row.close;
            var employee = row.employee;
            var lat=row.lat;
            var lng = row.lng;
            console.log(name);
            document.getElementById('mg_body').innerHTML="<h2>"+name+"</h2><br><div style='margin-left:20px'>Address: "+address+"<br>Cp: "+cp+"<br>Capacity: "+capacity+"<br>Open: "+open+"<br>Close: "+close+"<br>Employee: "+employee+"</div>";
          }//end for

          $('#modal_gallery').modal('show');
        }});//end ajax  

      }
      function modal_oo(id){  //DATA SOUVENIR

        //DATA SOUVENIR
        document.getElementById('mg_title').innerHTML="Information";
        console.log(server+'_data_souvenir_1.php?cari='+id);
        $.ajax({url: server+'_data_souvenir_1.php?cari='+id, data: "", dataType: 'json', success: function(rows){ 
          for (var i in rows.data){ 
            var row = rows.data[i];
            var id = row.id;
            var name = row.name;
            var owner = row.owner;
            var cp = row.cp;
            var address = row.address;
            var employee = row.employee;
            var type_souvenir = row.type_souvenir;
            var lat=row.lat;
            var lng = row.lng;
            console.log(name);
            document.getElementById('mg_body').innerHTML="<h2>"+name+"</h2><br><div style='margin-left:20px'>Address: "+address+"<br>Cp: "+cp+"<br>Owner: "+owner+"<br>Employee: "+employee+"<br>Type: "+type_souvenir+"</div>";
          }//end for

          $('#modal_gallery').modal('show');
        }});//end ajax  
      }
      function modal_tw(id){  // DATA TOURISM

        //DATA TOURISM
        document.getElementById('mg_title').innerHTML="Information";
        console.log(server+'_data_tourism_1.php?cari='+id);
        $.ajax({url: server+'_data_tourism_1.php?cari='+id, data: "", dataType: 'json', success: function(rows){ 
          for (var i in rows.data){ 
            var row = rows.data[i];
            var id = row.id;
            var name = row.name;
            var address = row.address;
            var open = row.open;
            var close = row.close;
            var ticket = row.ticket;
            var tourism_type = row.tourism_type;
            var lat=row.latitude;
            var lng = row.longitude;
            console.log(name);
            document.getElementById('mg_body').innerHTML="<h2>"+name+"</h2><h4>"+tourism_type+"</h4><br><div style='margin-left:20px'>Address: "+address+"<br>Open: "+open+"<br>Close: "+close+"<br>Ticket: "+ticket+"</div>";
          }//end for

          //FASILITAS HOTEL
          var isi="<br><b style='margin-left:20px'>Fasility</b> <br><ol>";
          for (var i in rows.fasilitas){ 
            var row = rows.fasilitas[i];
            var id = row.id;
            var name = row.name;
            console.log(name);
            isi = isi+"<li>"+name+"</li>";
          }//end for
          isi = isi + "</ol>";
          $('#mg_body').append(isi);

          $('#modal_gallery').modal('show');
        }});//end ajax  
      }
      function modal_restaurant(id){    // DATA RESTAURANT

        //DATA TOURISM
        document.getElementById('mg_title').innerHTML="Information";
        console.log(server+'_data_restaurant_1.php?cari='+id);
        $.ajax({url: server+'_data_restaurant_1.php?cari='+id, data: "", dataType: 'json', success: function(rows){ 
          for (var i in rows.data){ 
            var row = rows.data[i];
            var id = row.id;
            var name = row.name;
            var cp = row.cp;
            var address = row.address;
            var open = row.open;
            var close = row.close;
            var capacity = row.capacity;
            var employee = row.employee;
            var mushalla = row.mushalla;
            var park_area = row.park_area;
            var bathroom = row.bathroom;
            var type_restaurant = row.type_restaurant;
            var lat=row.latitude;
            var lng = row.longitude;

            if (mushalla == 1) {
              mushalla = "Available";
            }else{
              mushalla = "Not Available"
            }
            if (park_area == 1) {
              park_area = "Available";
            }else{
              park_area = "Not Available"
            }
            if (bathroom == 1) {
              bathroom = "Available";
            }else{
              bathroom = "Available"
            }

            console.log(name);
            document.getElementById('mg_body').innerHTML="<h2>"+name+"</h2><h4>"+type_restaurant+"</h4><br><div style='margin-left:20px'>Address: "+address+"<br>Open: "+open+"<br>Close: "+close+"<br>Capacity: "+capacity+"<br>Employee: "+employee+"<br>Mushalla: "+mushalla+"<br>Park Area: "+park_area+"<br>Bathroom: "+bathroom+"</div>";
          }//end for

          $('#modal_gallery').modal('show');
        }});//end ajax  
      }

function detailindustri_infow(id){  //menampilkan Information rm
   hapusInfo();
      clearroute2();
    clearroute();
       $.ajax({
      url: server+'detailik.php?cari='+id, data: "", dataType: 'json', success: function(rows)
        {
          console.log(id);
         for (var i in rows)
          {

            console.log('dd');
            var row = rows[i];
            var id = row.id;
            var name = row.name;
            var address=row.address;
            var latitude  = row.latitude;
            var longitude = row.longitude ;
            centerBaru = new google.maps.LatLng(row.latitude, row.longitude);
            marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/industries.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
            map.setCenter(centerBaru);
            map.setZoom(18);
            infowindow = new google.maps.InfoWindow({
            position: centerBaru,
            content: "<span style=color:black><center><b>Information</b></center><br><i class='fa fa-home'></i> "+name+"<br><i class='fa fa-map-marker'></i> "+address+"<br></span>",
            pixelOffset: new google.maps.Size(0, -33)
            });
          infoDua.push(infowindow);
          hapusInfo();
          infowindow.open(map);

          }


        }
      });
}

function detailculinary(id1){  //menampilkan Information culinary

   hapusInfo();
      clearroute2();
    clearroute();
      hapusMarkerTerdekat();
       $.ajax({
      url: server+'detailrm.php?cari='+id1, data: "", dataType: 'json', success: function(rows)
        {
          console.log(id1);
         for (var i in rows)
          {

            console.log('dd');
            var row = rows[i];
            var id = row.id;
            var name = row.name;
            var address=row.address;
            var cp=row.cp;
            var capacity=row.capacity;
            var jam_buka=row.open;
            var jam_tutup=row.close;
            var employee=row.employee;
            var latitude  = row.latitude;
            var longitude = row.longitude ;
            centerBaru = new google.maps.LatLng(row.latitude, row.longitude);
            marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/food.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
            map.setCenter(centerBaru);
            map.setZoom(18);
            infowindow = new google.maps.InfoWindow({
            position: centerBaru,
            content: "<span style=color:black><center><b>Information</b><br></center><br><i class='fa fa-home'></i> "+name+"<br><i class='fa fa-map-marker'></i> "+address+"<br></span>",
            pixelOffset: new google.maps.Size(0, -33)
            });
          infoDua.push(infowindow);
          hapusInfo();
          infowindow.open(map);

          }


        }
      });
}

function detailkuliner_infow(id){  //menampilkan Information culinary

   hapusInfo();
      clearroute2();
    clearroute();
         $.ajax({
      url: server+'detailrm.php?cari='+id, data: "", dataType: 'json', success: function(rows)
        {
          console.log(id);
         for (var i in rows)
          {

            console.log('dd');
            var row = rows[i];
            var id = row.id;
            var name = row.name;
            var address=row.address;
             var latitude  = row.latitude;
            var longitude = row.longitude ;
            centerBaru = new google.maps.LatLng(row.latitude, row.longitude);
            marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/food.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
            map.setCenter(centerBaru);
            map.setZoom(18);
            infowindow = new google.maps.InfoWindow({
            position: centerBaru,
            content: "<span style=color:black><center><b>Information</b><br></center><br><i class='fa fa-home'></i> "+name+"<br><i class='fa fa-map-marker'></i> "+address+"<br></span>",
            pixelOffset: new google.maps.Size(0, -33)
            });
          infoDua.push(infowindow);
          hapusInfo();
          infowindow.open(map);

          }


        }
      });
}

function detailhotel(id1){  //menampilkan Information hotel
   hapusInfo();
      clearroute2();
    clearroute();
      hapusMarkerTerdekat();
       $.ajax({
      url: server+'detailhotel.php?cari='+id1, data: "", dataType: 'json', success: function(rows)
        {
          console.log(id1);
         for (var i in rows)
          {

            console.log('dd');
            var row = rows[i];
            var id = row.id;
            var name = row.name;
            var address=row.address;
            var cp=row.cp;
            var ktp=row.ktp;
            var marriage_book=row.marriage_book;
            var mushalla=row.mushalla;
            var star=row.star;
            var lat  = row.latitude;
            var lon = row.longitude ;
            centerBaru = new google.maps.LatLng(row.latitude, row.longitude);
            marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/marker_hotel.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
              console.log(lat);
              console.log(lon);
              markersDua.push(marker);
            map.setCenter(centerBaru);
            map.setZoom(18);
      var syarat="0";
                if (ktp == 1 && marriage_book == 1) {
                  syarat = "KTP & Marriage Book";
                }
                else if (ktp == 1) {
                  syarat = "KTP";
                } else if (marriage_book == 1) {
                  syarat = "Marriage Book";
                }
           infowindow = new google.maps.InfoWindow({
            position: centerBaru,
            content: "<span style=color:black><center><b>Information</b></center><br><i class='fa fa-home'></i> "+name+"<br><i class='fa fa-map-marker'></i> "+address+"<br></span>",
            pixelOffset: new google.maps.Size(0, -33)
            });
          infoDua.push(infowindow);
          hapusInfo();
          infowindow.open(map);

          }


        }
      });
}

function detailhotel_infow(id){  //menampilkan Information hotel

   hapusInfo();
      clearroute2();
    clearroute();
       $.ajax({
      url: server+'detailhotel.php?cari='+id, data: "", dataType: 'json', success: function(rows)
        {
          console.log(id);
         for (var i in rows)
          {

            console.log('dd');
            var row = rows[i];
            var id = row.id;
            var name = row.name;
            var address=row.address;
            var lat  = row.latitude;
            var lon = row.longitude ;
            centerBaru = new google.maps.LatLng(row.latitude, row.longitude);
            marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/marker_hotel.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
              console.log(lat);
              console.log(lon);
              markersDua.push(marker);
            map.setCenter(centerBaru);
            map.setZoom(18);

            infowindow = new google.maps.InfoWindow({
            position: centerBaru,
            content: "<span style=color:black><center><b>Information</b></center><br><i class='fa fa-home'></i> "+name+"<br><i class='fa fa-map-marker'></i> "+address+"<br></span>",
            pixelOffset: new google.maps.Size(0, -33)
            });
          infoDua.push(infowindow);
          hapusInfo();
          infowindow.open(map);

          }


        }
      });
}
 function listMasjid(){ // Menu Tourism
          //clearangkot();
          reset();
          $('#hasilcari1').show();
          $('#hasilcari').empty();
          $('#hasilcari').append("<tr><th class='centered'>Name</th><th class='centered'colspan='3'>Action</th></tr>");
          $.ajax({ 
          url: server+'datamasjid.php', data: "", dataType: 'json', success: function(rows) 
          { 
              for (var i in rows){ 
                var row = rows[i];
                var id = row.id;
                var name = row.name;
                // console.log(id);
                var latitude=row.lat;
                var longitude = row.lng;
                $('#hasilcari').append("<tr><td>"+name+"</td><td><a role='button' class='btn btn-success fa fa-info' title='info' onclick='data_tourism_1_info(\""+id+"\")'></a></td><td><a role='button' class='btn btn-success fa fa-taxi' title='Angkot' onclick='angkot_sekitar(\""+id+"\")'></a></td></tr>");  

                centerBaru = new google.maps.LatLng(latitude, longitude);
                map.setCenter(centerBaru);
                map.setZoom(16);  
                var marker = new google.maps.Marker({
                  position: centerBaru,              
                  icon:'assets/ico/marker_masjid.png',
                  animation: google.maps.Animation.DROP,
                  map: map
                  });
                markersDua.push(marker);
                map.setCenter(centerBaru);
                klikInfoWindow(id);
              }               
            } 
          });      
        }

function detailow(id1){  //menampilkan Information ow

   hapusInfo();
      clearroute2();
    clearroute();
      hapusMarkerTerdekat();
       $.ajax({
      url: server+'detailow.php?cari='+id1, data: "", dataType: 'json', success: function(rows)
        {
          console.log(id1);
         for (var i in rows)
          {

            console.log('dd');
            var row = rows[i];
            var id = row.id;
            var name   = row.name;
        var address = row.address;
        var open = row.open;
        var close = row.close;
        var ticket = row.ticket;
        var fasilitas = row.fasilitas;
            var latitude  = row.latitude;
            var longitude = row.longitude ;
            centerBaru = new google.maps.LatLng(row.latitude, row.longitude);
            marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/marker_tw.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
            map.setCenter(centerBaru);
            map.setZoom(18);
        infowindow = new google.maps.InfoWindow({
            position: centerBaru,
            content: "<span style=color:black><center><b>Information</b><br></center><br><i class='fa fa-home'></i> "+name+"<br><i class='fa fa-map-marker'></i> "+address+"<br></span>",
            pixelOffset: new google.maps.Size(0, -33)
            });
          infoDua.push(infowindow);
          hapusInfo();
          infowindow.open(map);

          }


        }
      });
}

function detailow_infow(id){  //menampilkan Information ow

   hapusInfo();
      clearroute2();
    clearroute();
       $.ajax({
      url: server+'detailow.php?cari='+id, data: "", dataType: 'json', success: function(rows)
        {
          console.log(id);
         for (var i in rows)
          {

            console.log('dd');
            var row = rows[i];
            var id = row.id;
            var name   = row.name;
        var address = row.address;
            var latitude  = row.latitude;
            var longitude = row.longitude ;
            centerBaru = new google.maps.LatLng(row.latitude, row.longitude);
            marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/marker_tw.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
            map.setCenter(centerBaru);
            map.setZoom(18);
            infowindow = new google.maps.InfoWindow({
            position: centerBaru,
            content: "<span style=color:black><center><b>Information</b><br></center><br><i class='fa fa-home'></i> "+name+"<br><i class='fa fa-map-marker'></i> "+address+"<br></span>",
            pixelOffset: new google.maps.Size(0, -33)
            });
          infoDua.push(infowindow);
          hapusInfo();
          infowindow.open(map);
          }

        }
      });
}

function detailevent(id1, id2, id3){  //menampilkan Information event
    hapusRadius();
    $('#infoevent').empty();
    hapusInfo();
    clearroute2();
    clearroute();
    hapusMarkerTerdekat();

    console.log("hay");
       $.ajax({
      url: server+'detailevent.php?cari='+id1+'&time='+id2+'&date='+id3, data: "", dataType: 'json', success: function(rows)
        {
          console.log(id1);
         for (var i in rows)
          {

            console.log('dd');
            var row = rows[i];
            var nama = row.worship_place_name;
            var nama_keg=row.event_name;
            var tgl_keg=row.date;
            var nama_ustad=row.ustad_name;
            var materi=row.description;
            var jam=row.time;
            var image=row.image;
      var latitude = row.lat;
      var longitude = row.lng;
            centerBaru = new google.maps.LatLng(row.lat, row.lng);
            marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/marker_masjid.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
            map.setCenter(centerBaru);
            map.setZoom(18);
            $('#infoevent').append("<tr><td><b>Mosque</b></td><td>:</td><td> "+nama+"</td></tr><tr><td><b> Event </b></td><td>:</td><td> "+nama_keg+"</td></tr><tr><td><b>Date</b></td><td>:</td><td>"+tgl_keg+"</td></tr><tr><td><b>Time</b></td><td>:</td><td> "+jam+"</td></tr><tr><td><b>Ustad</b></td><td>:</td><td> "+nama_ustad+"</td></tr><tr><td><b>Content</b></td><td>:</td><td> "+materi+"</td></tr>")
            infowindow = new google.maps.InfoWindow({
            position: centerBaru,
            content: "<span style=color:black><center><b>Information</b><br><img src='"+fotosrc+image+"' alt='image in infowindow' width='150'></center><br><i class='fa fa-home'></i> "+nama+"<br><i class='fa fa-map-marker'></i> "+nama_keg+"<br></span>",
            pixelOffset: new google.maps.Size(0, -33)
            });
          infoDua.push(infowindow);
          hapusInfo();
          infowindow.open(map);

          }


        }
      });
}
      function tampil_sekitar(latitude,longitude,nama){
        hapusRadius();
        rad_lat = latitude;
        rad_lng = longitude;
    console.log(rad_lat);
    console.log(rad_lng);
        document.getElementById("inputradius1").style.display = "inline";

        // POSISI MARKER
        centerBaru1 = new google.maps.LatLng(latitude, longitude);
          var marker = new google.maps.Marker({map: map, position: centerBaru,
          icon:'assets/ico/marker_masjid.png',
          animation: google.maps.Animation.DROP,
          clickable: true});
          markersDua1.push(marker);
      }



function aktifkanRadiusSekitar(){
          hapusmarkerall();
          clearroute2();
          clearroute();
          clearangkot();
          var inputradius1=document.getElementById('inputradius1').value;
          console.log(inputradius1);
          var rad = parseFloat(inputradius1*100);
          var circle = new google.maps.Circle({
            center: centerBaru1,
            radius: rad,
            map: map,
            strokeColor: "blue",
            strokeOpacity: 0.5,
            strokeWeight: 1,
            fillColor: "blue",
            fillOpacity: 0.35
          });
          map.setZoom(14);
      map.setCenter(pos);
          circles.push(circle);
          console.log(circle)
          console.log("aada");
        $('#table_kanan_hotel').empty();
        $('#table_kanan_tourism').empty();
        $('#table_kanan_worship').empty();
        $('#table_kanan_souvenir').empty();
        $('#table_kanan_culinary').empty();
        $('#table_kanan_industry').empty();
        $('#table_kanan_restaurant').empty();

        $('#table_hotel').hide();
        $('#table_tourism').hide();
        $('#table_worship').hide();
        $('#table_souvenir').hide();
        $('#table_culinary').hide();
        $('#table_industry').hide();
        $('#table_restaurant').hide();

        // td = Table Detail
        if (document.getElementById("check_i").checked) {
          $('#table_industry').show();
          industrisekitar(rad_lat,rad_lng,rad);
        }        
        if (document.getElementById("check_k").checked) {
          $('#table_culinary').show();
          kulinersekitar(rad_lat,rad_lng,rad);
        }           
        if (document.getElementById("check_oo").checked) {
          $('#table_souvenir').show();
          oleholehsekitar(rad_lat,rad_lng,rad);
        }      
        if (document.getElementById("check_tw").checked) {
          $('#table_tourism').show();
           owsekitar(rad_lat,rad_lng,rad);
        }        
        if (document.getElementById("check_h").checked) {
          $('#table_hotel').show();
          hotelsekitar(rad_lat,rad_lng,rad);
        }        
        if (document.getElementById("check_r").checked) {
          $('#table_restaurant').show();
          restaurantsekitar(rad_lat,rad_lng,rad);
        }

        $('#view_table_sekitar').show(); 
        }

function oleholehsekitar(latitude,longitude,rad){ // SOUVENIR SEKITAR MASJID
      $('#table_kanan_souvenir').empty();
      $('#table_kanan_souvenir').append("<tr><th class='centered' colspan='4'>Souvenir Name</th><th class='centered'>Action</th></tr>");
      cekRadius1();
          $.ajax({url: server+'carioleholeh.php?lat='+latitude+'&long='+longitude+'&rad='+rad, data: "", dataType: 'json', success: function(rows){
            for (var i in rows){
              var row = rows[i];
              var id_oleh_oleh = row.id;
              var nama_oleh_oleh = row.name;
              var cp = row.cp;
              var pemilik = row.owner;
              var alamat = row.address;
              var id_status_tempat = row.id_souvenir_type;
              var jumlah_karyawan = row.employee;
              var lat=row.latitude;
              var lon = row.longitude;
        console.log(nama_oleh_oleh);

  centerBaru = new google.maps.LatLng(lat, lon);
              marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/shopping.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
            console.log(id_oleh_oleh);
              console.log(lat);
              console.log(lon);
              markersDua.push(marker);
              map.setCenter(centerBaru);
        klikInfoWindow_oleh(id_oleh_oleh);
              map.setZoom(14);
        $('#table_kanan_souvenir').append("<tr><td colspan='4' style='width:30%'>"+nama_oleh_oleh+"</td><td><a role='button' style='margin:5px' title='position' class='btn btn-success fa fa-map-marker' onclick='detailoleh(\""+id_oleh_oleh+"\");'></a><a role='button' style='margin:5px' title='Detail' class='btn btn-success fa fa-info' onclick='modal_oo(\""+id_oleh_oleh+"\");'></a></a><a role='button' class='btn btn-success fa fa-bus' style='margin:5px' title='Local Transportation' onclick='angkotsouvenir(\""+id_oleh_oleh+"\",\""+lat+"\",\""+lon+"\");info12();'></a><a role='button' style='margin:5px' title='Route from mosque' class='btn btn-success fa fa-road' value='Route' onclick='route_sekitar(\""+latitude+"\",\""+longitude+"\",\""+lat+"\",\""+lon+"\")'></a></td></tr>");
            }//end for
          }});//end ajax
        }

    function kulinersekitar(latitude,longitude,rad){ // KULINER SEKITAR MASJID
      $('#table_kanan_culinary').empty();
      $('#table_kanan_culinary').append("<tr><th class='centered' colspan='4'>Culinary Name</th><th class='centered'>Action</th></tr>");
      cekRadius1();
          $.ajax({url: server+'carikuline.php?lat='+latitude+'&long='+longitude+'&rad='+rad, data: "", dataType: 'json', success: function(rows){
            for (var i in rows){
              var row = rows[i];
              var id = row.id;
              var name = row.name;
              var address = row.address;
              var cp = row.cp;
              var capacity = row.capacity;
              var jam_buka = row.open;
              var jam_tutup = row.close;
              var employee = row.employee;
              var lat=row.latitude;
              var lon = row.longitude;
        console.log(name);
          centerBaru = new google.maps.LatLng(lat, lon);
              marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/food.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
            console.log(id);
              console.log(lat);
              console.log(lon);
              markersDua.push(marker);
              map.setCenter(centerBaru);
        klikInfoWindow_kuliner(id);
              map.setZoom(14);
              $('#table_kanan_culinary').append("<tr><td colspan='4' style='width:30%'>"+name+"</td><td><a role='button' title='position' class='btn btn-success fa fa-map-marker' style='margin:5px' onclick='detailculinary(\""+id+"\");'></a><a role='button' title='Detail' class='btn btn-success fa fa-info' style='margin:5px' onclick='modal_kuliner(\""+id+"\");'></a><a role='button' class='btn btn-success fa fa-bus' style='margin:5px' title='Local Transportation' onclick='angkotkuliner(\""+id+"\",\""+lat+"\",\""+lon+"\");'></a><a role='button' title='Route from mosque' style='margin:5px' class='btn btn-success fa fa-road' value='Route' onclick='route_sekitar(\""+latitude+"\",\""+longitude+"\",\""+lat+"\",\""+lon+"\")'></a></td></tr>");
            }
          }});
        }

function hotelsekitar(latitude,longitude,rad){ // HOTEL SEKITAR MASJID
      $('#table_kanan_hotel').empty();
      $('#table_kanan_hotel').append("<tr><th class='centered' colspan='4'>Hotel Name</th><th class='centered'>Action</th></tr>");  
      cekRadius1();
          $.ajax({url: server+'carihotel.php?lat='+latitude+'&long='+longitude+'&rad='+rad, data: "", dataType: 'json', success: function(rows){
            for (var i in rows){
              var row = rows[i];
              var id_hotel = row.id;
              var nama = row.name;
              var alamat = row.address;
              var cp = row.cp;
              var ktp = row.ktp;
              var marriage_book = row.marriage_book;
              var mushalla = row.mushalla;
              var star = row.star;
              var id_type = row.id_type;
              var lat=row.latitude;
              var lon = row.longitude;
        console.log(name);
        centerBaru = new google.maps.LatLng(lat, lon);
              marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/marker_hotel.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
            console.log(id_hotel);
              console.log(lat);
              console.log(lon);
              markersDua.push(marker);
              map.setCenter(centerBaru);
        klikInfoWindow_hotel(id_hotel);
              map.setZoom(14);
      $('#table_kanan_hotel').append("<tr><td colspan='4' style='width:30%'>"+nama+"</td><td><a role='button' title='position' style='margin:5px' class='btn btn-success fa fa-map-marker' onclick='detailhotel(\""+id_hotel+"\");'></a><a role='button' title='Detail' style='margin:5px' class='btn btn-success fa fa-info' onclick='modal_hotel(\""+id_hotel+"\");'></a><a role='button' class='btn btn-success fa fa-bus' style='margin:5px' title='Local Transportation' onclick='angkothotel(\""+id_hotel+"\",\""+lat+"\",\""+lon+"\");'></a><a role='button' title='Route from mosque' style='margin:5px' class='btn btn-success fa fa-road' value='Route' onclick='route_sekitar(\""+latitude+"\",\""+longitude+"\",\""+lat+"\",\""+lon+"\")'></a></td></tr>");
            }//end for
          }});//end ajax
        }

    function industrisekitar(latitude,longitude,rad){ // INDUSTRI SEKITAR MASJID
       $('#table_kanan_industry').empty();
      $('#table_kanan_industry').append("<tr><th class='centered' colspan='4'>Industry Name</th><th class='centered'>Action</th></tr>"); 
      cekRadius1();
      console.log("ini industri");
          $.ajax({url: server+'cariindustri.php?lat='+latitude+'&long='+longitude+'&rad='+rad, data: "", dataType: 'json', success: function(rows){
            console.log("ini juga");
            for (var i in rows){
              var row = rows[i];
              var id_industri = row.id;
              var nama_industri = row.name;
              var cp = row.cp;
              var pemilik = row.owner;
              var alamat = row.address;
              var id_status_tempat = row.id_industry_type;
        var jumlah_karyawan = row.employee;
              var lat=row.latitude;
              var lon = row.longitude;
        console.log(name);

        centerBaru = new google.maps.LatLng(lat, lon);
              marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/industries.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
            console.log(id_industri);
              console.log(lat);
              console.log(lon);
              markersDua.push(marker);
              map.setCenter(centerBaru);
        klikInfoWindow_industri(id_industri);
              map.setZoom(14);
      $('#table_kanan_industry').append("<tr><td colspan='4' style='width:30%'>"+nama_industri+"</td><td><a role='button' title='position' style='margin:5px' class='btn btn-success fa fa-map-marker' onclick='detailik(\""+id_industri+"\");'></a><a role='button' title='info' style='margin:5px' class='btn btn-success fa fa-info' onclick='modal_industry(\""+id_industri+"\");'></a><a role='button' class='btn btn-success fa fa-bus' style='margin:5px' title='Local Transportation' onclick='angkotindustri(\""+id_industri+"\",\""+lat+"\",\""+lon+"\");'></a><a role='button' style='margin:5px' title='Route from mosque' class='btn btn-success fa fa-road' value='Route' onclick='route_sekitar(\""+latitude+"\",\""+longitude+"\",\""+lat+"\",\""+lon+"\")'></a></td></tr>");
            }//end for
          }});//end ajax
        }


  function owsekitar(latitude,longitude,rad){ // OW SEKITAR MASJID
      $('#table_kanan_tourism').empty();
        $('#table_kanan_tourism').append("<tr><th class='centered' colspan='4'>Tourism Name</th><th class='centered'>Action</th></tr>");
      cekRadius1();
      console.log(server+'cariow.php?lat='+latitude+'&long='+longitude+'&rad='+rad)
          $.ajax({url: server+'cariow.php?lat='+latitude+'&long='+longitude+'&rad='+rad, data: "", dataType: 'json', success: function(rows){
            for (var i in rows){
              var row = rows[i];
              var id = row.id;
              var nama = row.name;
              var lokasi = row.address;
              var jam_buka = row.open;
              var jam_tutup = row.close;
              var fasilitas = row.ticket;
              var keterangan = row.id_type;
              var lat = row.latitude;
              var lon = row.longitude;
        console.log(name);
        centerBaru = new google.maps.LatLng(lat, lon);
              marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/marker_tw.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
            console.log(id);
              console.log(lat);
              console.log(lon);
              markersDua.push(marker);
              map.setCenter(centerBaru);
        klikInfoWindow_ow(id);
              map.setZoom(14);

      $('#table_kanan_tourism').append("<tr><td colspan='4' style='width:30%'>"+nama+"</td><td><a role='button' style='margin:5px' title='position' class='btn btn-success fa fa-map-marker' onclick='detailow(\""+id+"\");'></a><a role='button' style='margin:5px' title='Detail' class='btn btn-success fa fa-info' onclick='modal_tw(\""+id+"\");'></a><a role='button' class='btn btn-success fa fa-bus' style='margin:5px' title='Local Transportation' onclick='angkotwisata(\""+id+"\",\""+lat+"\",\""+lon+"\");'></a><a role='button' style='margin:5px' title='Route from mosque' class='btn btn-success fa fa-road' value='Route' onclick='route_sekitar(\""+latitude+"\",\""+longitude+"\",\""+lat+"\",\""+lon+"\")'></a></td></tr>");
            }//end for
          }});//end ajax
        }

        function restaurantsekitar(latitude,longitude,rad){ // restaurant SEKITAR MASJID
         $('#table_kanan_restaurant').empty();
        $('#table_kanan_restaurant').append("<tr><th class='centered' colspan='4'>Restaurant Name</th><th class='centered'>Action</th></tr>");
      cekRadius1();
      console.log(server+'carirestaurant.php?lat='+latitude+'&long='+longitude+'&rad='+rad)
          $.ajax({url: server+'carirestaurant.php?lat='+latitude+'&long='+longitude+'&rad='+rad, data: "", dataType: 'json', success: function(rows){
            for (var i in rows){
              var row = rows[i];
              var id = row.id;
              var nama = row.name;
              var lokasi = row.address;
              var lat = row.latitude;
              var lon = row.longitude;
        console.log(name);
       centerBaru = new google.maps.LatLng(lat, lon);
              marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/restaurants.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
            console.log(id);
              console.log(lat);
              console.log(lon);
              markersDua.push(marker);
              map.setCenter(centerBaru);
        klikInfoWindow_res(id);
              map.setZoom(14);


      $('#table_kanan_restaurant').append("<tr><td colspan='4' style='width:30%'>"+nama+"</td><td><a role='button' style='margin:5px' title='position' class='btn btn-success fa fa-map-marker' onclick='detailrestaurant(\""+id+"\");'></a><a role='button' style='margin:5px' title='Detail' class='btn btn-success fa fa-info' onclick='modal_restaurant(\""+id+"\");'></a><a role='button' style='margin:5px' class='btn btn-success fa fa-bus' title='Local Transportation' onclick='angkotrestaurant(\""+id+"\",\""+lat+"\",\""+lon+"\");'></a><a role='button' style='margin:5px' title='Route from mosque' class='btn btn-success fa fa-road' value='Route' onclick='route_sekitar(\""+latitude+"\",\""+longitude+"\",\""+lat+"\",\""+lon+"\")'></a></td></tr>");
            }//end for
          }});//end ajax
        }



 function callRoute(start, end) {
    if (pos == 'null' || typeof(pos) == "undefined"){
    alert ('Please click button current position or button manual position first');
    }
    else
    {
      $('#rute1').show();
      $('#view_data_tengah').hide();
       $('#info').empty();
       $('#rute').empty();
       clearroute2();
     directionsService = new google.maps.DirectionsService;
     directionsDisplay = new google.maps.DirectionsRenderer;


      directionsService.route
      (
        {
            origin: start,
            destination: end,
            travelMode: google.maps.TravelMode.DRIVING
        },
        function(response, status)
        {
            if (status === google.maps.DirectionsStatus.OK)
            {
              directionsDisplay.setDirections(response);
            }
            else
            {
              window.alert('Directions request failed due to ' + status);
            }
          }
      );
      directionsDisplay.setMap(map);
      map.setZoom(16);
      $('#rute').append("<div class='box-body' style='max-height:350px;overflow:auto;'><div class='form-group' id='detailrute'></div></div></div>");
      directionsDisplay.setPanel(document.getElementById('detailrute'));
     }
 }

 function route_sekitar(lat1,lng1,lat,lng) {
    
          var start = new google.maps.LatLng(lat1, lng1);
          var end = new google.maps.LatLng(lat, lng);

          if(directionsDisplay){
              clearroute();
              hapusInfo();
          }

          directionsService = new google.maps.DirectionsService();
          var request = {
            origin:start,
            destination:end,
            travelMode: google.maps.TravelMode.DRIVING,
            unitSystem: google.maps.UnitSystem.METRIC,
            provideRouteAlternatives: true
          };

          directionsService.route(request, function(response, status) {
            if (status == google.maps.DirectionsStatus.OK) {
             directionsDisplay.setDirections(response);
           }
          });

          directionsDisplay = new google.maps.DirectionsRenderer({
            draggable: false,
            polylineOptions: {
              strokeColor: "darkorange"
            }
          });

          directionsDisplay.setMap(map);
          rute.push(directionsDisplay);
      }

//menampilkan checkbox fasilitas
function fasilitas(){

  $('#fasilitaslist .checkbox').remove();
  var v=fasilitaslist.value;
  $.ajax({ url: server+'fasilitas.php?id='+v, data: "", dataType: 'json', success: function(rows){
    for (var i in rows){
      console.log("hy");
      var row = rows[i];
      var id_fasilitas=row.id;
      var nama_fasilitas=row.name;
      console.log(id_fasilitas);
      $('#fasilitaslist').append('<div class="checkbox" style="color: #f3fff4"><label><input type="checkbox" name="fasilitas" value="'+id_fasilitas+'">'+nama_fasilitas+'</label></div>');
    }
  }});
}

function tampilkatwilayah(){ //fungsi cari berdasarkan wilayah dan kategori
  var b = document.getElementById('kecamatan1').value;
  var cari = document.getElementById('id_kategori1').value;
  console.log(b);
  $('#hasilcari1').show();
      $('#hasilcari').empty();
      hapusInfo();
      clearroute2();
    clearroute();
    clearangkot();
  hapusRadius();
      hapusMarkerTerdekat();
    console.log(cari);
            $.ajax({
            url: server+'/carikatwilayah.php?id='+b+'&cari='+cari, data: "", dataType: 'json', success: function(rows)
            {

        if(rows==null)
          {
            alert('Worship Place Not Found !');

          }
        else{
           for (var i in rows)
                    {

                        var row = rows[i];
                        var id   = row.id;
                        var nama   = row.worship_place_name;
                        var alamat   = row.address;
                        var kapasitas = row.capacity;
                        var latitude  = row.latitude ;
                        var longitude = row.longitude ;
                        console.log(nama);


            centerBaru = new google.maps.LatLng(latitude, longitude);
              marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/marker_masjid.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
              map.setCenter(centerBaru);
        klikInfoWindow(id);
              map.setZoom(14);

             $('#hasilcari').append("<tr><td>"+nama+"</td><td><a role='button' title='info' class='btn btn-success fa fa-info' onclick='detailmasjid(\""+id+"\");info1();'></a></td><td><a role='button' class='btn btn-success fa fa-bus' title='Local Transportation' onclick='angkotmesjid(\""+id+"\",\""+latitude+"\",\""+longitude+"\");info12();'></a></td></tr>");
                        }

        }
            }
         });

}

function carifasilitas(){

$('#hasilcari1').show();
    $('#hasilcari').empty();
      hapusInfo();
      clearroute2();
    clearroute();
    clearangkot();
  hapusRadius();
      hapusMarkerTerdekat();
  var fas=fasilitaslist.value;
  var arrayLay=[];
  for(i=0;i<$("input[name=fasilitas]:checked").length;i++){
    arrayLay.push($("input[name=fasilitas]:checked")[i].value);
  }
  if (arrayLay==''){
    alert('Choose Facility !');
  }else{
    console.log("yuhuuuuuuuuu");

    $.ajax({ url: server+'carifasilitas.php?lay='+arrayLay, data: "", dataType: 'json', success: function(rows){
      console.log(server+'carifasilitas.php?lay='+arrayLay);
      if(rows==null)
            {
              alert('Mosque not found');
            }
        for (var i in rows)
            {
              var row     = rows[i];
              var id   = row.id;
              var nama   = row.name;
              var latitude  = row.latitude ;
              var longitude = row.longitude ;
              centerBaru = new google.maps.LatLng(latitude, longitude);
              marker = new google.maps.Marker
            ({
              position: centerBaru,
              icon:'assets/ico/marker_masjid.png',
              map: map,
              animation: google.maps.Animation.DROP,
            });
            console.log(id);
              console.log(latitude);
              console.log(longitude);
              markersDua.push(marker);
              map.setCenter(centerBaru);
         klikInfoWindow(id);
              map.setZoom(14);
              $('#hasilcari').append("<tr><td>"+nama+"</td><td><a role='button' title='info' class='btn btn-success fa fa-info' onclick='detailmasjid(\""+id+"\");info1();'></a></td><td><a role='button' class='btn btn-success fa fa-bus' title='Local Transportation' onclick='angkotmesjid(\""+id+"\",\""+latitude+"\",\""+longitude+"\");info12();'></a></td></tr>");
            }

    }});
  }
}

function caritglkeg(){
  if(caritgl.value==''){
    alert("Fill the input form first!");
    }else{
    console.log(server+'caritglkeg.php?tgl='+caritgl.value);
    console.log("hau");
    $.ajax({ url: server+'caritglkeg.php?tgl='+caritgl.value, data: "", dataType: 'json', success: function (rows){
      console.log(server+'caritglkeg.php?tgl='+caritgl.value);
      caritglk(rows);
    }});
  }
}

function tampiljurusan()
  {

    $('#hasilcari1').show();
    $('#hasilcari').empty();
    $('#hasilcari').append("<tr><th class='centered'>Major</th><th class='centered'>Local Transportation</th></tr>");
      hapusInfo();
      clearroute2();
    clearroute();
    clearangkot();
  hapusRadius();
  hapusMarkerTerdekat();
    /*   hapusMarkerTerdekat(); */
   var jur=jurusan.value;
    console.log(jur);
    $.ajax({
        url: server+'carijur.php?jur='+jur, data: "", dataType: 'json', success: function(rows)
          {

            if(rows==null)
            {
              alert('Route Not Found');
            }
          for (var i in rows)
            {
              console.log("hai riri");
              var row     = rows[i];
              var id_angkot   = row.id;
              var jurusan   = row.destination;
              $('#hasilcari').append("<tr><td>"+jurusan+"</td><td><a role='button' class='btn btn-success fa fa-bus' onclick='data_angkot_1_rute(\""+id_angkot+"\")'></a></td></tr>");
            }

          }
        });
  }
  function data_angkot_1_rute(id_angkot){ // ANGKOT - KLIK TOMBOL RUTE - DATA 1 ANGKOT
          hapusInfo();
      clearroute2();
    clearroute();
    clearangkot();
       clearroute2();
          $.ajax({url: server+'/tampilkanrute.php?id_angkot='+id_angkot, data: "", dataType: 'json', success: function(rows){ 
            for (var i in rows.features) 
              { 
                var id_angkot=rows.features[i].properties.id;
                var destination=rows.features[i].properties.destination;
                var track=rows.features[i].properties.track;
                var cost=rows.features[i].properties.cost;
                var color=rows.features[i].properties.color;
                var latitude  = rows.features[i].properties.latitude; 
                var longitude = rows.features[i].properties.longitude ;

                tampilrute1(id_angkot, "red", latitude, longitude);  //TAMPILKAN RUTE                    

              }//end for                          
          }});//end ajax 

        }
    function tampilrute1(id, warna, latitude, longitude){ //TAMPILKAN RUTE
        ja = new google.maps.Data();
        ja.loadGeoJson(server+'tampilkanrute.php?id_angkot='+id);
        ja.setStyle(function(feature){
          return({
              fillColor: 'yellow',
              strokeColor: warna,
              strokeWeight: 2,
              fillOpacity: 0.5
              });          
        });
        ja.setMap(map);  
        angkot.push(ja);
        map.setZoom(15);
      }


  function galeriangkot(){

  }

  function clearangkot(){
        for (i in angkot){
        //for (var i = 0; i < angkot.length; i++) {
            angkot[i].setMap(null);
          }
          angkot=[];
        }

 function posisiawal(){ //POSISI AWAL

        if (awal==0) {
            $('#text_awal').empty();
            $('#text_awal').append("<div class='alert alert-info' style='display: inline-block;padding: 6px 12px;width:100%'>Silahkan klik posisi anda</div>");
        } else {
            $('#text_awal').empty();
            $('#text_awal').append("<div class='alert alert-danger' style='display: inline-block;padding: 6px 12px;width:100%'>Reset Dulu</div>");
        }

        map.addListener('click', function(event) {
          console.log("manual 1 mulai");
          if (awal == 0) {
              console.log("mulai");
              marker_awal = new google.maps.Marker({
               //icon: "assets/img/biru1.ico",
                position : event.latLng,
                map: map,
                animation: google.maps.Animation.DROP,
                });

              posisi_1 = {
              lat: event.latLng.lat(),
              lng: event.latLng.lng() }

              document.getElementById('input_posisi_awal_lat').value=posisi_1.lat;
              document.getElementById('input_posisi_awal_lng').value=posisi_1.lng;

              marker_awal.info = new google.maps.InfoWindow({
                  content: "<center><a style='color:black;'>Anda Disini</a></center>",
                  pixelOffset: new google.maps.Size(0, -1)
                    });
                  marker_awal.info.open(map, marker_awal);

              marker_1.push(marker_awal);
              awal=1;
              $('#text_awal').empty();
              $('#text_awal').append("<div class='alert alert-success' style='display: inline-block;padding: 6px 12px;width:100%'>Lokasi telah dipilih</div>");
          }//end awal == 0
        });//end add listener
      }

      function posisitujuan(){ //POSISI TUJUAN

        if (tujuan==0) {
            $('#text_tujuan').empty();
            $('#text_tujuan').append("<div class='alert alert-info' style='display: inline-block;padding: 6px 12px;width:100%'>Silahkan klik posisi anda</div>");
          } else {
            $('#text_tujuan').empty();
            $('#text_tujuan').append("<div class='alert alert-danger' style='display: inline-block;padding: 6px 12px;width:100%'>Reset dulu</div>");
          }

        map.addListener('click', function(event) {
          console.log("manual 2 mulai");
          if (tujuan == 0) {
            console.log("mulai");
            for (var i = 0; i < marker_2.length; i++) {
              marker_2[i].setMap(null);
            }

            marker = new google.maps.Marker({
             //icon: "assets/img/biru1.ico",
              position : event.latLng,
              map: map,
              animation: google.maps.Animation.DROP,
              });

            posisi_2 = {
            lat: event.latLng.lat(),
            lng: event.latLng.lng() }

            document.getElementById('input_posisi_tujuan_lat').value=posisi_2.lat;
            document.getElementById('input_posisi_tujuan_lng').value=posisi_2.lng;

            marker.info = new google.maps.InfoWindow({
                content: "<center><a style='color:black;'>Tujuan Anda Disini </a></center>",
                pixelOffset: new google.maps.Size(0, -1)
                  });
                marker.info.open(map, marker);

            marker_2.push(marker);
            tujuan =1;
            $('#text_tujuan').empty();
            $('#text_tujuan').append("<div class='alert alert-success' style='display: inline-block;padding: 6px 12px;width:100%'>Lokasi telah dipilih</div>");

          }//end tujuan ==0
       });//end addlistener

      }



    function call_rute(){ // Panggil Track
    $('#hasilcari1').show();
    $('#hasilcari').empty();
    $('#hasilcari').append("<tr><th class='centered'>Major</th><th class='centered'>Local Transportation</th></tr>");
      hapusInfo();
      clearroute2();
    clearroute();
      hapusMarkerTerdekat();

        var lat1= document.getElementById('input_posisi_awal_lat').value;
        var lng1= document.getElementById('input_posisi_awal_lng').value;
        var lat2 = document.getElementById('input_posisi_tujuan_lat').value
        var lng2 = document.getElementById('input_posisi_tujuan_lng').value;



        if (lat1==""||lng1==""||lat2==""||lng2=="") {
          $('#kanan_rute').append("<div class='alert alert-danger' style='font-size:12px; display: inline-block;padding: 6px 12px;width:100%'><b>Pilih Lokasi Anda Terlebih Dahulu</b></div>");
        } else {
          var url_tujuan = server+'track.php?lat1='+lat1+'&lng1='+lng1+'&lat2='+lat2+'&lng2='+lng2+'&rad=300';
          console.log(url_tujuan);
          $.ajax({url: url_tujuan, data: "", dataType: 'json', success: function(rows){
            //{"jumlah":6,"data":[{"rute-ke":1,"data":["A002","18"]},{"rute-ke":2,"data":["D003","18"]},{"rute-ke":3,"data":["A001","18"]},{"rute-ke":4,"data":["C006","18"]},{"rute-ke":5,"data":["A003","18"]},{"rute-ke":6,"data":["C001","18"]}]}
      console.log(lat1);
      console.log(lng1);
      console.log("haii");
      console.log(lat2);
      console.log(lng2);
            console.log(rows.jumlah);
            console.log(rows.data);
            for (var i in rows.data){
              var row = rows.data[i];
              var data = row.data;
        var id_angkot = row.id_angkot;
              var rute="";
              var fungsi="";
              for(var x in data){
                var isi = data[x];
                console.log(isi);
                if (rute=="") {
                  rute = isi;
                }else{
                  rute = rute+' - '+isi;
                }
                fungsi = fungsi + "detailangkot(\'"+isi+"\');";
              }//end for
              console.log("hasil rute");
              console.log(rute);
              console.log(fungsi);
              $('#hasilcari').append("<tr><td>"+jurusan+"</td><td><a role='button' class='btn btn-success fa fa-bus' onclick='data_angkot_1_rute(\""+id_angkot+"\")'></a></td></tr>");
            }//end for
            if (rows.jumlah == 0) {
              $('#kanan_rute').empty();
              $('#kanan_rute').append("<div class='alert alert-danger' style='font-size:12px; display: inline-block;padding: 6px 12px;width:100%'><b>Tidak ada angkot di sekitar posisi pilihan anda</b></div>");
            }//end if
            //loader
            $("#loader").hide();
            $("#loader_text").hide();
          }});//end ajax
        }

      }

function legenda()
{
  $('#tombol').empty();
  $('#tombol').append('<a class="btn btn-success" role="button" id="hidelegenda" style="margin-left:3px;" data-toggle="tooltip" onclick="hideLegenda()" title="Hide Legend"><i class="fa fa-eye-slash" style="color:white;"></i></a>');

  var layer = new google.maps.FusionTablesLayer(
    {
          query: {
            select: 'Location',
            from: '1NIVOZxrr-uoXhpWSQH2YJzY5aWhkRZW0bWhfZw'
          },
          map: map
        });
    var legend = document.createElement('div');
        legend.id = 'legend';
        var content = [];
        content.push('<h4>Legend</h4>');
        content.push('<p><div class="color b"></div>District Mandiangin Koto Selayan</p>');
        content.push('<p><div class="color c"></div>District Guguak Panjang</p>');
        content.push('<p><div class="color d"></div>District Aur Birugo Tigo Baleh</p>');
        legend.innerHTML = content.join('');
        legend.index = 1;
        map.controls[google.maps.ControlPosition.LEFT_TOP].push(legend);
}

function hideLegenda() {
  $('#legend').remove();
  $('#tombol').empty();
  $('#tombol').append('<a class="btn btn-success" role="button" id="showlegenda" style="margin-left:3px;" data-toggle="tooltip" onclick="legenda()" title="Legend"><i class="fa fa-eye" style="color:white;"></i></a>');
}

    function cek()
        {
           $('#populer').hide();
         document.getElementById('km').innerHTML=document.getElementById('inputradiusmes').value*100
        }

     function cek1()
        {
         document.getElementById('km1').innerHTML=document.getElementById('inputradius1').value*100
        }

    function reset_rute () { //RESET KLIK RUTE
          tujuan=0;
          awal=0;
          hapus_kecuali_landmark();
          basemap();
      $('#hasilcari').empty();
      $('#hasilcari').append("<thead><th>Angkot Code</th><th>Route</th><th>Gallery</th></thead>");

      }

    function hapus_kecuali_landmark(){
            hapusRadius();
            hapusMarkerTerdekat();
            hapusInfo();
            clearangkot();
            clearroute();
          }


function reset(){
  $("#hasilcari1").hide();

  hapusInfo();
  clearroute2();
  clearroute();
  /* hapusMarkerTerdekat(); */
  $("#att2").hide();
}

function owtampil(){
  $("#att1").show();
  $("#att2").hide();
  $("#radiuss").hide();
  $("#infoo1").hide();
  $("#infoev").hide();
}

function rutetampil(){
  $("#att2").show();
  $("#att1").hide();
  $("#radiuss").hide();
  $("#infoo1").hide();
  $("#infoev").hide();
  $("#infoo").show();
}

function info1(){
  $("#infoo").show();
  $("#att2").hide();
  $("#radiuss").hide()
  $("#infoo1").hide();;

  $("#infoev").hide();
}

function infoev(){
  $("#infoo").hide();
  $("#att2").hide();
  $("#infoev").show();
  $("#radiuss").hide()
  $("#infoo1").hide();


}

function info12(){
  $("#infoo1").show();
  $("#radiuss").hide();
  $("#infoo").hide();
  $("#att2").hide();
  $("#infoev").hide();
}

function eventt(){
  $("#eventt").show();
  $("#result").hide();
  $("#att1").hide();
  $("#hide2").show();
  $("#infoo").hide();
  $("#showlist").hide();
  $("#radiuss").hide();
  $("#infoo1").hide();
  $("#att2").hide();
  $("#infoev").hide();
  
}

function resultt(){
  $("#result").show();
  $("#resultaround").hide();
  $("#eventt").hide();
   $('#populer').hide();
  $("#infoo").hide();
  $("#att1").hide();
  $("#hide2").show();
  $("#showlist").hide();
  $("#radiuss").hide();
  $("#infoo1").hide();
  $("#att2").hide();
  $("#infoev").hide();
}

function resultt1(){
  $("#result").show();
  $("#resultaround").show();
  $("#eventt").hide();
  $("#infoo").hide();
  $("#att1").hide();
  $("#hide2").show();
  $("#showlist").hide();
  $("#radiuss").hide();
  $("#infoo1").hide();
  $("#att2").hide();
  $("#infoev").hide();
}

function list(){
  $("#result").hide();
  $("#eventt").hide();
  $("#infoo").hide();
  $("#att1").hide();
  $("#hide2").hide();
  $("#radiuss").hide();
  $("#infoo1").hide();
  $("#att2").hide();
  $("#infoev").hide();
}

function resetangkot(){
  $("#eventt").hide();
  $("#infoo").show();
  $("#att1").hide();
  $("#showlist").hide();
  $("#radiuss").hide();
  $("#infoo1").hide();
  $("#infoev").hide();
}


function cekRadius(){
          rad = inputradiusmes.value*100;
          console.log(rad);
          }

function cekRadiusangkot(){
          rad = inputradiusangkot.value*100;
          console.log(rad);
          }

function cekRadius1(){
          rad = inputradius1.value*100;
          console.log(rad);
          }

function clearroute2(){
    if(typeof(directionsDisplay) != "undefined" && directionsDisplay.getMap() != undefined){
    directionsDisplay.setMap(null);
    $("#detailrute").remove();
    }

}

function hapusMarkerTerdekat() {
          for (var i = 0; i < markersDua.length; i++) {
                markersDua[i].setMap(null);
            }
        }

function hapusMarkerTerdekat1() {
          for (var i = 0; i < markersDua1.length; i++) {
                markersDua1[i].setMap(null);
            }
        }
function hapusmarkerall(){
    hapusMarkerTerdekat();
    hapusRadius();
}
function hapusmarkerall(){
    hapusMarkerTerdekat();
    hapusRadius();
}
function hapusall(){
    hapusMarkerTerdekat();
    hapusMarkerTerdekat1();
    hapusInfo();
    hapusRadius();
    clearroute2();
    clearroute();
    clearangkot();
    $('#rute1').hide();
    $('#view_table_sekitar').hide();
    $('#view_data_tengah').hide();
    $('#infoev').hide();
$('#infoevent').empty();
}

function hapusMarkerInfowindow(){
         setMapOnAll(null);
         hapusMarkerTerdekat();
         pos = 'null';
    }
function setMapOnAll(map) {
        for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
        }
    }
function hapusInfo() {
        for (var i = 0; i < infoDua.length; i++) {
              infoDua[i].setMap(null);
              }
      }

function hapusRadius(){
  for(var i=0;i<circles.length;i++)
               {
                   circles[i].setMap(null);
               }
    circles=[];
  cekRadiusStatus = 'off';
  }


  function hapusposisi(){
  for (var i = 0; i < markers.length; i++){
    markers[i].setMap(null);
  }
  markers = [];
}

 function clearroute(){
          for (i in rute){
            rute[i].setMap(null);
          }
          rute=[];
        }
