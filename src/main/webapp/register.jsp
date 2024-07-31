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
  
#pass { 
    color: red; 
    font-size: 12px; 
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
  
select { 
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
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="registerservlet.jsp"> 
    <div class="main"> 
        <h1>Welcome To Registration Page</h1> 
        <table>
            <tr>
                <td><label for="Name">Name:</label></td>
                <td><input type="text" id="Name" name="Name" placeholder="Enter your name" required></td>
            </tr>
            <tr>
                <td><label for="Email">Email:</label></td>
                <td><input type="email" id="Email" name="Email" placeholder="Enter your email" required></td>
            </tr>
            <tr>
                <td><label for="Contact">Contact:</label></td>
                <td><input type="text" id="Contact" name="Contact" placeholder="Enter your Mobile Number" required maxlength="10"></td>
            </tr>
            <tr>
                <td><label for="Password">Password:</label></td>
                <td>
                    <input type="password" id="password" name="Password"
                        placeholder="Enter your password"
                        pattern="^(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])\S{8,}$"
                        required title="Password must contain at least one number,
                        one alphabet, one symbol, and be at least 8 characters long">
                </td>
            </tr>
        </table>
        <div class="wrap">
            <button type="submit" onclick="solve()">Submit</button>
        </div>
        <div class="container sign in">
            <p>Already have an account? <a href="login.jsp">Sign in</a></p>
        </div>
    </div>
</form>

</body>
</html>


