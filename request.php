<?php
session_start();
//session_destroy();
?>
<?php
include_once "include/dbh.php";
if(isset($_SESSION['username']))
{
	if(isset($_POST['request']))
	{
		$username=$_SESSION['username'];
		$description=mysqli_real_escape_string($conn,$_POST['description']);
		$size=mysqli_real_escape_string($conn,$_POST['size']);
		$type=mysqli_real_escape_string($conn,$_POST['type']);
		$time=mysqli_real_escape_string($conn,$_POST['time']);
		$deliverytype=mysqli_real_escape_string($conn,$_POST['deliverytype']);
		$address=mysqli_real_escape_string($conn,$_POST['address']);
		$code=rand(12,99999999);	
		$date= (string)date("Y/m/d");
		$status="ON";
		$sep=0;

		$sql="INSERT INTO requests(username,description,size,type,deleverytype,time,address,status,code,date,seperated)
		VALUES(?,?,?,?,?,?,?,?,?,?,?);";
		$stmt=mysqli_stmt_init($conn);
		if(!mysqli_stmt_prepare($stmt,$sql)) 
		{
			echo "<h2>SQL Error</h2>";
		}	
		else
		{
			mysqli_stmt_bind_param($stmt,"ssssssssdsd",$username,$description,$size,$type,$deliverytype,$time,$address,$status,$code,$date,$sep);
			$a=mysqli_stmt_execute($stmt);
		
			echo "<br>";
			echo "<h1>order placed: "."<br>";
			echo  $_SESSION['username']."<br>";
			echo "order code :".$code;
			

		}
	
	}
	else
	{
		echo "error";
	}
}
else
{
			header("Location:loginpage.html");
			exit();
}
?>
<br>
<a href="home.php">HOME</a>
