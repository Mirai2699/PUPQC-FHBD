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
                  <h2 style="margin-top: 15px">Recorded Transactions</h2>
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
                        <div class="panel-heading" style="background-color: #666666; ">
                          <h4 style="color: white; font-size: 25px">View Student Records</h4>
                          <div class="row" style="padding:1px; background-color:white;"></div>
                        </div>
                        <div class="panel" style="background-color:#8c8c8c">

                               <label style="color: white; font-size: 19px; margin-left: 15px">Action Available:</label><br>
                               <form method="POST" action="../functionalities/excel_export_past_record.php">
                                 <button type="button" class="btn btn-info" onclick="print();" style="font-size: 16px; margin-top: 1px; margin-left: 15px">
                                    <i class="fa fa-print"></i>
                                    Print Records
                                 </button>

                               
                                 <button class="btn btn-success" type="submit" id="btnExport" name="export" value="Export to Excel" style="font-size: 16px; margin-top: 1px; margin-left: 15px; background-color: green">
                                    <i class="fa fa-file-excel"></i>
                                    Export Excel File
                                 </button>
                               </form>

                               <div class="row" style="padding: 5px"></div>
                        </div>
                        <br>
                        <!--adv-table start-->
                        <div class="adv-table">
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
                                <th>Particulars</th>
                                <th>Total OSF</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php
                                $curdate = date('Y-m-d');
                                $view_query = mysqli_query($connection,"SELECT * FROM `t_student_info` AS STUD
                                                                          INNER JOIN `r_courses` AS CORS 
                                                                          ON STUD.stud_degree_prog = CORS.course_ID
                                                                          INNER JOIN `t_student_transact` AS TRANSACT
                                                                          ON STUD.stud_number = TRANSACT.strs_stud_num
                                                                          INNER JOIN `r_particulars` AS PART
                                                                          ON TRANSACT.strs_prtclr_ref = PART.prtclr_ID
                                                                            GROUP BY STUD.stud_number
                                                                            ORDER BY STUD.stud_ID DESC ");
                                while($row = mysqli_fetch_assoc($view_query))
                                {
                                    $stud_ID = $row['stud_ID'];
                                    $stud_number = $row['stud_number'];
                                    $stud_lref_num = $row['stud_lref_num'];
                                    $stud_lname = $row['stud_lastname'];
                                    $stud_fname = $row['stud_givenname'];
                                    $stud_mdinit = $row['stud_middleinit'];
                                    $stud_sex = $row['stud_sex'];
                                    $stud_bday = $row['stud_birthdate'];
                                    $stud_course = $row['stud_degree_prog'];
                                    $stud_yrlvl = $row['stud_year_level'];
                                    $stud_zipcode = $row['stud_zipcode'];
                                    $stud_email = $row['stud_email_add'];
                                    $stud_mobnum = $row['stud_mobile_number'];
                                    //course code
                                    $course_code = $row['course_code'];

                                    //Transactions
                                    $particular = $row['prtclr_amount'];

                                    echo 
                                    '
                                      <tr>
                                        <td style="display:none">'.$stud_ID.'</td>
                                        <td>'.$stud_number.'</td>
                                        <td>'.$stud_lref_num.'</td>
                                        <td>'.$stud_lname.'</td>
                                        <td>'.$stud_fname.'</td> 
                                        <td>'.$stud_mdinit.'</td>
                                        <td>'.$stud_sex.'</td> 
                                        <td>'.$stud_bday.'</td> 
                                        <td>'.$course_code.'</td>
                                        <td>'.$stud_yrlvl.'</td> 
                                        <td>'.$stud_zipcode.'</td>
                                        <td>'.$stud_email.'</td>
                                        <td>'.$stud_mobnum.'</td>
                                    ';
                                   $get_amount = mysqli_query($connection, "SELECT * FROM `r_particulars` AS PART 
                                                                                     INNER JOIN `t_student_transact` AS TRANS 
                                                                                     ON PART.prtclr_ID = TRANS.strs_prtclr_ref
                                                                                   WHERE TRANS.strs_stud_num = '$stud_number'");

                                   $total_amount = 0;
                                   $comp_prtclr = '';
                                   while($row_part = mysqli_fetch_assoc($get_amount))
                                   {
                                     $part_amount = $row_part['prtclr_amount'];
                                     $part_abbrv = $row_part['prtclr_abbrv'];            
                                     if($comp_prtclr == NULL)
                                     {
                                       $coma = '';
                                     }
                                     else 
                                     {
                                       $coma = ', ';
                                     }

                                     $total_amount = $total_amount + $part_amount;
                                     $comp_prtclr = $comp_prtclr.''.$coma.''.$part_abbrv;
                                   }
                                   
                                   echo
                                   '   
                                       <td style="width:10%">'.$comp_prtclr.'</td>
                                       <td>₱ '.$total_amount.'</td>
                                      </tr>
                                    ';


                                } 
                            ?>
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
       <?php include("records_printable.php");?>       
      </div>
      <!--END WRAPPER-->
   </body>
   <script src="../../../resources-web/custom/jasonday-printThis-edc43df/printThis.js"></script>
   <script type="text/javascript">
     function print()
     {
       $('#demo').printThis({
          debug: false,               // show the iframe for debugging
          importCSS: true,            // import page CSS
          importStyle:true,           // import style tags
          printContainer: true,       // grab outer container as well as the contents of the selector
          //loadCSS: "",              // path to additional css file - use an array [] for multiple
          pageTitle: "",              // add title to print page
          removeInline: false,        // remove all inline styles from print elements
          printDelay: 333,            // variable print delay
          header: null,               // prefix to html
          footer: " ",               // postfix to html
          base: false ,               // preserve the BASE tag, or accept a string for the URL
          formValues: true,           // preserve input/form values
          canvas: false,              // copy canvas elements (experimental)
          doctypeString: null,        // enter a different doctype for older markup
          removeScripts: false,       // remove script tags from print content
          copyTagClasses: false       // copy classes from the html & body tag
        });
     }
   </script>
</html>

