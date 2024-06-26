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
              
            func(answer);
                 
            }
        });
      
}
