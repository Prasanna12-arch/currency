<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Currency Converter</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha384-PkzpVuZc3gHkT2oW6wGz01JS6SOkY6elSllZvCFcOwpvRnSEJFvo10orU9twynKC" crossorigin="anonymous">
    <style>
    body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    color: #333;
    margin: 0;
    padding: 20px;
}

/* Styling for the converter heading */
h1 {
    text-align: center;
    color: #4CAF50;
}

/* Styling the form and form elements */
form {
    max-width: 400px;
    margin: 0 auto; /* Center the form */
    padding: 20px;
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

input {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
}

button:hover {
    background-color: #45a049; /* Darken the button color on hover */
}

/* Styling the result section */
#result {
    text-align: center;
    margin-top: 20px;
    font-size: 1.2em;
}
    </style>
    
</head>
<body>
    <h1><i class='fas fa-dollar-sign' style='font-size:36px'> Currency Converter</i></h1>
    <form onsubmit="event.preventDefault(); convertCurrency();">
        <label for="fromCurrency">From:</label>
        <input type="text" id="fromCurrency" placeholder="e.g., USD" required>
        <br>
        <label for="toCurrency">To:</label>
        <input type="text" id="toCurrency" placeholder="e.g., EUR" required>
        <br>
        <label for="amount">Amount:</label>
        <input type="number" id="amount" step="0.01" required>
        <br>
        <button type="submit">Convert</button>
    </form>
<script>
        function convertCurrency() {
            const fromCurrency = document.getElementById("fromCurrency").value;
            const toCurrency = document.getElementById("toCurrency").value;
            const amount = document.getElementById("amount").value;

            // Create an XMLHttpRequest object
            const xhr = new XMLHttpRequest();

            xhr.open("POST", "/currencyConverter", true); // Adjust the servlet path as needed
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    const response = JSON.parse(xhr.responseText);
                    document.getElementById("result").innerText = `Converted Amount: ${response.convertedAmount}`;
                }
            };

            // Send the request
            xhr.send(`fromCurrency=${fromCurrency}&toCurrency=${toCurrency}&amount=${amount}`);
        }
    </script>
    
</body>
</html>