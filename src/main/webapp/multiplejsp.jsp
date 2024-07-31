<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Multi-Currency Converter</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha384-PkzpVuZc3gHkT2oW6wGz01JS6SOkY6elSllZvCFcOwpvRnSEJFvo10orU9twynKC" crossorigin="anonymous">
   <style>
    body {
  font-family: Arial, sans-serif; /* Set a default font */
  background-color: #f5f5f5; /* Light gray background */
  margin: 0;
  padding: 20px;
}

h1 {
  text-align: center; /* Center align the heading */
  color: #333; /* Dark gray text */
}

p {
  color: #666; /* Medium gray text */
  line-height: 1.5; /* Improve readability */
}

/* Form Styles */
form {
  max-width: 600px; /* Limit form width */
  margin: 0 auto; /* Center the form */
  padding: 20px; /* Add padding around the form */
  background-color: #fff; /* White background */
  border: 1px solid #ddd; /* Light border */
  border-radius: 10px; /* Rounded corners */
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Light shadow */
}

label {
  font-weight: bold; /* Bold labels */
}

input, select {
  width: 100%; /* Full-width inputs */
  padding: 10px; /* Add padding */
  margin-top: 10px; /* Space between fields */
  border: 1px solid #ccc; /* Light border */
  border-radius: 5px; /* Rounded corners */
}

button {
  background-color: #4CAF50; /* Green background */
  color: white; /* White text */
  padding: 10px 20px; /* Padding around text */
  border: none; /* No border */
  border-radius: 5px; /* Rounded corners */
  cursor: pointer; /* Pointer cursor on hover */
  transition: background-color 0.3s; /* Smooth hover transition */
}

button:hover {
  background-color: #45a049; /* Darker green on hover */
}

/* Result Section Styles */
#result {
  font-size: 1.2em; /* Slightly larger font size */
  color: #444; /* Dark gray text */
  text-align: center; /* Center align text */
  margin-top: 20px; /* Add space above result section */
}

/* Responsive Design */
@media (max-width: 600px) {
  form {
    padding: 10px; /* Less padding for smaller screens */
  }

  button {
    width: 100%; /* Full-width buttons on small screens */
  }
}
</style>
    <script>
        // This JavaScript function handles the currency conversion
        function convertCurrency() {
            // Get values from the input fields
            const fromCurrency = document.getElementById("fromCurrency").value;
            const toCurrency = document.getElementById("toCurrency").value;
            const amount = parseFloat(document.getElementById("amount").value);

            // Create an XMLHttpRequest object for AJAX
            const xhr = new XMLHttpRequest();

            // Set up the request to your servlet
            xhr.open("POST", "/currencyConverter", true); // Adjust servlet path as needed
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // Parse the response
                    const response = JSON.parse(xhr.responseText);
                    // Display the converted amount
                    document.getElementById("result").innerText = `Converted Amount: ${response.convertedAmount.toFixed(2)}`;
                } else if (xhr.readyState === 4 && xhr.status !== 200) {
                    // Handle errors
                    document.getElementById("result").innerText = "Error converting currency.";
                }
            };

            // Send the request with the input values
            xhr.send(`fromCurrency=${fromCurrency}&toCurrency=${toCurrency}&amount=${amount}`);
        }
    </script>
</head>
<body>
   <h1> <i class='far fa-money-bill-alt' style='font-size:36px'> Multi-Currency Converter</i></h1>
    <form onsubmit="event.preventDefault(); convertCurrency();"> <!-- Prevent form submission and use AJAX -->
        <label for="fromCurrency">From:</label>
        <select id="fromCurrency" required>
            <option value="USD">USD - United States Dollar</option>
            <option value="EUR">EUR - Euro</option>
            <option value="JPY">JPY - Japanese Yen</option>
            <option value="GBP">GBP - British Pound</option>
            <option value="AUD">AUD - Australian Dollar</option>
            <option value="CAD">CAD - Canadian Dollar</option>
            <option value="CHF">CHF - Swiss Franc</option>
            <option value="CNY">CNY - Chinese Yuan</option>
            <option value="INR">INR - Indian Rupee</option>
            <!-- Add more currency options as needed -->
        </select>
        <br>
        <label for="toCurrency">To:</label>
        <select id="toCurrency" required>
            <!-- Same options as 'fromCurrency' -->
            <option value="USD">USD - United States Dollar</option>
            <option value="EUR">EUR - Euro</option>
            <option value="JPY">JPY - Japanese Yen</option>
            <option value="GBP">GBP - British Pound</option>
            <option value="AUD">AUD - Australian Dollar</option>
            <option value="CAD">CAD - Canadian Dollar</option>
            <option value="CHF">CHF - Swiss Franc</option>
            <option value="CNY">CNY - Chinese Yuan</option>
            <option value="INR">INR - Indian Rupee</option>
        </select>
        <br>
        <label for="amount">Amount:</label>
        <input type="number" id="amount" step="0.01" required placeholder="Enter amount to convert">
        <br><br>
        <button type="submit">Convert</button> <!-- This triggers the JavaScript function -->
    </form>

    

</body>
</html>