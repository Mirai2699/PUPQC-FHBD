<?php
    include('../../../db_con.php');

    if(isset($_POST['acc_reg']))
      { 
          
          
          $code_ret = mysqli_query($connection, "SELECT MAX(emp_ID) FROM t_employees");
          $getrow = mysqli_fetch_array($code_ret);
          $lastcount = $getrow[0];
          $finalID = $lastcount + 1;


          $emp_lname = $_POST['emp_lname'];
          $emp_mname = $_POST['emp_mname'];
          $emp_fname = $_POST['emp_fname'];
          $emp_off = $_POST['emp_off'];
          $emp_pos = $_POST['emp_pos'];
          $emp_pic = $_POST['emp_pic'];

          $acc_username = $_POST['acc_username'];
          $acc_password = $_POST['acc_password'];
          $acc_usr = $_POST['acc_usr'];


          $insertemp = "INSERT INTO t_employees (emp_lastname, emp_middlename, emp_firstname, emp_office, emp_position, emp_picture)     
                     VALUES ('$emp_lname', '$emp_mname', '$emp_fname', '$emp_off', '$emp_pos', '$emp_pic')";

          $insertacc = "INSERT INTO t_accounts (acc_empID, acc_username, acc_password, acc_user_role)     
                     VALUES ('$finalID', '$acc_username', '$acc_password', '$acc_usr')";
            
           mysqli_query($connection,$insertemp);   
           mysqli_query($connection,$insertacc);

           echo "<script type=\"text/javascript\">".
                    "alert
                    ('You have successfully registered an account');".
                   "</script>";
           echo "<script>setTimeout(\"location.href = '../views/manage_users.php';\",0);</script>";

      }


    else if(isset($_POST['add_office']))
      { 
          
          $office_name = $_POST['office_name'];

          $insert = "INSERT INTO r_office (office_name 
                                          )     
                                   VALUES ('$office_name'
                                          )";
                
          mysqli_query($connection,$insert);

           echo "<script type=\"text/javascript\">".
                    "alert
                    ('You have successfully added an office!');".
                   "</script>";
           echo "<script>setTimeout(\"location.href = '../views/manage_department.php';\",0);</script>";

      }

      else if(isset($_POST['add_particular']))
      { 
          add_particular();
      }
      function add_particular()
      {

        include('../../../db_con.php');

        $part_desc = $_POST['part_desc'];
        $part_amount = $_POST['part_amount'];

        $insert = "INSERT INTO r_particulars   (prtclr_desc,
                                                prtclr_amount,
                                                prtclr_timestamp
                                                )     
                                         VALUES ('$part_desc',
                                                 '$part_amount',
                                                 CURRENT_TIMESTAMP
                                                )";
              
        mysqli_query($connection,$insert);

         echo "<script type=\"text/javascript\">".
                  "alert
                  ('You have successfully added a particular!');".
                 "</script>";
         echo "<script>setTimeout(\"location.href = '../views/manage_particulars.php';\",0);</script>";
      }

      
?>


