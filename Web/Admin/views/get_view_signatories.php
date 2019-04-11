<?php
	include("../../../db_con.php");
	
	$get_signatory1 = mysqli_query($connection,"SELECT * FROM `t_employees` WHERE emp_signatory = 'sig1'");
	while($row1 = mysqli_fetch_assoc($get_signatory1))
	{
		$sig1_fname = $row1["emp_firstname"];
		$sig1_mdinit = $row1["emp_middlename"];
		$sig1_lname = $row1["emp_lastname"];
		$sig1_pos = $row1["emp_position"];

		$sig1_compname = $sig1_fname.' '.$sig1_mdinit.' '.$sig1_lname;
	}

	$get_signatory2 = mysqli_query($connection,"SELECT * FROM `t_employees` WHERE emp_signatory = 'sig2'");
	while($row2 = mysqli_fetch_assoc($get_signatory2))
	{
		$sig2_fname = $row2["emp_firstname"];
		$sig2_mdinit = $row2["emp_middlename"];
		$sig2_lname = $row2["emp_lastname"];
		$sig2_pos = $row2["emp_position"];

		$sig2_compname = $sig2_fname.' '.$sig2_mdinit.' '.$sig2_lname;
	}
?>