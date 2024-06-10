<?php
include("../connect.php");

$result=$connection->query("select *  from containers");

$answer=array();

while($row=mysqli_fetch_assoc($result))
{
	array_push($answer, $row);
}

echo(json_encode($answer));
?>