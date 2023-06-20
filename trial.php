<?php
        $con= new mysqli("fdb30.awardspace.net","3718110_manutd","tarun@123","3718110_manutd");
        if($con->connect_error){
        die("failed to connect : ".$con->connect_error);
    }
    $apper= "SELECT apper FROM players WHERE player_id=29";
    $result = $con->query($apper);
    if($result)
    {
      echo "1";
    }
?>
