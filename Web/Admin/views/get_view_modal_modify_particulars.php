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
                     
 ?> 
<div id="edit<?php echo $ID?>" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: goldenrod; color: white">
                <h4 class="modal-title" style="font-size: 25px; text-align: center"><i  class="fa fa-edit"></i>  Modify Details</h4>
            </div>
            <div class="modal-body" style="">
                <form role="form" method="POST" action="../functionalities/update_func.php">
                    <div class="col-md-12">
                            <input type="hidden" name="ID" value="<?php echo $ID?>" />
                            <div class="col-md-7">
                                <div class="form-group">
                                    <label style="font-size: 17px"><b>Particular Description:</b></label>
                                    <input type="text" class="form-control" name="part_desc" value="<?php echo $part_desc ?>" required/>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label style="font-size: 17px"><b>Particular Amount:</b></label>
                                    <input type="text" class="form-control" name="part_amount" value="<?php echo $part_amount ?>" required/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div style="padding: 1px; margin-bottom: 10px; background-color: gray;">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12" style="text-align: center">
                                <button type="submit" class="btn btn-success" name="edit_particular">
                                   <i  class="fa fa-check"></i>   Update
                                </button>&nbsp;&nbsp;&nbsp;
                                <button data-dismiss="modal" class="btn btn-default" style="background-color: maroon; color: white" name="cancel" >
                                    <i  class="fa fa-times"></i>  Cancel
                                </button>
                            </div>
                    </div>
                    <div class="row" style="padding: 1px"></div>
                </form>
            </div>
        </div> 
    </div>
</div>

<div id="activate<?php echo $ID?>" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: maroon; color: white">
                <h4 class="modal-title" style="font-size: 25px; text-align: center"><i  class="fa fa-archive"></i>  Archive this Record</h4>
            </div>
            <div class="modal-body" style="">
                <form role="form" method="POST" action="../functionalities/archive_func.php">
                    <div class="col-md-12">
                            <input type="hidden" name="ID" value="<?php echo $ID?>" />
                            <div class="col-md-12">
                                <div class="form-group">
                                    <p style="text-align: center; font-size: 16px">
                                        Activating this record will make it available to the<br> system's user-interface.<br>
                                        Are you sure you want to proceed?
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div style="padding: 1px; margin-bottom: 10px; background-color: gray;">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12" style="text-align: center">
                                <button type="submit" class="btn btn-success" name="activate_particular">
                                   <i  class="fa fa-check"></i>   Yes
                                </button>&nbsp;&nbsp;&nbsp;
                                <button data-dismiss="modal" class="btn btn-default" style="background-color: maroon; color: white" name="cancel" >
                                    <i  class="fa fa-times"></i>  No
                                </button>
                            </div>
                    </div>
                    <div class="row" style="padding: 1px"></div>
                </form>
            </div>
        </div>
    </div>
</div>


<div id="archive<?php echo $ID?>" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: maroon; color: white">
                <h4 class="modal-title" style="font-size: 25px; text-align: center"><i  class="fa fa-archive"></i>  Archive this Record</h4>
            </div>
            <div class="modal-body" style="">
                <form role="form" method="POST" action="../functionalities/archive_func.php">
                    <div class="col-md-12">
                            <input type="hidden" name="ID" value="<?php echo $ID?>" />
                            <div class="col-md-12">
                                <div class="form-group">
                                    <p style="text-align: center; font-size: 16px">
                                        Deactivating this record will make it unavailable to the<br> system's user-interface.<br>
                                        Are you sure you want to proceed?
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div style="padding: 1px; margin-bottom: 10px; background-color: gray;">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12" style="text-align: center">
                                <button type="submit" class="btn btn-success" name="archive_particular">
                                   <i  class="fa fa-check"></i>   Yes
                                </button>&nbsp;&nbsp;&nbsp;
                                <button data-dismiss="modal" class="btn btn-default" style="background-color: maroon; color: white" name="cancel" >
                                    <i  class="fa fa-times"></i>  No
                                </button>
                            </div>
                    </div>
                    <div class="row" style="padding: 1px"></div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php } ?>

