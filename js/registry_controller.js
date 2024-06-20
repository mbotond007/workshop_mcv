function registry()
{
	//alert("ok");
	$.get("templates/reg_template.php" , function(temp_return)
	{
		var tempobj=$().add(temp_return);
		
        $(".category_menu_button").removeClass("search_button signed");
        $("#act_category").empty();
        $("#topic_box").empty();		
        $("#topic_box").hide();	
        $("#content_box").empty();
		
		tempobj.appendTo( $("#content_box") );

        content_return( $("#act_language").html());
		
		tempobj.find("#regsubmit").click(
		function()
		{
			if( regcheck(tempobj) )
			{
				//alert("Tovább");
                registry_validation(tempobj);
                    
            }
				
		});
	});
}

function regcheck(form)
{
	var failure=false;
	
	var fields=form.find(".input_box");
	
	$(".failure_box").remove();

    if(form.find("#regpass").val().length<=5)
        {
            $("<DIV class='failure_box err_box' id='pass_short_error'></DIV>").appendTo( $("#content_box") );

            failure=true;
        }
    if (form.find("#regpass").val()!=form.find("#regpass2").val())
        {
            $("<DIV class='failure_box err_box' id='pass2_error'></DIV>").appendTo( $("#content_box") );

            failure=true;
        }
	
	for( var i=0; i<fields.length ; i++ )
        {
            if( $(fields[i]).data("must_fillout") )
                if( $(fields[i]).val().trim()=="" )
                {
                    $("<DIV class='failure_box'id='must_fillout_error"+i+"'></DIV>").insertAfter($(fields[i]));
                   
                    failure=true;
                }

           
        }

    content_return( $("#act_language").html());
        
    return !failure;    
}

function registry_validation(form)
{
	var fields=form.find(".input_box");
	
	var fields_post={};
	
	for( var i=0; i<fields.length ; i++ )
	{
		if($(fields[i]).data("field")!="regpass2")
            {
                fields_post[ $(fields[i]).data("field") ] = $(fields[i]).val().trim();
            }
	}
	
	console.log(fields_post);
	
	$.ajax(
			{
				url:"modules/registry_validation.php" 
				,
				dataType:"json"
				,
				type:"POST"
				,
				data:fields_post
				,
				success:function( answer )
				{
					
                    if(answer.reg_error_1=="1")
                        {
                            $("<DIV class='failure_box err_box' id='regerror1'></DIV>").appendTo( $("#content_box") );
                        }
                    if(answer.reg_error_2=="1")
                        {
                            $("<DIV class='failure_box err_box' id='regerror2'></DIV>").appendTo( $("#content_box") );
                        }
                    if(answer.feedback=="ok")
                        {
                        
                        $("#content_box").empty();

                        $("<DIV class='failure_box err_box' id='registry_success'></DIV>").appendTo( $("#content_box") );
                        }
                       
                    content_return( $("#act_language").html()); 
				}
			}
		 );
}


