<html>
    <head>
        <title> Manchester United </title>
        <link rel="stylesheet" href="team1.css">
    </head>
<body>
    <div class="banner">
        <div class="navbar">
          <a href="home.html" ><img src="https://cdn.freebiesupply.com/images/thumbs/2x/manchester-united-logo.png" class="logo"></a>
          <ul>
          <li><a href="club.php">CLUBS </a>
          <div class="down">
          <ul>
              <li><a href="club1.php">MAN UTD</a></li>
              <li><a href="club2.php">BYREN</a></li>
            </ul>
          </div></li>
          <li><a href="allplayers.php">PLAYERS </a>
              <div class="down">
              <ul>
                  <li><a href="squad.php">ATTACK</a></li>
                  <li><a href="mid.php">MIDFILD</a></li>
                  <li><a href="def.php">DEFENCE</a></li>
                  <li><a href="gk.php">GOAL KEEPER</a></li>
              </ul>
              </div>
          </li>
          <li><a href="manager.php"> STAFF </a></li>
          <li><a href="match.php">FIXTURES </a></li>
          <li><a href="index.html">LOG OUT</a></li>
          </ul></div>
          <form action="" method="post" >
            <table>
            <tr><td>Name</td><br><td><input type="text" name="name" required></td></tr>
          <tr><td>Date of birth</td><td><input type="date" name="dob"required></td></tr>
          <tr><td>Position</td><td><input type="text" name="position"required></td></tr>
          <tr><td>Club Name</td><td><select name="club_id" value="none">
       <option value="none" selected disabled hidden>
       select
        <option value="1">Manchester United</option>
        <option value="2">Byren</option></td></tr>
          <tr><td><a href="manager.php"><input type="submit" name="submit"></a></td><td>
              <button><a href="manager.php">Back</a></button></td></tr>
          </table>
      </form>
      </div>
      <?php
        $con= new mysqli("fdb30.awardspace.net","3718110_manutd","tarun@123","3718110_manutd");
            if($con->connect_error){
            die("failed to connect : ".$con->connect_error);
        }
      if(isset($_POST['submit']))
      {
        $club_id=$_POST['club_id'];
        $name=$_POST['name'];
        $dob=$_POST['dob'];
        $position=$_POST['position'];
        if($name == "")
     {
        echo '<script>alert("Please insert Data!")</script>';
      echo'<script>location="manageradd.php"</script>';
     }
     else {

        $result = "INSERT INTO 3718110_manutd.staff (club_id,name, dob, position) values('$club_id','$name','$dob','$position')";
        if ($con->query($result) === TRUE)
        {
            echo '<script>alert("Data Added Successfully!")</script>';
            echo'<script>location="manager.php"</script>	';
        }
        else
        {
            echo '<script>alert("could not add data")</script>';
          echo'<script>location="manageradd.php"</script>';
        }
      }
      }
     ?>
      </div>
     </body>
     <style>
        form{
            width: 10%;
     position: absolute;
     top: 25%;
     left: 40%;
     color: white;
        }
        a:link {
      text-decoration: none;
     }
     body{
        height: 100vh;
        place-items: center normal;
        display: grid;
     }
     table
     {
     width: 80%;
     position: absolute;
     top: 10%;
     left: 10%;
     box-shadow: -1px 12px 12px -6px rgba(0,0,0,1.5);
     }
     table,td,th{
        padding: 7px;
        border: 4px solid deepskyblue;
        border-collapse:collapse;
        color: white;
        text-align: center;
     }
     </style>

     </html>
