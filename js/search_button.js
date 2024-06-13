$(document).ready(
    function()
    {
        $("#search_button").click(
        function()
        {	
            $(".category_menu_button").removeClass("search_button");
            $("#act_category").empty();
            $("#topic_box").empty();		
            $("#topic_box").hide();	
            $("#content_box").empty();

            $("<div class='search_box'></div").appendTo($("#content_box"));

            $("<input type='text' placeholder='' name='search_topic' id='search_topic'>").appendTo( $(".search_box") );
			
            content_return( $("#act_language").html()); 

            search_engine();
        });
    });
      