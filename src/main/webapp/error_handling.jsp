<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Converter with Error Handling</title>
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
        <h1>Simple Converter</h1>
        <form id="converterForm" onsubmit="return validateForm()">
            <label for="inputValue">Enter a value to convert:</label>
            <input type="number" id="inputValue" name="inputValue" required>
            <button type="submit">Convert</button>
        </form>
        <div id="errorMessage" class="error-message"></div>
        <div id="result"></div>
    </div>

    <script>
        function validateForm() {
            const inputValue = document.getElementById("inputValue").value;
            const errorMessage = document.getElementById("errorMessage");
            const result = document.getElementById("result");

            errorMessage.innerText = ''; // Clear previous errors
            result.innerText = ''; // Clear previous result

            // Basic validation: Check if the input is a number and greater than zero
            if (isNaN(inputValue) || inputValue <= 0) {
                errorMessage.innerText = "Invalid input. Please enter a positive number.";
                return false;
            }

            try {
                // Simulated conversion logic
                const convertedValue = inputValue * 2; // Example conversion
                result.innerText = `Converted value: ${convertedValue}`;
            } catch (error) {
                // Handle unexpected errors
                errorMessage.innerText = `An unexpected error occurred: ${error.message}`;
            }

            return false; // Prevent form submission (for demo purposes)
        }
    </script>
</body>
</html>