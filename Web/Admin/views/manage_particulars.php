<?php
    
    include("../utilities/Header.php");
    include("../utilities/BaseJs.php");
    include("../utilities/Notification.php");
    include("../utilities/navibar.php");
    include("../utilities/Tables.php");


?>    
      <title>PUPQC-DTS | Manage Particulars</title>
      <!--BEGIN WRAPPER-->
      <div class="wrapper row-offcanvas row-offcanvas-left">
      <!--BEGIN CONTENT-->
       <div class="content">
          <section class="main-content">
             <!--START BREADCRUMBS-->
             <div class="col-md-12">
                  <h2 style="margin-top: 15px">Manage Particulars</h2>
                  <div class="row" style="padding:1px; background-color: #666666; margin-bottom: 50px; width: 100%"></div> 
             </div>
            <!--END BREADCRUMBS-->


            <!--START INNER CONTENT-->

              <!--START INPUT-->
              <div class="row" style="background-color: white">
                <div class="col-md-12">
                  <div class="box-info" >
                    
                      <div class="panel-heading" style="background-color: #002846; ">
                          <h4 style="color: white; font-size: 25px">Add Particular</h4>
                          <div class="row" style="padding:1px; background-color:white;"></div>
                      </div>
                      <br>
                      <form action="../functionalities/insert_func.php" method="POST">
                        <div class="col-md-4">
                            <label><b>Particular Description:</b></label>
                            <input type="text" class="form-control" name="part_desc" required/>
                        </div>
                         <div class="col-md-2">
                            <label><b>Set Amount:</b></label>
                            <input type="number" class="form-control" name="part_amount" min="1.00" step="0.01" required/>
                        </div>
                        <div class="col-md-1">
                            <button class="btn btn-success" type="submit" name="add_particular" style="margin-top: 26px"><i class="fa fa-save"></i> Save</button>
                        </div>
                      </form> 


                   </div>
                 </div>
               </div>
               <!--END INPUT-->

               
               <!--START TABLE-->     
              <div class="row" style="background-color: white">
                <div class="col-md-12" style="margin-top: 50px;">
                  <div class="box-info" >
                        <div class="panel-heading" style="background-color: #666666; ">
                          <h4 style="color: white; font-size: 25px">View Particular Details</h4>
                          <div class="row" style="padding:1px; background-color:white;"></div>
                        </div>
                        <br>
                        <!--adv-table start-->
                        <div class="adv-table">
                         <table id="datatables" class="table table-striped table-no-border">
                            <thead>
                            <tr>
                                <th style="display:none">ID</th>
                                <th>Description</th>
                                <th>Amount</th>
                                <th>Active Status</th>
                                <th>Date Modified</th>
                                <th style="text-align: center">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php
                                $view_query = mysqli_query($connection,"SELECT * FROM `r_particulars`");
                                while($row = mysqli_fetch_assoc($view_query))
                                {
                                    $ID = $row["prtclr_ID"];
                                    $part_desc = $row["prtclr_desc"];
                                    $part_amount = $row["prtclr_amount"];
                                    $part_status = $row["prtclr_status"];
                                    $part_datestamp = new datetime($row["prtclr_timestamp"]);
                                    $nf_datestamp = $part_datestamp->format('Y-m-d');

                                echo
                                '
                                    <tr class="gradeX">
                                        <td style="display: none">'.$ID.'</td>
                                        <td width="">'.$part_desc.'</td>
                                        <td width="">₱ '.$part_amount.'</td>
                                        <td width="">'.$part_status.'</td>
                                        <td width="">'.$nf_datestamp.'</td>
                                        <td width="25%">
                                          <center>
                                            <a data-toggle="modal" href="#edit'.$ID.'" class="btn btn-round btn-warning">
                                              <i class="fa fa-edit"></i>&nbsp;
                                              Edit
                                            </a>
                                ';
                                      if($part_status == 'Active')
                                      {
                                          echo
                                          ' 
                                            &nbsp;&nbsp;&nbsp;
                                            <a data-toggle="modal" href="#archive'.$ID.'" class="btn btn-round btn-danger">
                                              <i class="fa fa-times"></i>&nbsp;
                                              Disable
                                            </a>
                                           
                                          ';
                                      }
                                      else if($part_status == 'Disabled')
                                      {
                                          echo
                                          '
                                            &nbsp;&nbsp;&nbsp;
                                            <a data-toggle="modal" href="#activate'.$ID.'" class="btn btn-round btn-success">
                                              <i class="fa fa-check"></i>&nbsp;
                                              Activate
                                            </a>
                                          ';
                                      } 
                                echo
                                '
                                        </center>
                                      </td>
                                  </tr>  
                                ';
                              }
                                                
                            ?>      
                                      
                            </tbody>
                          </table>
                        </div>
                        <!--adv-table end-->
                        <?php include("get_view_modal_modify_particulars.php"); ?>
                  </div>
                </div>
              </div>    

              <!--END TABLE-->

            <!--END INNER CONTENT-->


          </section>
       </div>
       <!--END CONTENT-->       
      </div>
      <!--END WRAPPER-->
   </body>
</html>

