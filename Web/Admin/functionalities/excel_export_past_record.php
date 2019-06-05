<?php
  ob_start();
  include('DBController.php');
  $db_handle = new DBController();


  $custom_query = "SELECT `stud_number` AS Student_No, 
                          `stud_lref_num` AS Learners_Reference_No,
                          `stud_lastname` AS Last_Name,
                          `stud_givenname` AS Given_Name,
                          `stud_middleinit` AS Middle_Initial,
                          `stud_sex` AS Sex,
                          `stud_birthdate` AS Birthdate,
                          `course_code` AS Degree_Program,
                          `stud_year_level` AS Year_Level,
                          `stud_zipcode` AS Zipcode,
                          `stud_email_add` AS Email_Address,
                          `stud_mobile_number` AS Mobile_No

                          FROM `t_student_info` AS STUD
                          INNER JOIN `r_courses` AS CORS
                          ON STUD.stud_degree_prog = CORS.course_ID
                          ORDER BY STUD.stud_lastname
                                                                            
                    
                       

  ";
   $customquery_execute = $db_handle->runQuery($custom_query); 

  if (isset($_POST["export"])) {

      $filename = "FHBD_student_list.xls";
      header("Content-Type: application/vnd.ms-excel");
      header("Content-Disposition: attachment; filename=\"$filename\"");
      $isPrintHeader = false;

    
      if (! empty($customquery_execute)) {
          foreach ($customquery_execute as $row) {
              if (! $isPrintHeader) {
                  echo implode("\t", array_keys($row)) . "\n";
                  $isPrintHeader = true;
              }
              echo implode("\t", array_values($row)) . "\n";
          }
      }
     
      
      exit();
  }
  ob_flush();
?>