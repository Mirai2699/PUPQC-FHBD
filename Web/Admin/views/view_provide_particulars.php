<?php
    
    include("../utilities/Header.php");
    include("../utilities/BaseJs.php");
    include("../utilities/Notification.php");
    include("../utilities/navibar.php");
    include("../utilities/Tables.php");


?>    
       <title>PUPQC-FHBD | On-Queue Transactions</title>
      <!--BEGIN WRAPPER-->
      <div class="wrapper row-offcanvas row-offcanvas-left">
      <!--BEGIN CONTENT-->
       <div class="content">
          <section class="main-content">
             <!--START BREADCRUMBS-->
             <div class="col-md-12">
                  <h2 style="margin-top: 15px">On-Queue Transaction</h2>
                  <div class="row" style="padding:1px; background-color: #666666; margin-bottom: 10px; width: 100%"></div> 
             </div>
            <!--END BREADCRUMBS-->
          <!--  <link type="text/css" rel="stylesheet" href="../../../resources-web/custom/realtime/jquery.dataTables.min.css">
           <link type="text/css" rel="stylesheet" href="../../../resources-web/custom/realtime/colReorder.dataTables.min.css">
           <script src="../../../resources-web/custom/realtime/jquery-3.3.1.js"></script>
           <script src="../../../resources-web/custom/realtime/dataTables.colReorder.min.js"></script>
           <script src="../../../resources-web/custom/realtime/jquery.dataTables.min.js"></script> -->

            <!--START INNER CONTENT-->


               <!--START TABLE-->     
              <div class="row" style="background-color: white">
                <div class="col-md-12" style="margin-top: 10px;">
                  <div class="box-info" >
                       
                        <!--adv-table start-->
                        <div id="TableBody">
                          
                        </div>
                        <!--adv-table end-->
                  </div>
                </div>
              </div>    

              <!--END TABLE-->

            <!--END INNER CONTENT-->


          </section>
       </div>
       <!--END CONTENT-->       
      </div>
      <!--END WRAPPER-->
   </body>
 <!--  <script type="text/javascript">
    setTimeout(function(){
      location = ''
    },15000)
  </script> -->

  <script type="text/javascript">
    function TableData(){
      $.ajax({
            url:'view_get_current_entry.php',
            type:'GET',
            async:false,
            success:function(data){
              $('#TableBody').empty();
              $('#TableBody').html(data);
            },
            error:function(){

            }
          });
    }

    $(document).ready(function(){
      TableData();
        // setInterval(function(){
        //   TableData();
        // },3000);
      });



    function changedetails() {

        $("#stud_number").prop("readonly", false);
        $("#stud_lref_num").prop("readonly", false);
        $("#stud_lname").prop("readonly", false);
        $("#stud_fname").prop("readonly", false);
        $("#stud_mdint").prop("readonly", false);
        $("#stud_yrlvl").prop("readonly", false);
        $("#stud_course").prop("readonly", false);
        $("#stud_bday").prop("readonly", false);
        $("#stud_sex").prop("readonly", false);
        $("#stud_mobnum").prop("readonly", false);
        $("#stud_email").prop("readonly", false);
        $("#stud_zipcode").prop("readonly", false);

        $("#btn-change").hide();
        $("#btn-save").show();
        $("#btn-cancel").show();

      }

  function cancelchange() {

      $("#stud_number").prop("readonly", true);
      $("#stud_lref_num").prop("readonly", true);
      $("#stud_lname").prop("readonly", true);
      $("#stud_fname").prop("readonly", true);
      $("#stud_mdint").prop("readonly", true);
      $("#stud_yrlvl").prop("readonly", true);
      $("#stud_course").prop("readonly", true);
      $("#stud_bday").prop("readonly", true);
      $("#stud_sex").prop("readonly", true);
      $("#stud_mobnum").prop("readonly", true);
      $("#stud_email").prop("readonly", true);
      $("#stud_zipcode").prop("readonly", true);

      $("#btn-change").show();
      $("#btn-save").hide();
      $("#btn-cancel").hide();

    }
    </script>

</html>

