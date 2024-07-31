<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Real-Time Currency Converter</title>
    <style>
    body {
  font-family: Arial, sans-serif; /* Default font */
  background-color: #f0f0f0; /* Light gray background */
  margin: 0;
  padding: 20px; /* Padding around the content */
}

h1 {
  text-align: center; /* Center align the heading */
  color: #333; /* Dark gray color */
  margin-bottom: 20px; /* Space below the heading */
}

/* Form Styling */
form {
  max-width: 600px; /* Limit form width */
  margin: 0 auto; /* Center the form */
  padding: 20px; /* Add padding inside the form */
  background-color: #ffffff; /* White background */
  border: 1px solid #ddd; /* Light gray border */
  border-radius: 10px; /* Rounded corners */
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
}

label {
  display: block; /* Ensure labels occupy full line */
  font-weight: bold; /* Bold labels */
  margin-bottom: 8px; /* Space below the label */
}

input, select {
  width: 100%; /* Full-width inputs and selects */
  padding: 10px; /* Padding inside the fields */
  border: 1px solid #ccc; /* Light gray border */
  border-radius: 5px; /* Rounded corners */
  margin-bottom: 16px; /* Space below each field */
}

button {
  background-color: #4CAF50; /* Green background */
  color: white; /* White text */
  padding: 10px 20px; /* Padding */
  border: none; /* No border */
  border-radius: 5px; /* Rounded corners */
  cursor: pointer; /* Pointer cursor */
  transition: background-color 0.3s; /* Smooth hover transition */
}

button:hover {
  background-color: #45a049; /* Darker green on hover */
}

/* Update Indicator */
#updateIndicator {
  text-align: center; /* Center align the text */
  color: #333; /* Dark gray color */
  font-size: 1em; /* Normal font size */
  margin-top: 10px; /* Space above the indicator */
}

/* Result Styling */
#result {
  font-size: 1.2em; /* Slightly larger font size */
  text-align: center; /* Center align the text */
  color: #444; /* Dark gray color */
  margin-top: 20px; /* Space above the result */
}

/* Responsive Design */
@media (max-width: 600px) {
  form {
    padding: 10px; /* Less padding for smaller screens */
  }

  button {
    width: 100%; /* Full-width button on small screens */
  }
}
    </style>
    <script>
        let latestRates = {}; // Store latest exchange rates
        let lastUpdate = null; // Store the last update timestamp

        async function fetchLatestRates() {
            const response = await fetch(`https://api.exchangerate-api.com/v4/latest/USD`); // Base currency
            if (response.ok) {
                latestRates = await response.json(); // Get rates data
                lastUpdate = new Date(); // Update the last update time
                document.getElementById("updateIndicator").innerText = `Rates last updated at: ${lastUpdate.toLocaleTimeString()}`;
            }
        }

        async function convertCurrency() {
            const amount = parseFloat(document.getElementById("amount").value);
            const fromCurrency = document.getElementById("fromCurrency").value;
            const toCurrency = document.getElementById("toCurrency").value;

            const exchangeRate = latestRates.rates[toCurrency] / latestRates.rates[fromCurrency]; // Get the conversion rate
            const convertedAmount = amount * exchangeRate; // Calculate the converted amount

            document.getElementById("result").innerText = `Converted Amount: ${convertedAmount.toFixed(2)} ${toCurrency}`;
        }

        function startPeriodicUpdates() {
            fetchLatestRates(); // Fetch rates on load
            setInterval(fetchLatestRates, 30000); // Update every 30 seconds
        }
    </script>
</head>
<body onload="startPeriodicUpdates()"> <!-- Start updates when the page loads -->
    <h1>Real-Time Currency Converter</h1>

    <div id="updateIndicator" style="text-align: center;">Loading...</div> <!-- Update indicator -->

    <form onsubmit="event.preventDefault(); convertCurrency();"> <!-- Prevent default form submission -->
        <label for="amount">Amount:</label>
        <input type="number" id="amount" step="0.01" required placeholder="Enter amount to convert">
        <br>
        <label for="fromCurrency">From:</label>
        <select id="fromCurrency" required>
            <option value="USD">USD - United States Dollar</option>
            <option value="EUR">EUR - Euro</option>
            <option value="JPY">JPY - Japanese Yen</option>
            <option value="GBP">GBP - British Pound</option>
            <option value="AUD">AUD - Australian Dollar</option>
            <!-- Add more currencies as needed -->
        </select>
        <br>
        <label for="toCurrency">To:</label>
        <select id="toCurrency" required>
            <option value="USD">USD - United States Dollar</option>
            <option value="EUR">EUR - Euro</option>
            <option value="JPY">JPY - Japanese Yen</option>
            <option value="GBP">GBP - British Pound</option>
            <option value="AUD">AUD - Australian Dollar</option>
            <!-- Add more currencies as needed -->
        </select>
        <br>
        <button type="submit">Convert</button>
    </form>

    
</body>
</html>