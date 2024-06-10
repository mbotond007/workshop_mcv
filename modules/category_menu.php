<?php
session_start();

include("../connect.php");

if(!isset($_POST["language"]))
{
	if(!isset($_SESSION["language"]))
	{
		$_SESSION["language"]="hun";
	}
}
else
{
	$_SESSION["language"]=$_POST["language"];
}

$result=$connection->query("select category_id, category_name_".$_SESSION["language"]." as 'category' from category");

$answer=array();

while($row=mysqli_fetch_assoc($result))
{
	array_push($answer, $row);
}

echo(json_encode($answer));

?>
