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
$mo = $obj['mo'];

//Getting Subject
$subject = $obj['subject'];

//Getting attendence
$maxm=$obj['mm']+0;


if(TRUE)
{
    $csql="INSERT INTO class_1(student_id,subject,marks_obtained,maxium_marks)
VALUES ('$id','$subject','$mo','$maxm')";
$a=mysqli_query($con,$csql);
if($a)
{
 $MSG = 'insertion successfully' ;
		// Converting the message into JSON format.
}
else
{
     $MSG = 'insertion not successfully'.$a ;
}
		// Converting the message into JSON format.
		$json = json_encode($MSG);
		 
		// Echo the message.
		 echo $json ;
}

mysqli_close($con);
?>