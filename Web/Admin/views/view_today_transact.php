<?php
    
    include("../utilities/Header.php");
    include("../utilities/BaseJs.php");
    include("../utilities/Notification.php");
    include("../utilities/navibar.php");
    include("../utilities/Tables.php");


?>    
       <title>PUPQC-FHBD | View Today's Transaction</title>
      <!--BEGIN WRAPPER-->
      <div class="wrapper row-offcanvas row-offcanvas-left">
      <!--BEGIN CONTENT-->
       <div class="content">
          <section class="main-content">
             <!--START BREADCRUMBS-->
             <div class="col-md-12">
                  <h2 style="margin-top: 15px">Today's Transactions</h2>
                  <div class="row" style="padding:1px; background-color: #666666; margin-bottom: 10px; width: 100%"></div> 
                  <button name="create_excel" id="create_excel" class="btn btn-success">Create Excel File</button>  
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
                        <div class="panel-heading" style="background-color: #666666; ">
                          <h4 style="color: white; font-size: 25px">View Student Records</h4>
                          <div class="row" style="padding:1px; background-color:white;"></div>
                        </div>
                        <br>
                        <!--adv-table start-->
                        <div id="employee_table" class="adv-table">
                         <table id="datatables" class="table table-striped table-no-border" style="font-size: 12px">
                            <thead>
                            <tr>
                                <th style="display:none">ID</th>
                                <th>Student Number</th>
                                <th>Learner's Ref Number</th>
                                <th>Last Name</th>
                                <th>Given Name</th>
                                <th>Middle Initial</th>
                                <th>Sex</th>
                                <th>Birthdate</th> 
                                <th>Degree Program</th>
                                <th>Year Level</th>
                                <th>Zipcode</th>
                                <th>Email</th>
                                <th>Phone Number</th>
 
                                <?php
                                    $get_amount = mysqli_query($connection, "SELECT * FROM `r_particulars` WHERE prtclr_status = 'Active'");
                                    while($row_part = mysqli_fetch_assoc($get_amount))
                                    {
                                      $part_desc = $row_part['prtclr_desc'];
                                      echo
                                      '
                                        <th>'.$part_desc.'</th>
                                      ';
                                    }
                                ?>  
                                <th>Total OSF</th>
                            </tr>
                            </thead>
                            <tbody id="TableBody">
                              
                            </tbody>
                          </table>
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
            url:'view_get_table.php',
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
        setInterval(function(){
          TableData();
        },5000);
      });


    $(document).ready(function(){
      $('#create_excel').click(function(){
          var excel_data = $('#employee_table').html();
          var page = "../functionalities/excel.php?data=" + excel_data;
          window.location = page;
      })
      });

    </script>

</html>

