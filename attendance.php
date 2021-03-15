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

// Getting id from $obj object.
$id = $obj['id'];
 
// Getting date from $obj object.
$date = $obj['date'];

//Getting Subject
$subject = $obj['subject'];

//Getting attendence
$att=$obj['attendance']+0;

$buf=1;



$CheckSQL = "SELECT * FROM attendence WHERE register_id='$id' and date='$date'";

// Executing Email Check MySQL Query.

$check = mysqli_fetch_array(mysqli_query($con,$CheckSQL));

if(isset($check)===FALSE)
{
    $csql="INSERT INTO attendence(register_id, telugu,english,hindi,mathematics,science,social,date)
VALUES ('$id','$buf','$buf','$buf','$buf','$buf','$buf','$date')";
$a=mysqli_query($con,$csql);
if($a)
{
 $MSG = 'initial insertion successfully' ;
		 
		// Converting the message into JSON format.
		$json = json_encode($MSG);
		 
		// Echo the message.
		 echo $json ;

}
else
{
     $MSG = 'initial insertion not successfully'.$a ;
		 
		// Converting the message into JSON format.
		$json = json_encode($MSG);
		 
		// Echo the message.
		 echo $json ;

}
}

$CheckSQL = "SELECT * FROM attendence WHERE register_id='$id' and date='$date'";

// Executing Email Check MySQL Query.

$check = mysqli_fetch_array(mysqli_query($con,$CheckSQL));

if(isset($check))
{
	 // Creating SQL query and insert the record into MySQL database table.
	 switch($subject)
	 {
	     case "telugu":
        	 $Sql_Query = "update attendence set telugu = '$att' where register_id='$id' and date='$date'";
	         break;
   	     case "english":
        	 $Sql_Query = "update attendence set english = '$att' where register_id='$id' and date='$date'";
	         break;
	     case "hindi":
        	 $Sql_Query = "update attendence set hindi = '$att' where register_id='$id' and date='$date'";
	         break;
	     case "mathematics":
        	 $Sql_Query = "update attendence set mathematics = '$att' where register_id='$id' and date='$date'";
	         break;
	     case "science":
        	 $Sql_Query = "update attendence set science = '$att' where register_id='$id' and date='$date'";
	         break;
	     case "social":
        	 $Sql_Query = "update attendence set social = '$att' where register_id='$id' and date='$date'";
	         break;
	     default:
	         break;
	 }

	 
	 if(mysqli_query($con,$Sql_Query)){
	 
		 // If the record inserted successfully then show the message.
		$MSG = 'Attendence updated successfully' ;
		 
		// Converting the message into JSON format.
		$json = json_encode($MSG);
		 
		// Echo the message.
		 echo $json ;
	 
	 }
	 else{
	     	$MSG = 'Attendence not updated successfully' ;
		 
		// Converting the message into JSON format.
		$json = json_encode($MSG);
		 
		// Echo the message.
		 echo $json ;
	     
	     
	 }
    
}

 mysqli_close($con);
?>