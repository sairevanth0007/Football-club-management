<?php
$username = $_POST['username'];
$password = $_POST['password'];

// Create connection
$conn = new mysqli("fdb30.awardspace.net","3718110_manutd","tarun@123","3718110_manutd");
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}else {
  $result = mysqli_query($conn,"select * from registered where username ='$username' and password = '$password' ")
  or die("failed to query database".mysqli_error($conn));
  $row = mysqli_fetch_array($result);
  if($row['username'] == $username && $row['password'] == $password){
    echo '<script>alert("LOGIN SUCCESSFULL!")</script>';
			echo'<script>location="home.html"</script>';
  }else {
    echo "failed to login";
  }
}
?>
