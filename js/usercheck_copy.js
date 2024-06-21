function callback(str)
    {  
        return str;
    }

function usercheck2(func)
{
    
   $.ajax(
        {
            url:"modules/usercheck.php" 
            ,
            dataType:"json"  
            ,
            type:"POST" 
            ,
            data: {}
            ,
            success:function(answer)	
            {
               //uname=answer.username; 
              
               return func(answer.username);    
            }
        });
      
}

