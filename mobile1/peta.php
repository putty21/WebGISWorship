<!DOCTYPE html>
<html>
<head>
<meta name='viewport' content='initial-scale=1.0, user-scalable=no' /><style type='text/css'> 
html { height: 100%;width: 100% } 
body { height: 100%; width: 100%; margin: 0px; padding: 0px }
#map_canvas { height: 100%; width: 100% }
</style>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBh7Xfdh42Ro9CNFPkvoZhFVhEpTeOP16g"></script>
<script src='http://code.jquery.com/jquery-1.11.0.min.js' type='text/javascript'>
</script> 
<? 
$lat = $_GET['lat']; $lng = $_GET['lng'];
echo"
<script type='text/javascript'> 
var server = 'http://192.168.1.4/t2/mobile/';
 function init(){

    var latlng = new google.maps.LatLng($lat,$lng); 
    var myOptions = { 
      zoom:16, center: latlng, mapTypeId: google.maps.MapTypeId.ROADMAP }; 
      var map = new google.maps.Map(document.getElementById('map'), myOptions);   


  var marker0 = new google.maps.Marker({ position: latlng,map: map,title: '', clickable:false, icon:''}); 
  
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

      mesjid = new google.maps.Data();    
    mesjid.loadGeoJson(server+'masjid.php');

    mesjid.setStyle(function(feature){
        return({
            fillColor: '#68dff0',
                    strokeColor: '#68dff0',
                    strokeWeight: 1,
                    fillOpacity: 0.6
          });
      });
      mesjid.setMap(map);

    var marker0 = new google.maps.Marker({ position: latlng,map: map,title: '', clickable:false, icon:''}); 
    mesjid.addListener('click', function(event){
    infowindow.setContent(event.feature.getProperty('nama'));
    infowindow.setPosition(event.latLng);
    infowindow.open(map);
    });
}


</script>"; 
?> 

</head>
<body onload='init()'> 
<div id='map' style="width: 100%; height: 100%;"></div>
</body>
</html>