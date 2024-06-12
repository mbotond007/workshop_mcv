function login()
{
	//alert("ok");
	$.get("templates/login_template.php" , function(temp_return)
	{
		var tempobj=$().add(temp_return);
		
        $(".category_menu_button").removeClass("search_button");
        $("#act_category").empty();
        $("#topic_box").empty();		
        $("#topic_box").hide();	
        $("#content_box").empty();
		
		tempobj.appendTo( $("#content_box") );

        content_return( $("#act_language").html());
		
		tempobj.find("#loginsubmit").click(
		function()
		{
			if( logincheck(tempobj) )
			{
				//alert("Tovább");
                login_validation(tempobj);
                    
            }
				
		});
	});
}

function logincheck(form)
{
	var failure=false;
	
	var fields=form.find(".input_box");
	
	$(".failure_box").remove();
	
	for( var i=0; i<fields.length ; i++ )
	{
		if( $(fields[i]).data("must_fillout") )
			if( $(fields[i]).val().trim()=="" )
			{
				$("<DIV class='failure_box'>Kötelező kitölteni</DIV>").insertAfter($(fields[i]));
				
				failure=true;
			}
		}
    return !failure;    
}


function login_validation(form)
{
	var fields=form.find(".input_box");
	
	var fields_post={};
	
	for( var i=0; i<fields.length ; i++ )
	{
		fields_post[ $(fields[i]).data("field") ] = $(fields[i]).val().trim();
	}
	
	//console.log(kuld_mezok);
	
	$.ajax(
			{
				url:"modules/login_validation.php" 
				,
				dataType:"json"
				,
				type:"POST"
				,
				data:fields_post
				,
				success:function( answer )
				{
					alert(answer.feedback);
                    if(answer.username)
                    {
                        alert("Belépve:"+answer.username);
                        $("#content_box").empty();
                        usermenu_load();
                        
                    }   
				}
			}
		 );
}
