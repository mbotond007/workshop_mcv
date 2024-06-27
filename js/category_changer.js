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
                localStorage.setItem("topicList", JSON.stringify(answer));  
                show_topics(language);
            }
        });
}

function show_topics(language)
{
    $("#topic_box").empty();
    $("#topic_box").show();
    $("#content_box").empty();

    var actCateg=JSON.parse(localStorage.getItem("actCat"))["category_name_"+language];
    
    var topicList=JSON.parse(localStorage.getItem("topicList"));

    $('<div class="topic_label"><div class="topic" style="cursor:default" id="topic_label1"></div> <div class="topic" style="color:red; cursor:default">'+actCateg+
    '</div> <div class="topic" id="topic_label2" style="cursor:default"></div></div><br>').appendTo($("#topic_box"));


    content_return( $("#act_language").html()); 

    for(const elem of topicList)
        {
            $("<div class='topic'>"+elem['topic_name_'+language]+"</div><br>").appendTo($("#topic_box"));
        }
    
}