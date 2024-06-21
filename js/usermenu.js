function usermenu_load()
{
    
                if(usercheck(callback)=="")
                {
                    load_usermenu();
                }
                else
                {
                    load_usermenu_login(usercheck());
                }
    

}

function load_usermenu()
    {
        //alert("nincs belépve felhasználó");
        $("#main_menu_right").empty();

        $.get("templates/usermenu.php" , function(temp_return)
        {
            var tempobj=$().add(temp_return);
            
            tempobj.appendTo( $("#main_menu_right") );
            
            content_return( $("#act_language").html());

            tempobj.find("#reg_button").click(
            function()
            {
                registry();
            });
            
            tempobj.find("#login_button").click(
            function()
            {
                login();
            });
        });

    }

function load_usermenu_login(user)
    {
        $("#main_menu_right").empty();

        $.get("templates/usermenu_login.php" , function(temp_return)
        {
            var tempobj=$().add(temp_return);
            
            tempobj.appendTo( $("#main_menu_right") );

            content_return( $("#act_language").html());

            tempobj.find("#username").html(user);
            
        });
    }
