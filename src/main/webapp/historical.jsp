<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Historical Exchange Rates</title>
    <!-- Include CSS for styling -->
    <style>
    body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f2f2f2;
}

h1 {
    text-align: center;
    margin-top: 20px;
}

.currency-selector {
    text-align: center;
    margin-top: 20px;
}

/* Style select box */
label {
    font-weight: bold;
}

select {
    padding: 8px;
    font-size: 16px;
    margin-left: 10px;
}

button {
    padding: 8px 20px;
    font-size: 16px;
    background-color: #4CAF50;
    color: white;
    border: none;
    cursor: pointer;
    margin-left: 10px;
}

button:hover {
    background-color: #45a049;
}

/* Style historical rates table */
#historical-rates {
    margin-top: 20px;
    width: 80%;
    margin-left: auto;
    margin-right: auto;
}

table {
    border-collapse: collapse;
    width: 100%;
    border: 1px solid #ddd;
}

th, td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #4CAF50;
    color: white;
}
</style>
    
</head>
<body>
    <h1>Historical Exchange Rates</h1>
    <div class="currency-selector">
        <label for="currency">Select Currency:</label>
        <select id="currency">
            <option value="USD">USD - US Dollar</option>
            <option value="EUR">EUR - Euro</option>
            <option value="GBP">GBP - British Pound</option>
            <!-- Add more currency options as needed -->
        </select>
        <button onclick="submit">Fetch Rates</button>
    </div>
    <div id="historical-rates">
        <!-- Display historical rates here -->
    </div>

    <!-- Include JavaScript for fetching and displaying data -->
    <script src="script.jsp"></script>
</body>
</html>