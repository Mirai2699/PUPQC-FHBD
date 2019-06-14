<?php
  include('../../../db_con.php');

    $curdate = date('Y-m-d');
    $view_query = mysqli_query($connection,"SELECT * FROM `t_student_info` AS STUD
                                              INNER JOIN `r_courses` AS CORS 
                                              ON STUD.stud_degree_prog = CORS.course_ID
                                                WHERE date(stud_timestamp) = '$curdate'
                                                and stud_transact_stat = 'PENDING'
                                                ORDER BY STUD.stud_ID ASC 
                                                LIMIT 100");
    while($row = mysqli_fetch_assoc($view_query))
    {
        $stud_ID = $row['stud_ID'];
        $stud_number = $row['stud_number'];
        $stud_lref_num = $row['stud_lref_num'];
        $stud_lname = $row['stud_lastname'];
        $stud_fname = $row['stud_givenname'];
        $stud_mdinit = $row['stud_middleinit'];
        
       

        echo 
        '
          <tr>
            <td style="display:none">'.$stud_ID.'</td>
            <td>'.$stud_number.'</td>
            <td>'.$stud_lref_num.'</td>
            <td>'.$stud_lname.'</td>
            <td>'.$stud_fname.'</td> 
            <td>'.$stud_mdinit.'</td>
			<td><form method="GET" action="view_provide_transaction.php">
						<input type="hidden" name="stud_id" value='.$stud_ID.'>
						
				<button class="btn btn-warning" type="submit">View Transaction</button>
			</form></td>
            
        ';
        


    } 
?>

