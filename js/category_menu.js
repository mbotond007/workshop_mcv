function category_menu(language)
{

    $.ajax(
        {
            url:"modules/category_menu.php" 
            ,
            dataType:"json" 
            ,
            type:"POST" 
            ,
            data:{"language":language}
            ,
            success:function(answer)	
                {
                    list_categories(answer);                   
                }
        });
}

function list_categories(answer)
{
    $("#category_menu_inside").empty();

    $.each(answer, function(idx, item)
    {
        var categ_obj=$("<div class='category_menu_button' id='cat_"+item.category_id+"'>"+item.category+"</div>");

        categ_obj.appendTo($("#category_menu_inside"));

        categ_obj.data("catid",item.category_id);
        
        categ_obj.click(
            function()
            {
                $("#act_category").html($(this).data("catid"));

                $(".category_menu_button").removeClass("search_button");
       
                $(this).addClass("search_button");        
                
                topics_by_category($(this).data("catid"), $("#act_language").html());
            }
        );
    });

    if($("#act_category").html()!="")
        {
            $("#cat_"+$("#act_category").html()).addClass("search_button"); 

        }
}
