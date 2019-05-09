<?php
  include('../../../db_con.php');

    $curdate = date('Y-m-d');
    $view_query = mysqli_query($connection,"SELECT * FROM `t_student_info` AS STUD
                                              INNER JOIN `r_courses` AS CORS 
                                              ON STUD.stud_degree_prog = CORS.course_ID
                                                WHERE date(stud_timestamp) = '$curdate'
                                                and stud_transact_stat = 'PENDING'
                                                ORDER BY STUD.stud_ID ASC 
                                                LIMIT 1");
    if(mysqli_num_rows($view_query) > 0)
    {
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
           



            echo 
            '
            <form action="../../functionalities/save_record.php" method="POST">
             <div class="col-md-7" style="border-radius: 15px; background-color: #fafafa ; margin-bottom:20px; border: 1px solid black;">

               <div class="panel-heading" style="background-color: #666666; border-radius:15px">
                 <h4 style="color: white; font-size: 25px">Student Details:</h4>
                 <div class="row" style="padding:1px; background-color:white;"></div>
               </div>
               <br>
              <input type="hidden" name="ID" value="'.$stud_ID.'" />
               <div class="row" style="margin-top:10px;">
                  <div class="col-md-6">
                      <label style="font-weight:bold; font-size:14px">Student Number:</label>
                      <input id="stud_number" type="text" class="form-control" name="stud_number" style="font-size:15px; color:black" value="'.$stud_number.'" readonly/>
                  </div>
                  <div class="col-md-6">
                      <label style="font-weight:bold; font-size:14px">Learners Reference Number:</label>
                      <input id="stud_lref_num" type="text" class="form-control" name="stud_lref_num" style="font-size:15px; color:black" value="'.$stud_lref_num.'" readonly/>
                  </div>
               </div>

               <div class="row" style="margin-top:10px;">
                  <div class="col-md-6">
                      <label style="font-weight:bold; font-size:14px">Last Name:</label>
                      <input id="stud_lname" type="text" class="form-control" name="stud_lname" style="font-size:15px; color:black" value="'.$stud_lname.'" readonly/>
                  </div>
                  <div class="col-md-4">
                      <label style="font-weight:bold; font-size:14px">Given Name:</label>
                      <input id="stud_fname" type="text" class="form-control" name="stud_fname" style="font-size:15px; color:black" value="'.$stud_fname.'" readonly/>
                  </div>
                  <div class="col-md-2">
                      <label style="font-weight:bold; font-size:14px">Middle Initial:</label>
                      <input id="stud_mdint" type="text" class="form-control" name="stud_mdint" style="font-size:15px; color:black" value="'.$stud_mdinit.'" readonly/>
                  </div>
               </div>

               <div class="row" style="margin-top:10px;">
                  <div class="col-md-3">
                      <label style="font-weight:bold; font-size:14px">Sex:</label>
                      <select id="stud_sex" class="form-control" name="stud_sex" required style="font-size: 15px" readonly>
                          <option value="'.$stud_sex.'" selected>'.$stud_sex.'</option>
                          <option value="Male">Male</option>
                          <option value="Female">Female</option>
                      </select>
                  </div>
                  <div class="col-md-3">
                      <label style="font-weight:bold; font-size:14px">Birthdate:</label>
                      <input id="stud_bday" type="date" class="form-control" name="stud_bday" style="font-size:15px; color:black" value="'.$stud_bday.'" readonly/>
                  </div>
                  <div class="col-md-3">
                      <label style="font-weight:bold; font-size:14px">Course:</label>
                      <select id="stud_course" class="form-control" name="stud_course" style="font-size: 18px" readonly>
                          <option value="'.$stud_course.'"> '.$course_code.'</option>';
                          
                              $get_course = mysqli_query($connection, "SELECT * FROM `r_courses` WHERE course_status = 'Active'");
                              while($row = mysqli_fetch_assoc($get_course))
                              {
                                  $course_ID = $row['course_ID'];
                                  $course_code = $row['course_code'];
                                  $course_desc = $row['course_desc'];

                               echo '
                                      <option value="'.$course_ID.'">'.$course_code.'</option>
                                    ';
                             }
                  echo'    
                      </select>

                  </div>
                   <div class="col-md-3">
                      <label style="font-weight:bold; font-size:14px">Year-Level:</label>
                      <input id="stud_yrlvl" type="number" class="form-control" name="stud_yrlvl" style="font-size:15px; color:black" value="'.$stud_yrlvl.'" min="3" max="4" readonly/>
                  </div>
               </div>

                <div class="row" style="margin-top:10px;">
                  <div class="col-md-6">
                      <label style="font-weight:bold; font-size:14px">Email Address:</label>
                      <input id="stud_email" type="text" class="form-control" name="stud_email" style="font-size:15px; color:black" value="'.$stud_email.'" readonly/>
                  </div>
                  <div class="col-md-4">
                      <label style="font-weight:bold; font-size:14px">Mobile Number:</label>
                      <input id="stud_mobnum" type="text" class="form-control" name="stud_mobnum" style="font-size:15px; color:black" value="'.$stud_mobnum.'" readonly/>
                  </div>
                  <div class="col-md-2">
                      <label style="font-weight:bold; font-size:14px">Zipcode:</label>
                      <input id="stud_zipcode" type="text" class="form-control" name="stud_zipcode" style="font-size:15px; color:black" value="'.$stud_zipcode.'" readonly/>
                  </div>
                  
               </div>
               <div class="row" style="margin-bottom: 10px">
               </div>
               <div class="panel" style="background-color:#262626; padding: 1px;"></div>
               <div class="col-md-12" style="text-align: right">
                    <button id="btn-change" type="button" class="btn btn-warning" style="font-size: 15px; margin-bottom: 20px" onclick="changedetails();">
                       <i class="fa fa-edit"></i>
                       Change Details
                    </button>

                   <button id="btn-save" type="submit" class="btn btn-success" style="display:none; font-size: 15px; margin-bottom: 20px" name="change_stud_details">
                      <i class="fa fa-save"></i>
                      Save Details
                   </button>

                   <button id="btn-cancel" type="button" class="btn btn-danger" style="display:none; font-size: 15px; margin-bottom: 20px" onclick="cancelchange();">
                      <i class="fa fa-times"></i>
                      Cancel
                   </button>

               </div>
             </div>



            <form action="../../functionalities/save_record.php" method="POST">
                 <div class="col-md-4" style="border-radius: 15px; background-color: #eeefff; margin-bottom:20px; margin-left: 20px; border: 1px solid black;">
                    <div class="panel-heading" style="background-color: maroon; border-radius:15px">
                      <h4 style="color: white; font-size: 25px">Select Particulars:</h4>
                      <div class="row" style="padding:1px; background-color:white;"></div>
                    </div>
                    <br>
                    <input type="hidden" name="stud_num" value="'.$stud_number.'" />
                    <div class="row">
            ';
                    $view_particulars = mysqli_query($connection, "SELECT * FROM `r_particulars` WHERE prtclr_status = 'Active'");
                        $total = 0;
                        while($row_part = mysqli_fetch_array($view_particulars))
                        {
                            $prtclr_ID = $row_part['prtclr_ID'];
                            $prtclr_desc = $row_part['prtclr_desc'];
                            $prtclr_amount = $row_part['prtclr_amount'];
                            echo 
                            '   
                             <div style="margin-left: 10px">
                                <input type="checkbox" name="particular[]" style="width: 30px; height: 20px;" value="'.$prtclr_ID.'" />
                                <label style="font-size: 17px; font-weight:bold; color: #6e6e6e">'.$prtclr_desc.'</label>
                             </div>
                                
                            ';
                        }

            echo
                '   
                    <div class="panel" style="background-color:#262626; padding: 1px;"></div>
                    <div class="col-md-12" style="text-align: right">
                        <button type="submit" name="on_queue_save" class="btn btn-success" style="font-size: 15px; margin-bottom: 20px">
                           <i class="fa fa-save"></i>
                           Save Details
                        </button>
                    </div>
                    </div>
                 </div>
            </form>
                ';
        }
         

    }
    else
    {
      echo
      ' 
        <center>
        <div class="col-md-12" style="border-radius:15px; background-color: #eeeeee; margin-bottom: 30px; ">
            <div class="panel" style="background-color:#6e6e6e; padding:1px; margin-top: 20px"></div>
            <p style="color:#262626; font-size:30px">There are no on-queue transaction as of now.</p>
            <a href="" style="font-size:18px; margin-bottom: 10px; border-radius: 15px" class="btn btn-primary" >
                <i class="fa fa-refresh"></i>
                Refresh Now
            </a>

            <div class="panel" style="background-color:#6e6e6e; padding:1px"></div>
        </div>
        </center>
      ';
    }
    
   
    
?>

