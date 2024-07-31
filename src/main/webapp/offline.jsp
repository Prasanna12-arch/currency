<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Offline Currency Converter</title>
    <style>
    body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 600px;
    margin: 50px auto;
    padding: 20px;
    background-color: #ffffff;
    border: 1px solid #ddd;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

h1 {
    text-align: center;
}

label {
    font-size: 1.2em;
}

input {
    display: block;
    margin: 10px 0;
    padding: 8px;
    width: 100%;
}

button {
    padding: 10px;
    font-size: 1.2em;
    background-color: #28a745;
    color: #ffffff;
    border: none;
    cursor: pointer;
}

button:hover {
    background-color: #218838;
}

.error-message {
    color: #ff0000;
    font-size: 1em;
    margin-top: 10px;
}

#errorMessage {
    text-align: center;
}

#result {
    text-align: center;
    font-size: 1.2em;
    margin-top: 20px;
}
    </style>
</head>
<body>
    <div class="container">
        <h1>Offline Currency Converter</h1>
        <form id="converterForm">
            <label for="fromCurrency">From:</label>
            <input type="text" id="fromCurrency" name="fromCurrency" placeholder="USD" required>

            <label for="toCurrency">To:</label>
            <input type="text" id="toCurrency" name="toCurrency" placeholder="EUR" required>

            <label for="amount">Amount:</label>
            <input type="number" id="amount" name="amount" required>

            <button type="button" onclick="convertCurrency()">Convert</button>
        </form>
        <div id="errorMessage" class="error-message"></div>
        <div id="result"></div>
    </div>

    <script>

    Copy code
    // offlineConverter.js
    const dbName = "CurrencyConverter";
    const dbVersion = 1;

    // Initialize IndexedDB
    function openDatabase() {
        return new Promise((resolve, reject) => {
            const request = indexedDB.open(dbName, dbVersion);
            request.onupgradeneeded = (event) => {
                const db = event.target.result;
                if (!db.objectStoreNames.contains("exchangeRates")) {
                    db.createObjectStore("exchangeRates", { keyPath: "pair" });
                }
            };
            request.onsuccess = (event) => {
                resolve(event.target.result);
            };
            request.onerror = (event) => {
                reject(event.target.error);
            };
        });
    }

    // Fetch exchange rates and store them in IndexedDB
    async function updateExchangeRates() {
        const db = await openDatabase();
        const tx = db.transaction("exchangeRates", "readwrite");
        const store = tx.objectStore("exchangeRates");

        // Example exchange rates (normally you'd fetch these from an API)
        const rates = [
            { pair: "USD/EUR", rate: 0.85 },
            { pair: "EUR/USD", rate: 1.18 },
            { pair: "USD/GBP", rate: 0.72 },
            { pair: "GBP/USD", rate: 1.39 },
        ];

        rates.forEach((rate) => {
            store.put(rate);
        });

        await tx.complete;
    }

    async function getExchangeRate(from, to) {
        const db = await openDatabase();
        const tx = db.transaction("exchangeRates", "readonly");
        const store = tx.objectStore("exchangeRates");

        const ratePair = `${from}/${to}`;
        const request = store.get(ratePair);

        return new Promise((resolve, reject) => {
            request.onsuccess = (event) => {
                const data = event.target.result;
                if (data) {
                    resolve(data.rate);
                } else {
                    reject(`Exchange rate not found for ${ratePair}`);
                }
            };
            request.onerror = (event) => {
                reject(`Error fetching exchange rate: ${event.target.error}`);
            };
        });
    }

    async function convertCurrency() {
        const fromCurrency = document.getElementById("fromCurrency").value;
        const toCurrency = document.getElementById("toCurrency").value;
        const amount = parseFloat(document.getElementById("amount").value);
        const errorMessage = document.getElementById("errorMessage");
        const result = document.getElementById("result");

        errorMessage.innerText = ""; // Clear previous errors
        result.innerText = ""; // Clear previous result

        try {
            if (isNaN(amount) || amount <= 0) {
                throw new Error("Invalid amount. Please enter a positive number.");
            }

            const exchangeRate = await getExchangeRate(fromCurrency, toCurrency);

            const convertedAmount = amount * exchangeRate;
            result.innerText = `Converted amount: ${convertedAmount.toFixed(2)} ${toCurrency}`;
        } catch (error) {
            errorMessage.innerText = `Error: ${error.message}`;
        }
    }

    // Register Service Worker
    if ('serviceWorker' in navigator) {
        window.addEventListener('load', () => {
            navigator.serviceWorker
                .register('serviceWorker.js')
                .then(() => {
                    console.log('Service Worker registered successfully');
                })
                .catch((error) => {
                    console.error('Service Worker registration failed:', error);
                });
        });
    }
    </script>
</body>
</html>