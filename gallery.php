<?php 
require 'connect.php';
session_start();

 ?>
<!DOCTYPE html>
<html lang="en">
  
<head>
    
    
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    <title>Worship Finder</title>

    <link href="assets/css/bootstrap.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link href="assets/js/fancybox/jquery.fancybox.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    

    <link href="assets/css/newStyle.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

  <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-timepicker/compiled/timepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datetimepicker/datertimepicker.html" />
  <link rel="stylesheet" href="assets/css/bootstrap-slider.css" type="text/css">
  <script type="text/javascript" src="html5gallery/html5gallery.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDgpfxdQ0Ep_nieNjV64u4yXWeSFHAT4BE"></script>
    <script src="assets/js/chart-master/Chart.js"></script>
  <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
  <script src="script.js" type="text/javascript"></script>
  <style>
    .mySlides {display:none}
    .w3-left, .w3-right, .w3-badge {cursor:pointer}
    .w3-badge {height:13px;width:13px;padding:0}
    </style>
  <style type="text/css">
    body {
        font-family: Arial;
        margin: 0;
      }

      * {
        box-sizing: border-box;
      }

      img {
        vertical-align: middle;
      }
.html5gallery img {
      width:470px !important;
      left: 0px !important;
    }
    .html5gallery-car-0 {
      margin-top:5px;
      width : 470px !important;
     
    }
      /* Position the image container (needed to position the left and right arrows) */
      .container2 {
        position: relative;
      }

      /* Hide the images by default */
      .mySlides {
        display: block;
        width: auto;
        height: auto;
        padding: 10px;
        background-color: grey;
      } 

      /* Add a pointer when hovering over the thumbnail images */
      .cursor {
        cursor: pointer;
      }

      /* Next & previous buttons */
      .prev,
      .next {
        cursor: pointer;
        position: absolute;
        top: 60%;
        width: auto;
        padding: 16px;
        margin-top: -50px;
        color: white;
        background-color: rgba(0,0,0,0.5);
        font-weight: bold;
        font-size: 20px;
        border-radius: 0 3px 3px 0;
        user-select: none;
        -webkit-user-select: none;
      }

      .prev1,
      .next1 {
        cursor: pointer;
        position: absolute;
        top: 100%;
        width: auto;
        padding: 10px;
        margin-top: 6px;
        color: white;
        background-color: rgba(0,0,0,0.5);
        font-weight: bold;
        font-size: 20px;
        border-radius: 0 3px 3px 0;
        user-select: none;
        -webkit-user-select: none;
      }

      /* Position the "next button" to the right */
      .next {
        right: 0;
        border-radius: 3px 0 0 3px;
      }

      .next1 {
        right: 0;
        border-radius: 3px 0 0 3px;
      }

      .prev{
        left: 0;
        border-radius: 3px 0 0 3px;
      }

      .prev1{
        left: 0;
        border-radius: 3px 0 0 3px;
      }

      /* On hover, add a black background color with a little bit see-through */
      .prev:hover,
      .next:hover {
        background-color: rgba(255, 255, 255, 0.8);
        color: black;
      }

      .prev1:hover,
      .next1:hover {
        background-color: rgba(255, 255, 255, 0.8);
        color: black;
      }
      .row2:after {
        
        display: none;
        clear: both;
      }

      /* Six columns side by side */
      .column {
        float: left;
        width: 25%; 
        padding: 5px;
        background-color: black;
      }

      /* Add a transparency effect for thumnbail images */
      .demo {
        opacity: 0.8;
      }

      .active,
      .demo:hover {
        opacity: 1;
        color: black;
      }

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1000s;
}

@-webkit-keyframes fade {
  from {opacity: 1} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: 4} 
  to {opacity: 5}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
      .active,
      .demo:hover {
        opacity: 1;
        color: black;
      }
      #legend {
        background:white;
        padding: 10px;
        margin: 5px;
        font-size: 12px;
    font-color: blue;
        font-family: Arial, sans-serif;
    opacity: 2.5;
    }
    .color {
        border: 1px solid;
        height: 12px;
        width: 12px;
        margin-right: 3px;
        float: left;
    }
    .a {
        background: #f58d6f;
      }
    .b {
        background: #f58d6f;
      }
      .c {
        background: #fce8b7;
      }
    .d {
        background: #ec87ec;
      }
    .e {
        background: #42cb6f;
      }
    .f {
        background: #5c9ded;
      }
    .g {
        background: #373435;
      }
    .h {
        background: #d51e5a;
      }
    .i {
        background: #9398ec;
      }
    .j {
        background: #f9695d;
      }
    .k {
        background: #ec87bf;
      }
    .l {
        background: navy;
      }


   </style>
  
  </head>

  <body onload="init();detailmasjid('<?php echo @$_GET["idgallery"] ?>');">

   <section id="container" >
      <header class="header bg-black">
        <div class="sidebar-toggle-box">
          <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation">
          </div>
        </div>
            <!--logo start-->
        <a href="index.php" class="logo"><b>WebGIS Worship Place (16 1811522014 Puty Syalima)</b></a>
        <div class="top-menu">
          <ul class="nav pull-right top-menu">
            <li>
              <div id="loader" style="display:none">
              </div>
            </li>
            <li id="loader_text" style="margin-top:13px;display:none"><b>Loading</b>
            </li>
          </ul>
        </div>
      </header>

      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <ul class="sidebar-menu" id="nav-accordion">
                  <li class="sub-menu">
                      <a href="index.php">
                          <i class="fa fa-arrow-left"></i>
                          <span>Back To Home</span>
                      </a>
                  </li> 
              </ul>
          </div>
      </aside>

      <section id="main-content">
        <section class="wrapper site-min-height">
          <div class="row mt">
                <div class="col-sm-6"> <!-- information -->
                  <section class="panel">
                    <header class="panel-heading">
                      <h2 class="box-title" style="text-transform:capitalize;"><b>Detail Information</b></h2>
                    </header>
                    
                    <?php 
                      require 'connect.php';
                      $id = $_GET["idgallery"];

                      $querysearch  ="select worship_place.id, worship_place.name as name_mesjid, address, land_size, building_size, park_area_size, capacity, est, last_renovation, imam, jamaah, teenager, category_worship_place.name as name_category, image, ST_X(ST_Centroid(geom)) AS lng, ST_Y(ST_CENTROID(geom)) As lat from worship_place left join category_worship_place on category_worship_place.id=worship_place.id_category where worship_place.id='$id'";       
                      $hasil=pg_query($querysearch);
                      $query_fasilitas="SELECT facility.id, facility.name FROM facility left join detail_facility on detail_facility.id_facility = facility.id left join worship_place on worship_place.id = detail_facility.id_worship_place where worship_place.id = '".$id."' ";
                      $hasil3=pg_query($conn,$query_fasilitas);
                    ?>

                    <div class="panel-body">
                      <table id="" class="table">
                        <tbody  style='vertical-align:top;'>
                          <?php  
                            while($baris = pg_fetch_assoc($hasil))
                              {
                                echo "<tr><td><b>Name</b></td><td>:</td><td> ".$baris['name_mesjid']."</td></tr>
                                <tr><td><b>Address </b></td><td>:</td><td> ".$baris['address']."</td></tr>
                                <tr><td><b>Capacity</b></td><td>:</td><td>".$baris['capacity']." Jamaah</td></tr>
                                <tr><td><b>Land Size</b></td><td>:</td><td> ".$baris['land_size']." m<sup>2</sup></td></tr>
                                <tr><td><b>Building Size</b></td><td>:</td><td> ".$baris['building_size']." m<sup>2</sup></td></tr>
                                <tr><td><b>Park Area Size</b></td><td>:</td><td> ".$baris['park_area_size']." m<sup>2</sup></td></tr>
                                <tr><td><b>Establish</b></td><td>:</td><td> ".$baris['est']."</td></tr>
                                <tr><td><b>Last Renovation</b></td><td>:</td><td> ".$baris['last_renovation']."</td></tr>
                                <tr><td><b>Imam</b></td><td>:</td><td> ".$baris['imam']."</td></tr>
                                <tr><td><b>Jamaah</b></td><td>:</td><td> ".$baris['jamaah']."</td></tr>
                                <tr><td><b>Teenager</b></td><td>:</td><td> ".$baris['teenager']."</td></tr>
                                <tr><td><b>Category</b></td><td>:</td><td> ".$baris['name_category']."</td></tr>
                                <tr><td><b>Facility</b></td><td>:</td><td>";
                              }
                          ?>    
                            <!-- <br><b style='margin-left:20px'>Facility</b> <br><ol> -->
                          <?php
                            $query_fasilitas="SELECT facility.id, facility.name FROM facility left join detail_facility on detail_facility.id_facility = facility.id left join worship_place on worship_place.id = detail_facility.id_worship_place where worship_place.id = '".$id."' ";
                            $hasil3=pg_query($conn,$query_fasilitas);
                            while($baris = pg_fetch_assoc($hasil3))
                            {
                              echo "<li>".$baris['name']."</li>";
                            }                      
                          ?>
                        </tbody> 
                      </table>
                    </div>
                  </section>
                    
                  <section class="panel">
                    <header class="panel-heading">
                      <h3 class="box-title" style="text-transform:capitalize;"><b>Info</b></h3>
                    </header>
                  
                    <?php 
                     require 'connect.php';
                      $id = $_GET["idgallery"];
         
                        $sqlreview = "SELECT d.id_worship_place, d.date, d.time, b.name as event_name, a.name as worship_place_name, ST_X(ST_Centroid(a.geom)) AS longitude, ST_Y(ST_CENTROID(a.geom)) As latitude from worship_place as a, event as b left join detail_event as d ON b.id=d.id_event 
where a.id = '$id' and a.id=d.id_worship_place 
group by id_event, id_worship_place, a.name, b.name, d.date, d.time,geom";
                      
                        
                      $result = pg_query($sqlreview);
                    ?>
                    <table class="table" style="font-size: 15px;">
                      <thead><th>Date</th><th>Info</th></thead>
                    <?php  
                      while ($rows = pg_fetch_array($result)) 
                        {
                         $event_name=$rows['event_name'];
                        $worship_place_name=$rows['worship_place_name'];
                          $date=$rows['date'];
                      $time=$rows['time'];
                          echo "<tr><td>$date</td><td>$event_name</td></tr>";
                        }
                    

                       ?>               
                    
                  </table>
                  </section>

                  <section class="panel" id="review">
                    <header class="panel-heading">
                      <h3 class="box-title" style="text-transform:capitalize;"><b> Visitor's Reviews</b></h3>
                    </header>
                    <div class="panel-body">
                      <form method="POST" action="_add_comment.php">
                        <input type="hidden" name="id" value="<?php echo $_GET['idgallery']?>" >
                          <table id="" class="table">
                            <tbody  style='vertical-align:top;'>
                              <?php 
                                //$u = $_SESSION['username'];
                                //echo "username $u";                          
                                    // $username = $_SESSION['username'];
                                    //echo "nama $username";
                                      echo "
                                        <tr>
                                          <td>Name</td>
                                          <td>:</td>
                                          <td><input  name='username' value=''></td>
                                        </tr>
                                        <tr>
                                          <td>Comment</td>
                                          <td>:</td>
                                          <td><textarea cols='30' rows='5' name='comment'></textarea></td>
                                        </tr>
                                        <tr>
                                          <td><input type='submit' name='' value='send' class='btn btn-success'></td><td>
                                          <input name='nama' value='nama' hidden></td>
                                        </tr>";
                              ?>                            
                            </tbody>          
                          </table>
                      </form>
                      
                      <?php                       
                        $id = $_GET["idgallery"];
                        // if(strpos($id,"H") !== false){
                        //   $sqlreview = "SELECT * from review where id_hotel = '$id'";
                        // }elseif (strpos($id,"RM") !== false) {
                        //   $sqlreview = "SELECT * from review where id_kuliner = '$id'";
                        // }elseif (strpos($id, "SO") !== false) {
                        //   $sqlreview = "SELECT * from review where id_souvenir = '$id'";
                        // }elseif (strpos($id,"IK") !== false) {
                        //    $sqlreview = "SELECT * from review where id_ik = '$id'";
                        // }elseif (strpos($id,"OW")!== false) {
                           $sqlreview = "SELECT * from review where id_worship = '$id'";
                        // }
                          
                        $result = pg_query($sqlreview);
                      ?>
                        <table class="table">
                          <?php  
                            
                            echo "<p><b>".pg_num_rows($result)."  comment </b></p>";

                            while ($rows = pg_fetch_array($result)) 
                              {
                                $nama = $rows['name'];
                                $komen = $rows['comment'];
                                echo "<p><b>&nbsp&nbsp&nbsp$nama</b></p>
                                <p>&nbsp&nbsp&nbsp&nbsp&nbsp$komen</p>";
                              }               
                          ?>
                          </table>   
                        <table class="table">                                                   
                      </table>
                      <tr colspan></tr>
                    </div>
                  </section>
                  
                </div>
                <div class="col-sm-6">
                <div class="row">
                  <div class="col-sm-12" style="margin-left: -20px;"> <!-- gallery -->
                    <section class="panel">
                        <div class="panel-body" style="color: black;">
                            <a class="btn btn-compose" style="background-color:black;border-bottom:1px solid black;color:white">Gallery</a>
                            <div style="overflow-y: hidden; overflow-x:hidden; margin:15px; display:flex; justify-content:center">
                            <div class="html5gallery" style="max-height:700px; overflow:hidden; display:block; width: 100%;" data-skin="horizontal" data-width="470" data-height="300" data-resizemode="fit">   
                                <?php
                                  $id = $_GET["idgallery"];
                                  $querysearch  ="SELECT a.id, b.gallery_worship_place FROM worship_place as a left join worship_place_gallery as b on a.id=b.id where a.id='$id' ";       
                                  $hasil=pg_query($querysearch);
                                  while($baris = pg_fetch_assoc($hasil))
                                    {
                                      if(($baris['gallery_worship_place']=='-')||($baris['gallery_worship_place']==''))
                                        {
                                          echo "<a href='foto/foto.jpg'><img src='foto/foto.jpg' ></a>";
                                        }
                                      else
                                        {
                                          echo "<a href='foto/".$baris['gallery_worship_place']."'><img src='foto/".$baris['gallery_worship_place']."'></a>";
                                        }
                                    }
                                ?> 
                              </div>
                            </div>
                          </div>
                      </section>
                    </div>

                    <div class="col-sm-12" style="margin-left: -20px;"> <!-- peta -->
                      <div class="white-panel pns">
                        <header class="panel-heading" style="float:left">
                          <label style="color: black">Google Map with Location List</label>
                            <a class="btn btn-success" role="button" data-toggle="collapse" onclick="aktifkanGeolocation()" title="Current Position"   ><i class="fa fa-map-marker" style="color:white;"></i></a>
                            <a class="btn btn-success" role="button" data-toggle="collapse" onclick="manualLocation()" title=" Manual Position"><i class="fa fa-location-arrow" style="color:white;"></i></a>
                            <label id="tombol">
                            <a class="btn btn-success" role="button" id="showlegenda" data-toggle="collapse" onclick="legenda()" title="Legend"   ><i class="fa fa-eye" style="color:white;"></i></a></label>
                          </header>
                                
                        <div class="row">
                          <div class="col-sm-6 col-xs-6">
                          </div>
                        </div>                        
                  
                          <div id="map" class="centered" style="height:350px;width:100%;" >
                          
                          </div>
                        </div>

                      </div>
                    </div>
                  </div>
                
          </div>
        </section>
      </section>
      <!-- <footer class="site-footer">
          <div class="text-center">
              1311521008 - Fitri Yuliani
              <a href="index.html#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer> -->
  </section>


    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/jquery-1.8.3.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
  <script src="assets/js/fancybox/jquery.fancybox.js"></script>    
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="assets/js/jquery.sparkline.js"></script>
    
    <script src="assets/js/common-scripts.js"></script>
  <script type="text/javascript" src="assets/js/bootstrap-slider.js"></script>
    
    <script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="assets/js/gritter-conf.js"></script>
  <script type="text/javascript" src="assets/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
  <script type="text/javascript" src="assets/js/bootstrap-daterangepicker/date.js"></script>
  <script type="text/javascript" src="assets/js/bootstrap-daterangepicker/daterangepicker.js"></script>
  
  <script type="text/javascript" src="assets/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
  <script type="text/javascript" src="assets/js/bootstrap-daterangepicker/moment.min.js"></script>
  <script type="text/javascript" src="assets/js/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
  <script src="assets/js/advanced-form-components.js"></script>      
    <script type="text/javascript">
      $(function() {
        //    fancybox
          jQuery(".fancybox").fancybox();
      });

  </script>
  </body>
</html>
