function topics_by_category(category,language)
{
    $.ajax(
        {
            url:"modules/show_category_topics.php" 
            ,
            dataType:"json"  
            ,
            type:"POST" 
            ,
            data: {"category_id":category, "language":language}
            ,
            success:function(answer)	
            {
                show_topics(answer);
            }
        });
}

function show_topics(answer)
{
    $("#topic_box").empty();
    $("#topic_box").show();
    $("#content_box").empty();
    

    $('<div class="topic_label"><div class="topic" style="cursor:default" id="topic_label1"></div> <div class="topic" style="color:red; cursor:default">'+$("#cat_"+$("#act_category").html()).html()+
    '</div> <div class="topic" id="topic_label2" style="cursor:default"></div></div><br>').appendTo($("#topic_box"));

    content_return( $("#act_language").html()); 

    $.each(answer, function(idx, item)
    {
       
            
        $("<div class='topic'>"+item.topic_name+"</div><br>").appendTo($("#topic_box"));
       
        
    });
    
}