<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body { 
    display: flex; 
    align-items: center; 
    justify-content: center; 
    font-family: sans-serif; 
    line-height: 1.5; 
    min-height: 100vh; 
    background: #99ff99; 
    flex-direction: column; 
    margin: 0; 
} 
  
.main { 
    background-color: #99ff99; 
    border-radius: 15px; 
    
    padding: 10px 20px; 
    transition: transform 0.2s; 
    width: 500px; 
    text-align: center; 
} 
  
h1 { 
    color: #4CAF50; 
} 
  
label { 
    display: block; 
    width: 100%; 
    margin-top: 10px; 
    margin-bottom: 5px; 
    text-align: left; 
    color: #555; 
    font-weight: bold; 
} 
  
  
input { 
    display: block; 
    width: 100%; 
    margin-bottom: 15px; 
    padding: 10px; 
    box-sizing: border-box; 
    border: 1px solid #ddd; 
    border-radius: 5px; 
} 
  
button { 
    padding: 15px; 
    border-radius: 10px; 
    margin-top: 15px; 
    margin-bottom: 15px; 
    border: none; 
    color: white; 
    cursor: pointer; 
    background-color: #4CAF50; 
    width: 100%; 
    font-size: 16px; 
} 
  
.wrap { 
    display: flex; 
    justify-content: center; 
    align-items: center; 
}</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html> 
<html> 
  
<head> 
    <title>GeeksforGeeks Registration</title> 
    <link rel="stylesheet" 
          href="style.css"> 
</head> 
  
<body> 
    <div class="main"> 
       
        <h3>Enter your login credentials</h3> 
        <form action="loginauth.jsp"> 
            <label for="Email"> 
                  Email: 
              </label> 
            <input type="text" 
                   id="Email"
                   name="Email" 
                   placeholder="Enter your Email" required> 
  
            <label for="password"> 
                  Password: 
              </label> 
            <input type="password"
                   id="password" 
                   name="Password" 
                   placeholder="Enter your Password" required> 
  
            <div class="wrap"> 
                <button type="submit"
                        onclick="solve()"> 
                    Submit 
                </button> 
            </div> 
        </form> 
        <p>Not registered?  
              <a href="register.jsp" 
               style="text-decoration: none;"> 
                Create an account 
            </a> 
        </p> 
    </div> 
</body> 
  
</html>

</body>
</html>