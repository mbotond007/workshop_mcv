<?php
session_start();

include("../connect.php");

$st=$connection->prepare("select * from customers where email=? and password=?");

$pass_encrypted=md5(md5($_POST["password"]));

$st->bind_param("ss", $_POST["email"],$pass_encrypted);

$st->execute();

$return=$st->get_result(); 

$answer=array();

if(mysqli_num_rows($return) == 1)
{
	$array=mysqli_fetch_assoc($return);
    $answer["feedback"]="Sikeres bejelentkezés"; 
    $_SESSION["actuser"]=$array;
	$answer["username"]=$_SESSION["actuser"]["customer_name"];
		
}
else
{
	$answer["feedback"]="Sikertelen bejelentkezés";
}	

echo(json_encode( $answer));
?>
