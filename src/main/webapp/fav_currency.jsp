<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Favorite Currencies</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

h2, h3 {
    text-align: center;
    color: #333;
}

#favoriteForm {
    max-width: 400px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
    display: block;
    margin-bottom: 10px;
    color: #333;
}

select {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

button {
    width: 100%;
    padding: 10px;
    background-color: #4caf50;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #45a049;
}

#favoriteList {
    list-style: none;
    padding: 0;
    margin: 0 auto;
    max-width: 400px;
}

#favoriteList li {
    margin-bottom: 10px;
    padding: 10px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

#favoriteList li:hover {
    background-color: #f0f0f0;
}
</style>
</head>
<body>

<h2>Favorite Currencies</h2>

<form action="fav_survlet.jsp"> 
<table>
 <tr>
                <td><label for="Name">Name:</label></td>
                <td><input type="text" id="Name" name="Name" placeholder="Enter your name" required></td>
            </tr>
            </table><br>
    <label for="currency">Add_a_new_favorite_currency:</label><br>
    <select id="currency" name="Add_a_new_favorite_currency" required>
        <!-- Options for currency selection -->
        <option value="USD">USD - United States Dollar</option>
        <option value="EUR">EUR - Euro</option>
        <option value="GBP">GBP - British Pound Sterling</option>
        <!-- Add more options as needed -->
    </select><br>
    
    <div class="wrap">
            <button type="submit" onclick="solve()">Add Favorite</button>
        </div>
</form>

<h3>Your Favorite Currencies</h3>
</body>
</html>