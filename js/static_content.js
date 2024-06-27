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
                localStorage.setItem("contentList", JSON.stringify(answer)); 
                show_content(language);
            }
        });
}

function show_content(language)
{
    var contentList=JSON.parse(localStorage.getItem("contentList"));

    console.log(contentList);

    var content= "content_"+language;

    for(const elem of contentList)
    {
        if(elem.container_type=="html")
        {
            $("#"+elem.container_id).html(elem[content]);
        }
        else if(elem.container_type=="input")
        {
            $("#"+elem.container_id).attr("placeholder", elem[content]);
        }
        else if(elem.container_type=="img")
        {
            $("#"+elem.container_id).attr("src", elem[content]);
        }
        else if(elem.container_type=="submit")
        {
            $("#"+elem.container_id).val(elem[content]);
        }
        
        
    }
}  