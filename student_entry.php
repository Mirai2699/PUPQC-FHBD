<?php include("db_con.php");?>
<!DOCTYPE html>
<html lang="en">
    <head>
        
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="" name="description">
        <meta content="" name="author">
        <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400italic,400,300,700">
        <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Squada+One">
        <link type="text/css" rel="stylesheet" href="resources-web/global/plugins/font-awesome/css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="resources-web/global/plugins/ionicons/css/ionicons.min.css">
        <link type="text/css" rel="stylesheet" href="resources-web/global/plugins/simple-line-icons/simple-line-icons.css">
        <link type="text/css" rel="stylesheet" href="resources-web/global/plugins/animate.css/animate.css">
        <link type="text/css" rel="stylesheet" href="resources-web/global/plugins/iCheck/skins/all.css">
        <link type="text/css" rel="stylesheet" href="resources-web/global/css/style.css">
        <link type="text/css" rel="stylesheet" href="resources-web/assets/css/page-demo.css">
        <link type="text/css" rel="stylesheet" href="resources-web/assets/css/style-admin.css">
        <link type="text/css" rel="stylesheet" href="resources-web/assets/css/style-plugins.css">
        <link type="text/css" rel="stylesheet" href="resources-web/assets/css/style-responsive.css">
        <link type="text/css" rel="stylesheet" href="resources-web/assets/css/themes/default.css" id="theme-color">
        <link rel="icon" href="resources-web/images/PUPLogo.png">
    </head>


      <title>PUPQC-FHBD | Student's Form</title>
      <body class="page-header-fixed page-sidebar-fixed page-layout-full-width" style="background-color: #e6e6e6" >
        <div>
          <div class="page-wrapper" >
            <!--BEGIN HEADER-->
            <header class="header">
              <!--START LOGO-->
              <div class="logo">
                <p data-toggle="modal" href="#about_us" class="logo-text">
                  <img src="resources-web/images/dtslogo.png" style="width:100%; margin: 1%;" alt="">
                </p>
              </div>
              <!--END LOGO-->
              <nav role="navigation" class="navbar navbar-static-top" style="background-color:#7c0d08">
                <div class="navbar-right">
                  <ul class="nav navbar-nav">
                    <li class="dropdown dropdown-user menu-user">
                      <a href="#" data-toggle="dropdown" class="dropdown-toggle">
                        <img src="resources-web/images/PUPlogo.png" alt="User Image" class="img-circle"/>
                        <span class="hidden-xs" style="color: white">
                        </span>&nbsp;
                        <b class="caret"></b>
                      </a>
                      <ul class="dropdown-menu">
                        <li>
                          <a href="index.php">
                            <i class="fa fa-sign-out"></i>&nbsp;&nbsp;Sign In
                          </a>
                        </li>
                      </ul>
                    </li>
                  </ul>
                </div>
              </nav>
              <!--MODAL INCLUDES-->
             
              <!--MODAL INCLUDES-->
            </header>
            
            <!--END HEADER-->
      <!--END HORIZONTAL SIDEBAR-->

      <!--BEGIN WRAPPER-->
      <div class="wrapper row-offcanvas row-offcanvas-left" >
      <!--BEGIN CONTENT-->
       <div class="content">
          <section class="main-content" style="background-color: #e6e6e6" >
             <!--START BREADCRUMBS-->
             <div class="col-md-12" style="text-align: center">
                 <h1 style="margin-top: 5px">FREE Higher Education Billing Form</h1>
                 <div class="row" style="padding:2px; background-color: #666666; margin-bottom: 10px;"></div> 
             </div>
            <!--END BREADCRUMBS-->

           
            <!--START FORM CONTENT-->
            <section class="main-content" style="background-color: #e6e6e6;" >
               <form action="Web/functionalities/save_record.php" method="POST">
                <div class="col-md-11" style="border-radius: 15px; background-color: white; margin-left: 5%">
                    <div class="col-md-12" style="font-size: 18px">

                        <p style="margin-top: 10px; font-size: 20px">
                            <b>Instructions:</b><br>
                            Fill-Out the following fields. Fields marked with " <span style="color: red">*</span> " is required.
                        </p>
                        <div class="panel" style="padding: 1px; background-color: #262626"></div>
                        <!--FIRST LEVEL-->
                        <div class="col-md-12" style="margin: 10px">
                            <div class="col-md-6">
                                <label><b>Student Number:</b></label> &nbsp;<span style="color: red">*</span>
                                <input id="s_num" type="text" class="form-control" name="stud_num" placeholder="XXXX-XXXXX-XX-X" maxlength="15" required style="font-size: 18px">
                            </div>
                            <div class="col-md-6">
                                <label><b>Learner's Reference Number:</b></label> 
                                <input id="s_lref_num" type="text" class="form-control" name="stud_lref_num" style="font-size: 18px">
                            </div>
                        </div>
                        <!--SECOND LEVEL-->
                        <div class="col-md-12" style="margin: 10px">
                           <div class="col-md-5">
                               <label><b>Last Name:</b></label> &nbsp;<span style="color: red">*</span>
                               <input id="s_lname" type="text" class="form-control" name="stud_lname" required style="font-size: 18px">
                           </div>
                           <div class="col-md-4">
                               <label><b>Given Name:</b></label> &nbsp;<span style="color: red">*</span>
                               <input id="s_fname" type="text" class="form-control" name="stud_fname" required style="font-size: 18px">
                           </div>
                           <div class="col-md-3">
                               <label><b>Middle Initial:</b><small>   (Optional)</small></label>
                               <input id="s_mdinit" type="text" class="form-control" name="stud_mdinit" maxlength="2" style="font-size: 18px">
                           </div>
                        </div>
                        <!--THIRD LEVEL-->
                        <div class="col-md-12" style="margin: 10px">
                            <div class="col-md-2">
                                <label><b>Sex:</b></label> &nbsp;<span style="color: red">*</span>
                                <select id="s_sex" class="form-control" name="stud_sex" required style="font-size: 18px">
                                    <option value="" selected disabled> -- Select Sex -- </option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </div>
                             <div class="col-md-2">
                                <label><b>Birthdate:</b></label> &nbsp;<span style="color: red">*</span>
                                <input class="form-control" type="date" name="stud_birthdate" required style="font-size: 18px">
                            </div>
                            <div class="col-md-3">
                                <label><b>Degree Program:</b></label> &nbsp;<span style="color: red">*</span>
                                <select id="s_course" class="form-control" name="stud_course" style="font-size: 18px">
                                    <option value=""> -- Select Degree Program -- </option>
                                    <?php 
                                        $get_course = mysqli_query($connection, "SELECT * FROM `r_courses` WHERE course_status = 'Active'");
                                        while($row = mysqli_fetch_assoc($get_course))
                                        {
                                            $course_ID = $row['course_ID'];
                                            $course_code = $row['course_code'];
                                            $course_desc = $row['course_desc'];
                                    ?>
                                    <option value="<?php echo $course_ID; ?>"><?php echo $course_code; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <label><b>Year-Level:</b></label> &nbsp;<span style="color: red">*</span>
                                <select id="s_yrlvl" class="form-control" name="stud_yrlvl" style="font-size: 18px">
                                    <option value="" selected disabled> -- Select Year Level -- </option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label><b>Zipcode:</b></label>
                                <input id="s_zipcode" type="text" class="form-control" name="stud_zipcode" style="font-size: 18px">
                            </div>
                        </div>
                        <!--FOURTH LEVEL-->
                        <div class="col-md-12" style="margin: 10px">
                            <div class="col-md-6">
                                <label><b>Email Address:</b></label> &nbsp;<span style="color: red">*</span>
                                <input id="s_email" type="email" class="form-control" name="stud_email"  style="font-size: 18px">
                            </div>
                            <div class="col-md-6">
                                <label><b>Mobile Number:</b></label> &nbsp;<span style="color: red">*</span>
                                <input id="s_mobnum" type="text" class="form-control" name="stud_mobnum" maxlength="11" style="font-size: 18px">
                            </div>
                        </div>
                        <div class="panel" style="padding: 1px; background-color: #262626"></div>
                        <!--FIFTH LEVEL-->
                        <div class="col-md-12" style="margin: 10px; text-align: right">
                            <div class="col-md-12">
                               <!--  <button class="btn btn-primary" type="button" onclick="clear(); ">
                                    <i class="fa fa-refresh"></i>
                                      <b>Clear Entries</b>
                                </button> -->
                                &nbsp;
                                <a class="btn btn-success" href="#confirmation" data-toggle="modal">
                                    <i class="fa fa-mail-forward"></i>
                                      <b style="font-size: 18px">Submit Entries</b>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <!--START MODAL-->

                <div id="confirmation" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content" >
                            <div class="modal-header" style="background-color: #6e6e6e">
                                <h5 class="modal-title" style="font-size: 25px; color: white; text-align: center ">Student's Confirmation
                                    <i class="livicon" data-name="edit" data-s="35" data-c="white"></i></h5>
                            </div>
                            <div class="modal-body" style="height:auto; ">
                                <div class="col-md-12">
                                    <p style="font-size: 17px; margin-bottom: 10px; color: #262626">
                                        After providing your details, these are the particulars to be paid:
                                    </p>
                                    <hr>
                                    <table style="width: 50%; font-size: 15px; color: black">
                                        <tbody>
                                            <?php
                                                include("db_con.php");
                                                $view_query = mysqli_query($connection, "SELECT * FROM `r_particulars` WHERE prtclr_status = 'Active'");
                                                    $total = 0;
                                                    while($row = mysqli_fetch_array($view_query))
                                                    {
                                                        $prtclr_desc = $row['prtclr_desc'];
                                                        $prtclr_amount = $row['prtclr_amount'];



                                                        echo 
                                                        '
                                                            <tr>
                                                                <td>'.$prtclr_desc.'</td>
                                                                <td>₱ '.$prtclr_amount.'</td>
                                                            </tr>
                                                        ';

                                                        $total = $total + $prtclr_amount;
                                                    }
                                                    echo 
                                                    '   
                                                        <tr>

                                                            <td><b>Total:</b></td>
                                                            <td><b>₱ '.$total.'</b></td>
                                                        </tr>
                                                    ';
                                            ?>
                                        </tbody>
                                    </table>
                                    <hr>


                                    <?php
                                        include("db_con.php");
                                        $view_query = mysqli_query($connection, "SELECT * FROM `r_particulars` WHERE prtclr_status = 'Active'");
                                            $total = 0;
                                            while($row = mysqli_fetch_array($view_query))
                                            {
                                                $prtclr_ID = $row['prtclr_ID'];
                                                $prtclr_desc = $row['prtclr_desc'];
                                                $prtclr_amount = $row['prtclr_amount'];
                                                echo 
                                                '   
                                                    <input type="hidden" name="particular[]" value="'.$prtclr_ID.'" />
                                                ';
                                            }
                                    ?>
                                    <p style="font-size: 17px; margin-top: 10px; color: #262626">
                                        Also, before submitting your entries, make sure that your entries are sufficient and correct. <br>
                                        Are you sure you want to proceed?
                                    </p>
                                </div>
                                <div class="panel" style="background-color: #262626; padding: 1px"></div>
                                <div class="col-md-12" style="text-align: center">
                                    <button class="btn btn-success" style="background-color: green" name="save_record">
                                        <i class="fa fa-check"></i>
                                        Yes, Submit my Form.
                                    </button>
                                    &nbsp; &nbsp;
                                     <button class="btn btn-danger" data-dismiss="modal">
                                        <i class="fa fa-times"></i>
                                        Wait, Let me review my entries.
                                    </button>
                                </div>
                                <div class="row" style="margin-top: 10px"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--END MODAL-->
               </form>
            </section>
            <!--END FORM CONTENT-->
            

          </section>
       </div>
       <!--END CONTENT-->       
      </div>
      <!--END WRAPPER-->
   </body>



   <script src="resources-web/global/js/jquery.js"></script>
   <script src="resources-web/global/js/jquery-migrate-1.2.1.min.js"></script>
   <script src="resources-web/global/js/jquery-ui.js"></script>
   <script src="resources-web/global/plugins/bootstrap/js/bootstrap.min.js"></script>
   <script src="resources-web/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.js"></script>
   <script src="resources-web/global/js/html5shiv.js"></script>
   <script src="resources-web/global/js/respond.min.js"></script>
   <script src="resources-web/global/plugins/slimScroll/jquery.slimscroll.js"></script>



   <script src="resources-web/assets/plugins/jquery-metisMenu/jquery.menu.min.js"></script>
   <script src="resources-web/assets/plugins/jquery.blockUI.js"></script>
   <script src="resources-web/global/js/app.js"></script>
   <script src="resources-web/assets/js/quick-sidebar.js"></script>
   <script src="resources-web/assets/js/admin-setting.js"></script>
   <script src="resources-web/assets/js/layout.js"></script>

   <script type="text/javascript">
       function clear()
       {  
          $('#s_num').val('');
          $('#s_lref_num').val('');
          $('#s_lname').val('');
          $('#s_fname').val('');
          $('#s_mdinit').val('');
          $('#s_sex').val('');
          $('#s_course').val('');
          $('#s_yrlvl').val('');
          $('#s_zipcode').val('');
          $('#s_email').val('');
          $('#s_mobnum').val('');

       }
   </script>
</html>




       
              
              

              
              
            