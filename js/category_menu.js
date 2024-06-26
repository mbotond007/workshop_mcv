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
            data:{}
            ,
            success:function(answer)	
                {
                    list_categories(answer,language);                   
                }
        });
}

function list_categories(answer,language)
{
    $("#category_menu_inside").empty();

    $.each(answer, function(idx, item)
    {
        var category_name= "category_name_"+language;

        var categ_obj=$("<div class='category_menu_button' id='cat_"+item.category_id+"'>"+item[category_name]+"</div>");

        categ_obj.appendTo($("#category_menu_inside"));

        categ_obj.data("catid",item.category_id);
        
        categ_obj.click(
            function()
            {
                localStorage.setItem("actCat", JSON.stringify(item));

                $("#act_category").html($(this).data("catid"));

                $(".category_menu_button").removeClass("search_button signed");
       
                $(this).addClass("search_button signed");        
                
                topics_by_category($(this).data("catid"), $("#act_language").html());
            }
        );
    });

    if($("#act_category").html()!="")
        {
            $("#cat_"+$("#act_category").html()).addClass("search_button signed"); 
        }
}
