<?php
   

  

      if(isset($_POST['save_record']))
      { 
          
          save_record();
      }
      else if(isset($_POST['none']))
      { 
          
      }
      
      
      function save_record()
      {
        
        include("../../db_con.php");
        //FOR STUDENT RECORD
        $stud_num = $_POST['stud_num'];
        $stud_lname = $_POST['stud_lname'];
        $stud_fname = $_POST['stud_fname'];
        $stud_sex = $_POST['stud_sex'];
        $stud_birthdate = $_POST['stud_birthdate'];
        $stud_course = $_POST['stud_course'];
        $stud_yrlvl = $_POST['stud_yrlvl'];
        $stud_email = $_POST['stud_email'];
        $stud_mobnum = $_POST['stud_mobnum'];

        if(empty($_POST['stud_lref_num']))
        {
          $stud_lref_num = NULL;
        }
        else
        {
          $stud_lref_num = $_POST['stud_lref_num'];
        }
        if(empty($_POST['stud_mdinit']))
        {
          $stud_mdinit = NULL;
        }
        else
        {
          $stud_mdinit = $_POST['stud_mdinit'];
        }
        if(empty($_POST['stud_zipcode']))
        {
          $stud_zipcode = NULL;
        }
        else
        {
          $stud_zipcode = $_POST['stud_zipcode'];
        }


        $insert = "INSERT INTO t_student_info (stud_number,
                                               stud_lref_num,
                                               stud_lastname,
                                               stud_givenname,
                                               stud_middleinit,
                                               stud_sex,
                                               stud_birthdate,
                                               stud_degree_prog,
                                               stud_year_level,
                                               stud_zipcode,
                                               stud_email_add,
                                               stud_mobile_number,
                                               stud_timestamp
                                               )     
                                         VALUES('$stud_num',
                                                '$stud_lref_num',
                                                '$stud_lname',
                                                '$stud_fname',
                                                '$stud_mdinit',
                                                '$stud_sex',
                                                '$stud_birthdate',
                                                '$stud_course',
                                                '$stud_yrlvl',
                                                '$stud_zipcode',
                                                '$stud_email',
                                                '$stud_mobnum',
                                                CURRENT_TIMESTAMP
                                               )";
              
        mysqli_query($connection,$insert);

        //FOR TRANSACTION
        $particular = $_POST['particular'];

        while (list($key,$val) = @each($particular))
        {
            $insert_condition = "INSERT INTO t_student_transact(strs_stud_num,
                                                             strs_prtclr_ref,
                                                             strs_timestamp)

                                                       VALUES('$stud_num', 
                                                               '$val', 
                                                                CURRENT_TIMESTAMP
                                                               )";
            mysqli_query($connection,$insert_condition); 
        }
         echo "<script type=\"text/javascript\">".
                  "alert
                  ('You have successfully submitted your form!');".
                 "</script>";
         echo "<script>setTimeout(\"location.href = '../../student_entry.php';\",0);</script>";
      }
     

?>


