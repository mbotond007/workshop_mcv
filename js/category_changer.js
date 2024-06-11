function topics_by_category(category,language)
{
    if(category)
        {
            var send_category={ "category_id":category } ;
            
        }
        else
        {
            var send_category={};
        }

    if(language)
        {
            var send_language={ "language":language } ;
            
        }
        else
        {
            var send_language={};
        }
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
    
    var act_language= $("#act_language").html();
    if(act_language=="hun")
        {
            $("#topic_box").html('<div class="topic"> Témakörök a <span style="color:red">'+$("#cat_"+$("#act_category").html()).html()+
            '</span> kategórián belül:</div><br>');

        }
    else if (act_language=="eng")
        {
            $("#topic_box").html('<div class="topic"> Chapters of  <span style="color:red">'+$("#cat_"+$("#act_category").html()).html()+
            '</span> category:</div><br>');

        }
    
    $.each(answer, function(idx, item)
    {
       
            
        $("<div class='topic'>"+item.topic_name+"</div><br>").appendTo($("#topic_box"));
       
        
    });

}