<?php
include("../connect.php");

if($_POST["language"]=="")
{
	$act_lang="hun";
}
else
{
	$act_lang=$_POST["language"];
}



$result=$connection->query("select container_id, container_type, content_".$act_lang." as 'content'  from containers");

$answer=array();

while($row=mysqli_fetch_assoc($result))
{
	array_push($answer, $row);
}

echo(json_encode($answer));
?>