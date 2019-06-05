<?php
  include('../../../db_con.php');

    $curdate = date('Y-m-d');
    $view_query = mysqli_query($connection,"SELECT * FROM `t_student_info` AS STUD
                                              INNER JOIN `r_courses` AS CORS 
                                              ON STUD.stud_degree_prog = CORS.course_ID
                                              INNER JOIN `t_student_transact` AS TRANSACT
                                              ON STUD.stud_number = TRANSACT.strs_stud_num
                                              INNER JOIN `r_particulars` AS PART
                                              ON TRANSACT.strs_prtclr_ref = PART.prtclr_ID
                                                WHERE date(stud_timestamp) = '$curdate'
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

