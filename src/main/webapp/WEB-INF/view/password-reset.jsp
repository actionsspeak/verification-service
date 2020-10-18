<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Email Verification Service</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script language="javascript">


    function isEmpty(str) {
        return (!str || 0 === str.trim().length);
    }
    
    function saveNewPassword()
    {
        var urlParams = new URLSearchParams(location.search);
    
        if (!urlParams.has('token') || isEmpty(urlParams.get('token')))
        {
            alert("Missing the required Token");
            return;
        }
        
        var tokenValue = urlParams.get('token');
        
        var password_one = document.getElementById("password_one").value;
        var password_two = document.getElementById("password_two").value;
    
        if (isEmpty(password_one))
        {
            alert("Password cannot be empty");
            return;
        }
    
        if (password_one !== password_two)
        {
            alert("Passwords do not match");
            return;
        }
    
    
        $.ajaxSetup({
            "contentType": "application/json"
        });
        
        var dataPayload = { "token": tokenValue, "password": password_one };
        
        $.post('http://localhost:8080/mobile-app-ws/users/password-reset', JSON.stringify(dataPayload))
                .done(function (response) {
                    document.getElementById("password_one").value="";
                    document.getElementById("password_two").value="";
                    
                    if (response["operationResult"] === "SUCCESS")
                    {
                        $("#not-successful-result").attr("style", "display: none !important;");
                        $("#successful-result").attr("style", "display: block !important;");
    
                    } else {
                        $("#successful-result").attr("style", "display: none !important;");
                        $("#not-successful-result").attr("style", "display: block !important;");
                    }
    
                });
    }

</script>

</head>
<body>
    <div id="successful-result" style="display:none">Your password is now updated</div>
    <div id="not-successful-result" style="display:none">Could not update password</div>

    <form>
        New password: <input type="password" id="password_one"/><br/>
        Retype new password: <input type="password" id="password_two"/><br/>
        <input type="button" value="Save new password" onclick="javascript:saveNewPassword()"/>
    </form>
</body>
</html>