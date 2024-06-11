$(document).ready(
    function()
    {
        if($("#act_language").html()=="")
            {
                $("#act_language").html("hun");

                content_return( $("#act_language").html());

                category_menu($("#act_language").html());
            }
        
        $(".flag").click(
            function()
            {
                content_return( $(this).data("language"));

                category_menu($(this).data("language"));

                $("#act_language").html($(this).data("language"));

                if($("#act_category").html()!="")
                {
                    topics_by_category($("#act_category").html());
                }
                      
            }
        );
    });

