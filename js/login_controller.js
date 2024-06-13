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
				$("<DIV class='failure_box' id='must_fillout_error"+i+"'></DIV>").insertAfter($(fields[i]));
				
				failure=true;
			}
		}
	content_return( $("#act_language").html());	

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
					//alert(answer.feedback);
                    
                    if(answer.login_error_1=="1")
                        {
                            $("<DIV class='failure_box' id='loginerror1'></DIV>").appendTo( $("#content_box") );
							content_return( $("#act_language").html());
                        }
                    if(answer.login_error_2=="1")
                        {
                            $("<DIV class='failure_box' id='loginerror2'></DIV>").appendTo( $("#content_box") );
							content_return( $("#act_language").html()); 
                        }
					
					
					
					if(answer.username)
                    {
                        //alert("Belépve:"+answer.username);
                        $("#content_box").empty();
						$("<DIV class='failure_box' id='login_success'></DIV>").appendTo( $("#content_box") );
                        usermenu_load();
                        
                    }   
				}
			}
		 );
}

