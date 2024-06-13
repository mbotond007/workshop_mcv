function search_engine()
{
$(document).ready(
    function()
    {
        $("#search_topic").keyup(
        function()
        {	
            if( $("#search_topic").val().length >=3)
            {
                $("#search_result").remove();
                $.ajax(
                    {
                        url:"modules/search_topic.php" 
                        ,
                        dataType:"json"
                        ,
                        type:"POST"
                        ,
                        data:{ "keyword":$("#search_topic").val().trim(), "language":$("#act_language").html() } 
                        ,
                        success:function( answer)
                        {
                            //$("#content_box").empty();

                            $("<DIV class='search_result' id='search_result' ></DIV>").insertAfter( $("#search_topic") );

                            $("#seach_result").empty();
                            
                            $.each(answer, function(idx, item)
                            {
                                $("<div class='one_result'>"+item.topic_name+"</div>").appendTo( $("#search_result")).click(
                                function()
                                {
                                    $("#search_topic").val(item.topic_name);
                                    $("#search_result").remove();
                                })				
                                ;
                            });
                            
                        }
                    });
            }
        });
        
        
        
    });
}