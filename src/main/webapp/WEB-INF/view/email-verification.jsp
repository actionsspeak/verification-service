<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Email Verification Service</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script language="javascript">
$(document).ready(function () {
    var urlParams = new URLSearchParams(location.search);

    if (urlParams.has('token'))
    {
        // alert('Hi there. Token: '+urlParams.get('token'));
     	verifyToken(urlParams.get('token')); 
    }
    
    function verifyToken(tokenValue)
    {
        $.get('http://localhost:8080/mobile-app-ws/users/email-verification', {token: tokenValue})
        .done(function (response) {
        	
            if (response["operationResult"] === "SUCCESS")
            {
                $("#not-successful-result").attr( "style", "display: none !important;" ); 
                $("#successful-result").attr( "style", "display: block !important;" ); 
                
            } else {
                $("#successful-result").attr( "style", "display: none !important;" ); 
                $("#not-successful-result").attr( "style", "display: block !important;" ); 
            }

        });
    }
    
});
</script>
</head>
<body>
        <div id="successful-result" style="display:none">Successful verification</div>
        <div id="not-successful-result" style="display:none">Verification link has expired</div>
</body>
</html>