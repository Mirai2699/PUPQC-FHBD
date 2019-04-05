<?php
    
    include("../utilities/Header.php");
    include("../utilities/BaseJs.php");
    include("../utilities/Notification.php");
    include("../utilities/navibar.php");
    
?>
      <title>PUPQC-DTS | Dashboard</title>
      <!--BEGIN WRAPPER-->
      <div class="wrapper row-offcanvas row-offcanvas-left">
      <!--BEGIN CONTENT-->
       <div class="content">
          <section class="main-content">
             <!--START BREADCRUMBS-->
             <div class="col-md-12">
                 <h2 style="margin-top: 15px">Dashboard</h2>
                 <div class="row" style="padding:1px; background-color: #666666; margin-bottom: 10px; width: 100%"></div> 
             </div>
            <!--END BREADCRUMBS-->

            <script src="../../../resources-web/assets/plugins/highcharts/highcharts.js"></script>
            <script src="../../../resources-web/assets/plugins/highcharts/modules/data.js"></script>
            <script src="../../../resources-web/assets/plugins/highcharts/modules/exporting.js"></script>
            <script src="../../../resources-web/assets/plugins/highcharts/modules/drilldown.js"></script>

            <!--START DASHBOARD
            <section class="main-content">
                <div class="row">

                    <div class="col-md-3 col-sm-6">
                        <div class="panel panel-stat stat-primary">
                            <div class="panel-body">
                                <div class="row mbxl">
                                    <div class="col-xs-8"><span class="stat-title">Total # of Registered Employees</span>
                                        <h2 class="man">
                                        <?php
                                            $sql="SELECT * FROM `t_employees` WHERE emp_active_flag =1 ";
                                            if ($result=mysqli_query($connection,$sql))
                                              {
                                              // Return the number of rows in result set
                                              $rowcount=mysqli_num_rows($result);
                                              echo $rowcount;
                                              }
                                        ?>
                                        </h2>
                                    </div>
                                    <div class="col-xs-4"><i class="fa fa-users" style="margin-top: 30px"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="panel panel-stat stat-warning">
                            <div class="panel-body">
                                <div class="row mbxl">
                                    <div class="col-xs-8"><span class="stat-title">Total # of Active Registered Accounts</span>
                                        <h2 class="man">
                                        <?php
                                            $sql="SELECT * FROM `t_accounts` WHERE acc_active_flag = 'Active' ";
                                            if ($result=mysqli_query($connection,$sql))
                                              {
                                              // Return the number of rows in result set
                                              $rowcount=mysqli_num_rows($result);
                                              echo $rowcount;
                                              }
                                        ?>
                                        </h2>
                                    </div>
                                    <div class="col-xs-4"><i class="fa fa-key" style="margin-top: 30px"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>  
                    <div class="col-md-3 col-sm-6">
                        <div class="panel panel-stat stat-success">
                            <div class="panel-body">
                                <div class="row mbxl">
                                    <div class="col-xs-8"><span class="stat-title">Total # of Document Types</span>
                                        <h2 class="man">
                                        <?php
                                            $sql="SELECT * FROM `r_document_type` ";
                                            if ($result=mysqli_query($connection,$sql))
                                              {
                                              // Return the number of rows in result set
                                              $rowcount=mysqli_num_rows($result);
                                              echo $rowcount;
                                              }
                                        ?>
                                        </h2>
                                    </div>
                                    <div class="col-xs-4"><i class="fa fa-files-o" style="margin-top: 30px"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>  
                    <div class="col-md-3 col-sm-6">
                        <div class="panel panel-stat stat-danger">
                            <div class="panel-body">
                                <div class="row mbxl">
                                    <div class="col-xs-8"><span class="stat-title">Users' Logs of All User Types</span>
                                        <h2 class="man">
                                        <?php
                                            $sql="SELECT * FROM `t_users_log` ";
                                            if ($result=mysqli_query($connection,$sql))
                                              {
                                              // Return the number of rows in result set
                                              $rowcount=mysqli_num_rows($result);
                                              echo $rowcount;
                                              }
                                        ?>
                                        </h2>
                                    </div>
                                    <div class="col-xs-4"><i class="fa fa-laptop" style="margin-top: 30px"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>  


                    

                </div>


            </section>


            <!--END DASHBOARD-->


          </section>
       </div>
       <!--END CONTENT-->       
      </div>
      <!--END WRAPPER-->
   </body>
</html>




       
              
              

              
              
            