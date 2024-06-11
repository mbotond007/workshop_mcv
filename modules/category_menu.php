<?php

include("../connect.php");

if(!isset($_POST["language"]))
{
	$act_lang="hun";
}
else
{
	$act_lang=$_POST["language"];
}

$result=$connection->query("select category_id, category_name_".$act_lang." as 'category' from category");

$answer=array();

while($row=mysqli_fetch_assoc($result))
{
	array_push($answer, $row);
}

echo(json_encode($answer));

?>
