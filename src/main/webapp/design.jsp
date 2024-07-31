<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Responsive Design </title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha384-PkzpVuZc3gHkT2oW6wGz01JS6SOkY6elSllZvCFcOwpvRnSEJFvo10orU9twynKC" crossorigin="anonymous">
<style>
/* Default styles */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color:#000033;
}

.container {
    max-width: 1200px;
    max-height:1500;
    margin: 0 auto;
    padding: 20px;
    background-color:#000033 ;
    
}

/* Header styles */
header {
    text-align: center;
    padding: 20px 0;
    color: white;
}

/* Navigation styles */
nav {
    text-align: center;
}

nav ul {
    list-style-type: none;
    padding: 0;
}

nav ul li {
    display: outline;
    margin: 0 10px;
}

/* Main content styles */
.main-content {
    padding: 20px 0;
}

/* Footer styles */
footer {
    text-align: center;
    padding: 20px 0;
    background-color: #333;
    color: #fff;
}

/* Media queries for responsive design */
@media only screen and (max-width: 768px) {
    .container {
        padding: 10px;
    }

    nav ul li {
        display: block;
        margin: 10px 0;
    }
}

@media only screen and (max-width: 480px) {
    nav ul li {
        display: block;
        margin: 5px 0;
        color: white;
    }
}
</style>
</head>
<body>

<div class="container">
    <header>
        <h1> <i class='fas fa-clone' style='font-size:48px;color:white'> RESPONSIVE DESIGN</i> </h1>
    </header>
    
    <nav>
        <ul>
            <li><a href="conversionlogic.jsp">CONVERSION LOGIC</a></li><br><br>
            <li><a href="multiplejsp.jsp">MULTIPLE CURRENCY</a></li><br><br>
            <li><a href="ratexchange.jsp">RATE EXCHANGE</a></li><br><br>
            <li><a href="rateupdate.jsp">RATE UPDATE</a></li><br><br>
            <li><a href="userinput.jsp">USER INPUT</a></li><br><br>
            <li><a href="error_handling.jsp">ERROR HANDLING</a></li><br><br>
            <li><a href="offline.jsp">OFFLINE</a></li><br><br>
            <li><a href="fav_currency.jsp">FAVOURITES</a></li><br><br>
            <li><a href="historical.jsp">HISTORICAL</a></li><br><br>
        </ul>
    </nav>
    
    
    
    
</div>

</body>
</html>