$(document).ready(
    function()
    {
        if($("#act_language").html()=="")
            {
                $("#act_language").html("hun");

                $("#flag_hun").addClass("signed");      
                
                localStorage.clear();

                content_return( $("#act_language").html());

                usercheck2(usermenu_load);

                category_menu($("#act_language").html());
            }
        
        $(".flag").click(
            function()
            {
                $(".flag").removeClass("signed");

                $(this).addClass("signed");

                $("#search_result").remove();

                $("#search_topic").val("");

                list_categories($(this).data("language"));

                $("#act_language").html($(this).data("language"));

                if($("#act_category").html()!="")
                {
                    show_topics($("#act_language").html());
                }
                    
                show_content( $(this).data("language"));
            }
        );
    });

