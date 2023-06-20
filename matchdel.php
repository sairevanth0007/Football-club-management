<?php
  $con= new mysqli("fdb30.awardspace.net","3718110_manutd","tarun@123","3718110_manutd");
        if($con->connect_error){
        die("failed to connect : ".$con->connect_error);
    }
	$id=$_GET['id'];
$query = "DELETE from 3718110_manutd.fix where id = '$id'";
$data = mysqli_query($con,$query);
if($data)
{
echo '<script>alert("Data Deleted Successfully .")</script>';
echo'<script>location="match.php"</script>';
}
else {
    echo '<script>alert("Could no delete data.")</script>';
  echo'<script>location="match.php"</script>';
}
 ?>
