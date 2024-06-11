function content_return(language)
{
    $.ajax(
        {
            url:"modules/static_content.php" 
            ,
            dataType:"json"  
            ,
            type:"POST" 
            ,
            data:{"language":language}
            ,
            success:function(answer)	
            {
               show_content(answer);
            }
        });
    }

function show_content(answer)
{
    $.each(answer, function(idx, item)
    {
        if(item.container_type=="html")
        {
            $("#"+item.container_id).html(item.content);
        }
        else if(item.container_type=="input")
        {
            $("#"+item.container_id).attr("placeholder", item.content);
        }
        else if(item.container_type=="img")
        {
            $("#"+item.container_id).attr("src", item.content);
        }
        else if(item.container_type=="submit")
        {
            $("#"+item.container_id).val(item.content);
        }
        
    });  
}  