<?php
include("../connect.php");

$cat_id=$_POST["category_id"];

$act_lang=$_POST["language"];

$st=$connection->prepare("select topic.topic_id, topic.topic_name_".$act_lang." as 'topic_name' from topic inner join category_topic
						on category_topic.topic_id=topic.topic_id inner join category
						on category.category_id=category_topic.category_id 
						where category.category_id = ?");

$st->bind_param("s", $cat_id);

$st->execute(); 

$result=$st->get_result(); 

$answer=array();


while($row=mysqli_fetch_assoc($result))
{
	array_push($answer, $row);
}

echo(json_encode($answer));

?>
	
	
	
	
	
	
	
	

