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
                    localStorage.setItem("categList", JSON.stringify(answer));   
                    list_categories(language);                   
                }
        });
}

function list_categories(language)
{
    $("#category_menu_inside").empty();

    var categoryList=JSON.parse(localStorage.getItem("categList"));

   for(const elem of categoryList)
        {
            var category_name= "category_name_"+language;

            console.log(elem[category_name]);
        
            var categ_obj=$("<div class='category_menu_button' id='cat_"+elem["category_id"]+"'>"+elem[category_name]+"</div>");
           
            categ_obj.appendTo($("#category_menu_inside"));

            categ_obj.data("catid",elem["category_id"]);
            
            categ_obj.click(function()
                {
                    $("#act_category").html($(this).data("catid"));
        
                    localStorage.setItem("actCat", JSON.stringify(elem));
                    
                    var actCat= JSON.parse(localStorage.getItem("actCat"));            
    
                    $(".category_menu_button").removeClass("search_button signed");
           
                    $(this).addClass("search_button signed");        
                    
                    topics_by_category($(this).data("catid"), $("#act_language").html());
                });
        
        }

    if($("#act_category").html()!="")
        {
            $("#cat_"+$("#act_category").html()).addClass("search_button signed"); 
        }
}
