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
            data:{}
            ,
            success:function(answer)	
            {
                $.each(answer, function(idx, item)
                {
                    if(language=="hun")
                    {
                       var content=item.content_hun;
                    }
                    else if(language=="eng")
                    {
                       var content=item.content_eng;
                    }
                    
                    if(item.container_type=="html")
                    {
                        $("#"+item.container_id).html(content);
                    }
                    else if(item.container_type=="input")
                    {
                        $("#"+item.container_id).attr("placeholder", content);
                    }
                    else if(item.container_type=="img")
                    {
                        $("#"+item.container_id).attr("src", content);
                    }
                    else if(item.container_type=="submit")
                    {
                        $("#"+item.container_id).val(content);
                    }
                    
                });
            }
        });
    }
