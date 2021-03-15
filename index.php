<?php
 
//Define your Server host name here.
$HostName = "localhost";
 
//Define your MySQL Database Name here.
$DatabaseName = "id13896340_student";
 
//Define your Database User Name here.
$HostUser = "id13896340_rikky";

 //Define your Database Password here.
$HostPass = "Rikky@123456"; 
 
// Creating MySQL Connection.
$con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);
 mysqli_close($con);
?>
 if (!$con)
{
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
    //you need to exit the script, if there is an error
    exit();
}
// Storing the received JSON into $json variable.
$json = file_get_contents('php://input');
 
// Decode the received JSON and Store into $obj variable.
$obj = json_decode($json,true);
 
// Getting Email from $obj object.
$email = $obj['email'];
 
// Getting Password from $obj object.
$password = $obj['password'];

// Checking whether Email is Already Exist or Not in MySQL Table.
$CheckSQL = "SELECT * FROM user_registration WHERE username='$email'";

// Executing Email Check MySQL Query.
$check = mysqli_fetch_array(mysqli_query($con,$CheckSQL));


if(isset($check)){

	 $emailExist = 'Email Already Exist, Please Try Again With Nsdsdew Email Address..!';
	 
	 // Converting the message into JSON format.
	$existEmailJSON = json_encode($emailExist);
	 
	// Echo the message on Screen.
	 echo $existEmailJSON ; 
	 
	 echo $json;

  }
 else{
 
	 // Creating SQL query and insert the record into MySQL database table.
	 $Sql_Query = "insert into user_registration (username,password) values ('$email','$password')";
	 
	 
	 if(mysqli_query($con,$Sql_Query)){
	 
		 // If the record inserted successfully then show the message.
		$MSG = 'User Registered Successfully' ;
		 
		// Converting the message into JSON format.
		$json = json_encode($MSG);
		 
		// Echo the message.
		 echo $json ;
	 
	 }
	 else{
	 
		echo 'Try Again';
	 
	 }
 }
 if (!$con)
{
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
    //you need to exit the script, if there is an error
    exit();
}
// Storing the received JSON into $json variable.
$json = file_get_contents('php://input');
 
// Decode the received JSON and Store into $obj variable.
$obj = json_decode($json,true);
 
// Getting Email from $obj object.
$email = $obj['email'];
 
// Getting Password from $obj object.
$password = $obj['password'];

// Checking whether Email is Already Exist or Not in MySQL Table.
$CheckSQL = "SELECT * FROM user_registration WHERE username='$email'";

// Executing Email Check MySQL Query.
$check = mysqli_fetch_array(mysqli_query($con,$CheckSQL));


if(isset($check)){

	 $emailExist = 'Email Already Exist, Please Try Again With Nsdsdew Email Address..!';
	 
	 // Converting the message into JSON format.
	$existEmailJSON = json_encode($emailExist);
	 
	// Echo the message on Screen.
	 echo $existEmailJSON ; 
	 
	 echo $json;

  }
 else{
 
	 // Creating SQL query and insert the record into MySQL database table.
	 $Sql_Query = "insert into user_registration (username,password) values ('$email','$password')";
	 
	 
	 if(mysqli_query($con,$Sql_Query)){
	 
		 // If the record inserted successfully then show the message.
		$MSG = 'User Registered Successfully' ;
		 
		// Converting the message into JSON format.
		$json = json_encode($MSG);
		 
		// Echo the message.
		 echo $json ;
	 
	 }
	 else{
	 
		echo 'Try Again';
	 
	 }
 }
 if (!$con)
{
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
    //you need to exit the script, if there is an error
    exit();
}
// Storing the received JSON into $json variable.
$json = file_get_contents('php://input');
 
// Decode the received JSON and Store into $obj variable.
$obj = json_decode($json,true);
 
// Getting Email from $obj object.
$email = $obj['email'];
 
// Getting Password from $obj object.
$password = $obj['password'];

// Checking whether Email is Already Exist or Not in MySQL Table.
$CheckSQL = "SELECT * FROM user_registration WHERE username='$email'";

// Executing Email Check MySQL Query.
$check = mysqli_fetch_array(mysqli_query($con,$CheckSQL));


if(isset($check)){

	 $emailExist = 'Email Already Exist, Please Try Again With Nsdsdew Email Address..!';
	 
	 // Converting the message into JSON format.
	$existEmailJSON = json_encode($emailExist);
	 
	// Echo the message on Screen.
	 echo $existEmailJSON ; 
	 
	 echo $json;

  }
 else{
 
	 // Creating SQL query and insert the record into MySQL database table.
	 $Sql_Query = "insert into user_registration (username,password) values ('$email','$password')";
	 
	 
	 if(mysqli_query($con,$Sql_Query)){
	 
		 // If the record inserted successfully then show the message.
		$MSG = 'User Registered Successfully' ;
		 
		// Converting the message into JSON format.
		$json = json_encode($MSG);
		 
		// Echo the message.
		 echo $json ;
	 
	 }
	 else{
	 
		echo 'Try Again';
	 
	 }
 }
?>