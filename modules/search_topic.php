<?php
//echo("eddig jó");

include("../connect.php");

if($_POST["language"]=="")
{
	$act_lang="hun";
}
else
{
	$act_lang=$_POST["language"];
}

$return=$connection->query("select topic_id, topic_name_".$act_lang." as 'topic_name' from topic
                             where topic_name_".$act_lang." like '".$_POST["keyword"]."%'");

$answer=array();

while( $row =mysqli_fetch_assoc($return))
{
	array_push($answer, $row);
}

echo(json_encode( $answer) );

?>