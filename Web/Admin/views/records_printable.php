<!-- <link href="../../../resources/custom/print_format.css" media="print" rel="stylesheet" /> -->
<style type="text/css">
  @page {
    size:landscape;

    margin-top: 0.5in; 
    margin-left: 0.5in;
    margin-right: 0.5in;
    margin-bottom: 0.7in;
   
  }
  hr {
     border: none; 
     border-bottom: 2px solid black;
  }
  table {
    border-collapse: collapse;
  }

  .table_custom{
    border: 1px solid black;
  }

</style>


<div style="display: none">
  <div id="demo" class="panel-body" style="color: black">
     <!-- begin panel-body -->
     <!--For Details-->
     
     <!--For Details-->
     <div class="panel" style="font-family: times new roman;">
        <hr>
        <p style="font-size: 25px; text-align: right">
          Form 2b
        </p>
        <p style="font-size: 14px; text-align: center">
           Republic of the Philippines<br>
           <i><b>Polytechnic University of the Philippines</b>s</i><br>
           <i><b>Quezon City Branch</b>s</i><br>
           <i>Don Fabian St., Brgy. Commonwealth, Quezon City</i><br>
        </p>
        <p style="text-align: center">
          <h2 style="text-align: center">FREE HE BILLING DETAILS</h2>
        </p>
        <!--adv-table start-->
        <div class="adv-table">
          <center>
            <table class="table_custom" style="font-size: 11px;">
            <thead class="table_custom">
            <tr>
                <th style="display:none">ID</th>
                <th class="table_custom">Student<br> Number</th>
                <th class="table_custom">Learner's<br> Ref Number</th>
                <th class="table_custom">Last<br> Name</th>
                <th class="table_custom">Given<br> Name</th>
                <th class="table_custom">Middle<br> Initial</th>
                <th class="table_custom">Sex</th>
                <!-- <th>Birthdate</th> -->
                <th class="table_custom">Degree<br> Program</th>
                <th class="table_custom">Year Level</th>
                <th class="table_custom">Zipcode</th>
                <th class="table_custom">Email<br>Address</th>
                <th class="table_custom">Phone <br>Number</th>
                <th class="table_custom">Particulars</th>
                <th class="table_custom">Total <br>OSF</th>
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
                        <td class="table_custom">'.$stud_number.'</td>
                        <td class="table_custom">'.$stud_lref_num.'</td>
                        <td class="table_custom">'.$stud_lname.'</td>
                        <td class="table_custom">'.$stud_fname.'</td> 
                        <td class="table_custom">'.$stud_mdinit.'</td>
                        <td class="table_custom">'.$stud_sex.'</td> 
                        <td class="table_custom">'.$course_code.'</td>
                        <td class="table_custom">'.$stud_yrlvl.'</td> 
                        <td class="table_custom">'.$stud_zipcode.'</td>
                        <td class="table_custom">'.$stud_email.'</td>
                        <td class="table_custom">'.$stud_mobnum.'</td>
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
                        <td class="table_custom">'.$comp_prtclr.'</td>
                        <td class="table_custom">₱ '.$total_amount.'</td>
                      </tr>
                    ';


                } 
                echo
                ' <tr>
                    <td class="table_custom" colspan="17">
                      <b>OVER-ALL TOTAL - SEGMENT B OF OSF</b>
                    </td>
                  </tr>
                ';
            ?>
            </tbody>
            </table>
          </center>
        </div>
        <!--adv-table end-->
       
        <br>
        <?php include("get_view_signatories.php"); ?>
        <table>
          <tbody>
            <tr>
              <td style="width: 270px">
                <div class="col-md-4">
                  <p style="font-size: 15px; margin-top:30px; margin-bottom: 20px">
                    Prepared By:<br><br><br><br>
                    <b><?php echo $sig1_compname?></b><br>
                    <i><?php echo $sig1_pos?></i>
                  </p>
                </div>
              </td>
              <td style="width: 400px">
                <div class="col-md-4">
                  <p style="font-size: 15px; margin-top:30px; margin-bottom: 20px">
                    Reviewed By:<br><br><br><br>
                    <b><?php echo $sig2_compname?></b><br>
                    <i><?php echo $sig2_pos?>, PUP Quezon City Branch</i>
                  </p>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
       
     </div>
     <!-- end panel-body -->
  </div>
</div>