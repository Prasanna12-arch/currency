<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Real-time Exchange Rates</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha384-PkzpVuZc3gHkT2oW6wGz01JS6SOkY6elSllZvCFcOwpvRnSEJFvo10orU9twynKC" crossorigin="anonymous">
    <style>
        #exchange-rates {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f9f9f9;
    border: 1px solid #ddd;
    border-radius: 5px;
}

/* Styling for the heading */
#exchange-rates h1 {
    margin-top: 0;
    font-size: 24px;
    text-align: center;
}

/* Styling for the container holding exchange rates */
#rates-container {
    margin-top: 10px;
}

/* Styling for individual exchange rate items */
#rates-container div {
    margin-bottom: 5px;
    font-size: 18px;
}

/* Styling for the last updated text */
#last-updated {
    font-style: italic;
}
        /* Add your CSS styles here */
    </style>
</head>
<body>
    <div id="exchange-rates">
        <h1><i class='fas fa-bell' style='font-size:36px'> Exchange Rates</i></h1>
        <div id="rates-container">
            <!-- Exchange rates will be dynamically inserted here -->
        </div>
        <p>Last updated: 12/08/2023 <span id="last-updated"></span></p>
    </div>

    <script>
        // JavaScript code to fetch and display exchange rates
        // This script will update the exchange rates and last updated time dynamically

        // Function to fetch exchange rates from the API
        function fetchExchangeRates() {
            // Make AJAX request to fetch exchange rates from your server
            // Replace 'your-api-endpoint' with the actual endpoint URL
            fetch('your-api-endpoint')
                .then(response => response.json())
                .then(data => {
                    // Update exchange rates in the DOM
                    updateExchangeRates(data.rates);

                    // Update last updated time
                    updateLastUpdatedTime(data.lastUpdated);
                })
                .catch(error => {
                    console.error('Error fetching exchange rates:', error);
                });
        }

        // Function to update exchange rates in the DOM
        function updateExchangeRates(rates) {
            const ratesContainer = document.getElementById('rates-container');
            ratesContainer.innerHTML = ''; // Clear previous rates

            // Iterate through the rates object and create HTML elements for each rate
            for (const currency in rates) {
                const rate = rates[currency];
                const rateElement = document.createElement('div');
                rateElement.textContent = `${currency}: ${rate}`;
                ratesContainer.appendChild(rateElement);
            }
        }

        // Function to update last updated time in the DOM
        function updateLastUpdatedTime(lastUpdated) {
            const lastUpdatedElement = document.getElementById('last-updated');
            lastUpdatedElement.textContent = new Date(lastUpdated).toLocaleString();
        }

        // Fetch exchange rates when the page loads
        fetchExchangeRates();

        // Fetch exchange rates periodically (e.g., every 5 minutes)
        setInterval(fetchExchangeRates, 300000); // 300000 milliseconds = 5 minutes
    </script>
</body>
</html>