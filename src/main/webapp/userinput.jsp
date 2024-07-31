<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Currency Converter</title>
    <!-- Include Font Awesome CSS for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha384-PkzpVuZc3gHkT2oW6wGz01JS6SOkY6elSllZvCFcOwpvRnSEJFvo10orU9twynKC" crossorigin="anonymous">
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        .container {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        input[type="number"] {
            width: calc(100% - 10px);
            padding: 10px;
            margin: 5px 0;
            box-sizing: border-box;
        }
        select {
            width: calc(100% - 10px);
            padding: 10px;
            margin: 5px 0;
            box-sizing: border-box;
        }
        button {
            background-color: #008CBA;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
        }
        button:hover {
            background-color: #005f73;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Currency Converter</h2>
    <input type="number" id="amount" placeholder="Enter amount to convert" step="0.01">
    <br>
    <select id="fromCurrency">
        <option value="USD">USD</option>
        <option value="EUR">EUR</option>
        <!-- Add more currency options as needed -->
    </select>
    to
    <select id="toCurrency">
        <option value="EUR">EUR</option>
        <option value="USD">USD</option>
        <!-- Add more currency options as needed -->
    </select>
    <br>
    <button onclick="convertCurrency()">Convert</button>
    <br>
    <p id="result"></p>
    <p id="error" class="error"></p>
</div>

<script>
    async function convertCurrency() {
        const amountInput = document.getElementById('amount');
        const amount = parseFloat(amountInput.value);
        const fromCurrency = document.getElementById('fromCurrency').value;
        const toCurrency = document.getElementById('toCurrency').value;
        const errorElement = document.getElementById('error');

        // Reset error message
        errorElement.textContent = '';
        // Validate amount
        if (isNaN(amount) || amount <= 0) {
            errorElement.textContent = 'Please enter a valid positive number for amount.';
            return;
        }

        try {
            const response = await fetch(`https://api.exchangerate-api.com/v4/latest/${fromCurrency}`);
            const data = await response.json();

            if (data.error) {
                throw new Error(data.error);
            }

            const exchangeRate = data.rates[toCurrency];
            if (!exchangeRate) {
                throw new Error(`Exchange rate not available for ${toCurrency}`);
            }

            const convertedAmount = parseFloat((amount * exchangeRate).toFixed(2));
            document.getElementById('result').innerText = `Converted Amount: ${convertedAmount} ${toCurrency}`;
        } catch (error) {
            errorElement.textContent = error.message;
        }
    }
</script>

</body>
</html>