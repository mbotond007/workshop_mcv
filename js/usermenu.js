function usermenu_load(arr)
{
        console.log(arr.username);        
        if(arr.username=="")
        {
            load_usermenu();
        }
        else
        {
            load_usermenu_login(arr.username);
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
            
            show_content( $("#act_language").html());

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

            show_content( $("#act_language").html());

            tempobj.find("#username").html(user);
            
        });
    }
