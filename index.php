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

  <body onload="init()">

   <section id="container" >
    <div class="modal fade" id="modal_gallery" role="dialog">
        <div class="modal-dialog">
        
          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header" style="background:black">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title" id="mg_title">Modal Header</h4>
            </div>
            <div class="modal-body" id="mg_body">

                <!--GALERY-->
                <div id="view_galery" class="row" style="display:none">
                    <div class="col-md-12 col-sm-12 mb">
                       <div class="row centered" style="padding:10px">
                         <div class="col-sm-1 col-xs-1"></div>
                         <div id="gal" class="col-sm-10 col-xs-10" style="height:300px;">
                            <!--img class="img-responsive" src="assets/img/ny.jpg" style="width:100%;height:100%;"-->

                            <div class="w3-content w3-display-container" style="max-height:300px;max-width:600px">
                              <div id="img_gambar">

                              </div>
                              
                              <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="width:100%">
                                <div class="col-md-6 col-sm-6 mb">
                                    <div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
                                </div>
                                <div class="col-md-6 col-sm-6 mb">
                                    <div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
                                </div>
                                <div id="span_gambar">

                                </div>
                              </div>
                            </div>

                         </div>
                         <div class="col-sm-1 col-xs-1"></div>
                       </div>
                    </div><!-- /col-md-12 -->             
                </div><!-- /row -->   

                <div class="col-md-12 col-sm-12 mb" style="margin-top:10px">
                  <p id="mg_text" ></p>
                </div><!-- /col-md-12 -->             

            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
            </div>
          </div>
          
        </div>
      </div>


      <!-- Modal -->
      <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
        
          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header" style="background:black">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title" id="modal_title">Caution</h4>
            </div>
            <div class="modal-body" id="modal_body">
            <p>ERROR, determine your location first</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
            </div>
          </div>
          
        </div>
      </div>
      
        <header class="header bg-black">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="index.php" class="logo"><b>WebGIS Worship Place (16 1811522014 Puty Syalima)</b></a>
            <div class="top-menu">
              <ul class="nav pull-right top-menu">
                    <li><div id="loader" style="display:none"></div></li>
                    <li id="loader_text" style="margin-top:13px;display:none"><b>Loading</b></li>
              </ul>
            </div>
        </header>
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <ul class="sidebar-menu" id="nav-accordion">
              
              <p class="centered"><a href="profile.html"><img src="assets/img/1.jpg" class="img-circle" width="90" style="border-radius: 50%"></a></p>
                  <p class="centered" style="color: white; font-style: bold;">Bukittinggi</p>
                  <li class="sub-menu">
                      <a href="javascript:;" onclick="tampilsemua();resultt()" >
                          <i class="fa fa-th-list"></i>
                          <span>List Worship</span>
                      </a>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" onclick="hapusall();resultt()" >
                          <i class="fa fa-thumb-tack"></i>
                          <span>Around You</span>
                      </a>
                      <ul class="sub">
                    <label><b>Radius&nbsp</b></label><label style="color:black" id="km"><b>0</b></label>&nbsp<label><b>m</b></label><br>
                    <input  type="range" onclick="cek();aktifkanRadius();resultt()" id="inputradiusmes" name="inputradiusmes" data-highlight="true" min="1" max="20" value="1" >
                  </ul>
                  </li>
                  <li class="sub-menu">
               
                      <a href="javascript:;" onclick="resultt()">
                          <i class="fa fa-search"></i>
                          <span>Search By</span>
                      </a>
                      <ul class="sub">
                          <li class="sub-menu">
                      <a href="javascript:;" onclick="reset()">
                          <i class="fa fa-sort-alpha-asc"></i>
                          <span>Name</span>
                      </a>
                      <ul class="sub">
                        <div  class="panel-body" >
                          
                            <input type="text" class="form-control" id="carimasjid" name="carimasjid" placeholder="Search..." >
                            <br>
                            <button type="submit" class="btn btn-default" value="carimasjid" onclick="hapusall();carinamamasjid()"> <i class="fa fa-search"></i></button>                          
                         
                        </div>
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" onclick="fasilitas()">
                          <i class="fa fa-sort-amount-asc"></i>
                          <span>Facility</span>
                      </a>
                      <ul class="sub">
                      <div class="box-body" id="fasilitaslist">
                      
                         <div class="kategori"><h7 style="color :#f3fff4">Choose Facility</h7></div>
                            
                        </div>
                        <button type="submit" class="btn btn-default" id="carifasilitas"  value="fas" onclick='hapusall();carifasilitas()'><i class="fa fa-search"></i></button>
                        
                      </ul>
                  </li> 

                  <li class="sub-menu">
                      <a href="javascript:;" onclick="" >
                          <i class="fa fa-tasks"></i>
                          <span>Event</span>
              </a>
              <ul class="sub">
                          <li class="sub-menu">
                      <a href="javascript:;" onclick="">
                          <i class="fa fa-calendar"></i>
                          <span>Date</span>
                      </a>
                      <ul class="sub">
                        <div  class="panel-body" >
                        <div class="form-group">
                         
                          <input type="text" class="form-control form-control-inline input-medium default-date-picker" size="16" name="caritgl" id="caritgl" value="">
                          <button type="submit" class="btn btn-default" value="caritgl" onclick="hapusall();caritglkeg();resultt()"> <i class="fa fa-search"></i></button> 
                         
                        </div>

                                                 
                        
                        </div>
                      </ul>
                  </li>
          </ul>
                      
                  </li>

                  <li class="sub-menu">
                      <a href="javascript:;" onclick="reset()" >
                          <i class="fa fa-cogs"></i>
                          <span>Sub-District</span>
                      </a>
                      <ul class="sub">
                         <div  class="panel-body" >
                            <select class="form-control" id="kecamatan" >
                                <?php
                                include("connect.php"); 
                                $kecamatan=pg_query("select * from district ");
                                while($rowkecamatan = pg_fetch_assoc($kecamatan))
                                {
                                echo"<option value=".$rowkecamatan['id'].">".$rowkecamatan['name']."</option>";
                                }
                                ?>
                                </select>
                                <br>
                                <button type="submit" class="btn btn-default" id="caritpkec"  value="cari" onclick="hapusall();caritpkec()"><i class="fa fa-search"></i></button>
                          </div>
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" onclick="reset()">
                          <i class="fa fa-institution "></i>
                          <span>Categories</span>
                      </a>
                      <ul class="sub">
                          <div  class="panel-body" >
                          <select class="form-control" id="id_kategori" >
                                <?php
                                include("connect.php"); 
                                $kategori=pg_query("select * from category_worship_place ");
                                while($rowkategori = pg_fetch_assoc($kategori))
                                {
                                echo"<option value=".$rowkategori['id'].">".$rowkategori['name']."</option>";
                                }
                                ?>
                                </select>
                                <br>
                                <button type="submit" class="btn btn-default" id="carikategori"  value="cari" onclick='hapusall();carikategori()'><i class="fa fa-search"></i></button>
                      </ul>
                  </li>
                   <li class="sub-menu">
                      <a href="javascript:;" onclick="reset()">
                          <i class="fa fa-filter"></i>
                          <span>Filter</span>
                      </a>
                      <ul class="sub">
                          <div  class="panel-body" >
                          <label style="color:white;">District</label>
                          <select class="form-control" id="kecamatan1" >
                                <?php
                                include("connect.php"); 
                                $kecamatan=pg_query("select * from district ");
                                while($rowkecamatan = pg_fetch_assoc($kecamatan))
                                {
                                echo"<option value=".$rowkecamatan['id'].">".$rowkecamatan['name']."</option>";
                                }
                                ?>
                                </select>
                
                                <label style="color:white;">Category</label>
                <select class="form-control" id="id_kategori1" >
      
                                <?php
                   include "connect.php";
                  $result=  pg_query("select id as nilai, name as nama from category_worship_place order by nama ASC");
                  while($baris = pg_fetch_assoc($result))
                  {
                      echo "<option value=".$baris["nilai"].">".$baris["nama"]."</option>";
                  }
                pg_close();

                ?>
                                </select>
                                <br>
                                <button type="submit" class="btn btn-default" onclick='hapusall();tampilkatwilayah()'><i class="fa fa-search"></i></button>
                
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" onclick="reset()">
                          <i class="fa fa-car"></i>
                          <span>Transportation</span>
                      </a>
                      <ul class="sub">
                          <div  class="panel-body" >
                          <select class="form-control" style="width: 90%;" id="pilihkend" >  
                          <option value="bus">Bus</option>
                          <option value="cars">Cars</option>
                          <option value="motor">Motorcycle</option>
                          </select>
                          <br>
                          <button type="submit" class="btn btn-default" id="carikategori"  value="cari" onclick='hapusall();pilihkendaraan()'><i class="fa fa-search"></i></button>
                      </ul>
                  </li>
               <li class="sub-menu">
                      <a href="javascript:;" onclick="reset()">
                          <i class="fa fa-bus"></i>
                          <span>Public Transportation</span>
                      </a>

                      <ul class="sub">
                      
                      
                          <div  class="panel-body" >
                          <a style="margin-top: -20px; color: white" ><span>Search by Majors</span></a>
                          <select class="form-control" style="width: 90%;" id="jurusan" >  
                          <?php
                                include("connect.php"); 
                                $angkot=pg_query("select * from angkot ");
                                while($rowangkot = pg_fetch_assoc($angkot))
                                {
                                echo"<option value=".$rowangkot['id'].">".$rowangkot['destination']."</option>";
                                }
                                ?>
                          </select>
                          <br>
                          <button type="submit" class="btn btn-default" id="carikategori"  value="cari" onclick='tampiljurusan();hapusall()'><i class="fa fa-search"></i></button>
                          </div>
                          <div class="panel-body">
                            <a style="margin-top: -20px; color: white" ><span>Nearby</span></a>
                            <input  type="range" onclick="hapusall();aktifkanRadiusAngkot();resultt();" id="inputradiusangkot" name="inputradiusangkot" data-highlight="true" min="0.5" max="15" value="0.5"> 
                          </div>
                      </ul>
                  </li>
                      </ul>
                  </li>
				  <li class="sub-menu">
                      <a class="active" href=".././">
                          <i class="fa fa-hand-o-left"></i>
                          <span>Dashboard</span>
                      </a>
                  </li>
<?php
 // skrip koneksi database
 	include('connect.php');
 $ip      = $_SERVER['REMOTE_ADDR']; // Mendapatkan IP komputer user
 $tanggal = date("Ymd"); // Mendapatkan tanggal sekarang
 $waktu   = time(); //
 // Mencek berdasarkan IPnya, apakah user sudah pernah mengakses hari ini
 $s = pg_query("SELECT * FROM statistika2 WHERE ip='$ip' AND tanggal='$tanggal'");
 
 // Kalau belum ada, simpan data user tersebut ke database
 if(pg_num_rows($s) == 0){
     pg_query("INSERT INTO statistika2 (ip, tanggal, hits, online) VALUES('$ip','$tanggal','1','$waktu')");
 }
 // Jika sudah ada, update
 else{
     pg_query("UPDATE statistika2  SET hits=hits+1, online='$waktu' WHERE ip='$ip' AND tanggal='$tanggal'");

 }
 $pengunjung       = pg_num_rows(pg_query("SELECT * FROM statistika2  WHERE tanggal='$tanggal' GROUP BY ip, hits, online, tanggal")); // Hitung jumlah pengunjung
 $totalpengunjung  = pg_result(pg_query("SELECT COUNT(hits) FROM statistika2 "), 0); // hitung total pengunjung
 $bataswaktu       = time() - 300;
 $pengunjungonline = pg_num_rows(pg_query("SELECT * FROM statistika2  WHERE online > '$bataswaktu'")); // hitung pengunjung online
 ?> 

 <li class="sub-menu">
                      <a href="javascript:;" onclick="list()" >    
                  </li> 
				</ul>
          </div>
      </aside>
      <section id="main-content">



          <section class="wrapper">

              <div class="row">
                <div class="col-lg-8 main-chart">    
                            
                  <!--PETA-->
                  <div class="row">                   
                      <div class="col-md-12 col-sm-12 mb">
                        <div class="white-panel pns">
      
                      <header class="panel-heading" style="float:left;">
                          <label style="color: black">Google Map with Location List</label>
                          <a class="btn btn-success" role="button" data-toggle="collapse" onclick="aktifkanGeolocation()" title="Current Position" style="margin-left:3px;"><i class="fa fa-map-marker" style="color:white;"></i></a>
                          <a class="btn btn-success" role="button" data-toggle="collapse" onclick="manualLocation()" title=" Manual Position" style="margin-left:3px;"><i class="fa fa-location-arrow" style="color:white;"></i></a> 
					                <label id="tombol" >
					                <a class="btn btn-success" role="button" id="showlegenda" data-toggle="collapse" onclick="legenda()" title="Legend" style="margin-left:3px;"><i class="fa fa-eye" style="color:white;"></i></a></label>  
                      </header>       
                           <div class="row">
                             <div class="col-sm-6 col-xs-6"></div>
                           </div>                        
                           <div id="map" class="centered" style="height:460px">
                           </div>
                  </div>
                </div>
                 </div>
                 <div id="view_data_tengah" class="row" style="display:none">
                      <div class="col-md-12 col-sm-12 mb">
                        <div class="white-panel pns" style="height:auto;padding-bottom:20px">
                           <div style="margin:0px 20px 10px 20px">
                             <h5 class="btn btn-compose bg-black" >Object Information</h5>
                           </div>
                      <div class="form-group">
                        <table class="table table-bordered" id='info'>
                        </table>  
                      </div>                   
                
              </div>
            </div>
          </div>
                 
                 </div>


                 <div id="result" class="col-md-4 col-sm-4 mb" style="margin-top:0px; display:block;">
                    <div class="white-panel pns" style="height:510px">
                           <div class="white-header" style="height:40px;margin:20px;background:white;color:black">
                             <h5 class="btn btn-compose" id="judul_table">Result</h5>
                           </div>
                           <div class="row">
                             <div class="col-sm-6 col-xs-6"></div>
                           </div>
                           <div style="height:410px; overflow-y: scroll; margin:20px;">
                              <table style="color:black" class="table table-bordered">
                                <tbody id='hasilcari'></tbody>
                              </table>
                           </div>
                        </div>
             
                 </div>
          
          <div id="view_table_sekitar" class="col-md-4 col-sm-4 mb" style="display:none;">
                        <div class="white-panel pns" style="height:510px">
                           <div class="white-header" style="height:40px;margin:20px;margin-top:0px;background:white;color:black">
                             <h5 class="btn btn-compose bg-black">Result</h5>
                           </div>
                           <div class="row">
                             <div class="col-sm-6 col-xs-6"></div>
                           </div>
                           <div style="height:410px; margin:20px; overflow-y: scroll;">
                              <table id="table_hotel" class="table table-bordered">
                                <tbody id='table_kanan_hotel' style='color:black'></tbody>
                              </table>  
                              <table id="table_tourism" class="table table-bordered">
                                <tbody id='table_kanan_tourism' style='color:black'></tbody>
                              </table>  
                              <table id="table_worship" class="table table-bordered">
                                <tbody id='table_kanan_worship' style='color:black'></tbody>
                              </table>  
                              <table id="table_souvenir" class="table table-bordered">
                                <tbody id='table_kanan_souvenir' style='color:black'></tbody>
                              </table>  
                              <table id="table_culinary" class="table table-bordered">
                                <tbody id='table_kanan_culinary' style='color:black'></tbody>
                              </table>  
                              <table id="table_industry" class="table table-bordered">
                                <tbody id='table_kanan_industry' style='color:black'></tbody>
                              </table>  
                              <table id="table_restaurant" class="table table-bordered">
                                <tbody id='table_kanan_restaurant' style='color:black'></tbody>
                              </table>  
                           </div>
                        </div>
                      </div>
         
          <div class="col-sm-8" style="display:none;" id="infoev">
    <section class="panel">
                    <div class="panel-body">
                        <a class="btn btn-compose">Information of Event</a>
                        <div class="box-body" style="max-height:350px;overflow:auto;">
             
                      <div class="form-group">
                        <table class="table" id='infoevent' align="center">
                        <tbody  style='vertical-align:top;'>
                        </tbody> 
                        </table>          
                      </div> 
                  </div>
                    </div>
                </section>
              </div>
                 <!-- GALLLERY  RECOMMENDASI TOURISM -->
                 <div id="populer" class="col-md-4 col-sm-4 mb" style="margin-top:0px; display:block;">
                 <div class="white-panel pns" style="height:510px">
                          <div class="white-header" style="height:40px;margin:20px;background:white;color:black">
                           <h5 class="btn btn-compose" id="judul_table" style = "background-color:black;border-bottom:black">
                            Popular Worship
                          </h5>
                        </div>
                  <div class="row">
                            <div class="col-sm-6 col-xs-6"></div>
                          </div>
                          <div style="height:410px; margin:20px;">
                            <div class="container2">
                              <div class="row2" >
                                <div class="mySlides">
                                  <a href="" onclick="galeri('M0013')"><img src="foto/M0013_7_masjid raya bkt.JPG" style="width:100%; height: 280px;"><div class="text bg-black">Masjid Raya Bukit Tinggi</div></a>
                                </div>
                                <div class="mySlides">
                                  <a href="" onclick="galeri('M0001')"><img src="foto/M0001_DARUSSALAM GURUN PANJANG.JPG" style="width:100%"><div class="text bg-black">Masjid Darussalam Gurun Panjang</div></a>
                                </div>
                                <div class="mySlides">
                                  <a href="" onclick="galeri('M0009')"><img src="foto/M0009_RAUDATUL JANNAH.JPG" style="width:100%"><div class="text bg-black">Masjid Raudatul Jannah</div></a>
                                </div>
                                <div class="mySlides">
                                  <a href="" onclick="galeri('M0012')"><img src="foto/M0012_NURUL HAQ.jpg" style="width:100%"><div class="text bg-black">Masjid Nurul Haq</div></a>
                                </div>
                                <a class="prev" onclick="plusSlides(-1)">❮</a>
                                <a class="next" onclick="plusSlides(1)">❯</a>
                              </div>  
                              <br>
                              <div class="row2">
                                <div class="column">
                                  <img class="demo cursor" src="foto/M0013_7_masjid raya bkt.JPG" style="width:100%" onclick="currentSlide(1)">
                                </div>
                                <div class="column">
                                  <img class="demo cursor" src="foto/M0001_DARUSSALAM GURUN PANJANG.JPG" style="width:100%" onclick="currentSlide(2)">
                                </div>
                                <div class="column">
                                  <img class="demo cursor" src="foto/M0009_RAUDATUL JANNAH.JPG" style="width:100%" onclick="currentSlide(3)">
                                </div>
                                <div class="column">
                                  <img class="demo cursor" src="foto/M0012_NURUL HAQ.jpg" style="width:100%" onclick="currentSlide(4)">
                                </div>

                                <a class="prev1" onclick="plusSlides(-1)">❮</a>
                                <a class="next1" onclick="plusSlides(1)">❯</a>
                              </div>
                            </div>
                            <table style="color:black" class="table table-bordered">
                              <tbody id='kanan_table'></tbody>
                            </table>
                            <script>
                              var slideIndex = 1;
                              showSlides(slideIndex);


                              function plusSlides(n) {
                                showSlides(slideIndex += n);
                              }

                              function currentSlide(n) {
                                showSlides(slideIndex = n);
                              }

                              function showSlides(n) {
                                var i;
                                var slides = document.getElementsByClassName("mySlides");
                                var dots = document.getElementsByClassName("demo");
                                var captionText = document.getElementById("caption");
                                if (n > slides.length) {slideIndex = 1}
                                if (n < 1) {slideIndex = slides.length}
                                for (i = 0; i < slides.length; i++) {
                                    slides[i].style.display = "none";
                                }
                                for (i = 0; i < dots.length; i++) {
                                    dots[i].className = dots[i].className.replace(" active", "");
                                }
                                slides[slideIndex-1].style.display = "block";
                                dots[slideIndex-1].className += " active";
                                }
                              </script>
                            </div>
                          </div>  
      
          </div>

          <div class="col-sm-8" style="display:none;" id="infoo1">
            <section class="panel">
              <div class="panel-body">
                <a class="btn btn-compose" style="background:black">Route Public Transportation</a>
                  <div class="box-body" style="max-height:350px;overflow:auto;">   
                    <div class="form-group">
                      <table class="table table-bordered" id='infoak'>
                      </table>            
                    </div>       
                  </div>
              </div>
            </section>
          </div>

        <div class="col-sm-8" style="display:none;" id="att1">  
          <section class="panel">
            <div class="panel-body" >
              <a class="btn btn-compose bg-black">Attraction Around Mosque</a>
                <div class="box-body" style="max-height:350px;overflow:auto;">         
                  <div class="form-group">
                    <table class="table table-bordered" id='info1'>
                    </table>   
                  </div>                  
              </div>
            </div>
          </section>
				</div>
          
				<div class="col-sm-4" style="display:none;" id="att2">
          <section class="panel">
				  	<div class="panel-body">
              <a class="btn btn-compose bg-black">Route</a>
            </div>

            <div id="rute" class='box-body' style="width:auto">
            </div>
          </section>
        </div>
      
    
    <div class="row mt" style="display:none;" id="showlist">  
    <?php 
    include 'connect.php';
    $sql = pg_query("SELECT * FROM worship_place");
     ?>
<?php
  $jml_kolom=3;
  $cnt = 1;
  while($data =  pg_fetch_assoc($sql)){
		if ($cnt >= $jml_kolom) 
		{
          echo "<div class='row mt mb'>";
		}
 
  ?>
  <div class="row-mt">
    <div class="col-lg-4 col-md-4 col-sm-8 col-xs-6 desc">
		<div class="project-wrapper">
			<div class="project">
				<div class="photo-wrapper">
					<div class="photo">
						<a class="fancybox" href="foto/<?php echo $data['image']; ?>"><img class="img-responsive" src="foto/<?php echo $data['image']; ?>" alt=""></a>
					</div>
					<div class="overlay"></div>
					<p style="color: #f3fff4"><?php echo $data['name']; ?><br><?php echo $data['address']; ?></p>
				</div>
			</div>      
		</div>      
	</div>
  </div>      
      
  <?php
  if ($cnt >= $jml_kolom) 
		{
          
          $cnt = 0;
		  echo "</div>";
		}
		$cnt++;
  }
  ?>
 

        </div>
      </div>

         
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

    <!--common script for all pages-->
	<script type="text/javascript">
        $(document).ready(function () {
        var unique_id = $.gritter.add({
            // (string | mandatory) the heading of the notification
            title: 'Visitor Statistics',
            // (string | mandatory) the text inside the notification
            text: ' <span>Today : <?php echo $pengunjung; ?> <br> Total : <?php echo $totalpengunjung; ?> <br> Online User : <?php echo $pengunjungonline; ?>	</span>',
            // (string | optional) the image to display on the left
            image: 'assets/img/1.ico',
            // (bool | optional) if you want it to fade out on its own or just sit there
            sticky: true,
            // (int | optional) the time you want it to be alive for before fading out
            time: '',
            // (string | optional) the class name you want to apply to that specific message
            class_name: 'my-sticky-class'
        });

        return false;
        });
	</script>
    
	  <script type="text/javascript">
      $(function() {
        //    fancybox
          jQuery(".fancybox").fancybox();
      });

  </script>
  <script type="text/javascript">
$('#inputradius').slider({
	formatter: function(value) {
		return value+' km';
		}
	});
$('[data-toggle="tooltip"]').tooltip();
</script>
  </body>
</html>
