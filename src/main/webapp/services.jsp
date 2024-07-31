<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Services</title>
    <style>
        /* Basic styles for the body */
        body {
            margin: 0; /* Remove default margin */
            padding: 0; /* Remove default padding */
            font-family: Arial, sans-serif; /* Set default font */
            background-color: #ccccff; /* Light background color */
        }

        /* Header styles */
        .header {
            background-color: #ccccff; /* Dark background for the header */
            color: black; /* White text */
            padding: 10px 20px; /* Padding for the header */
            text-align: center; /* Center-align the text */
            font-size: 1.5em; /* Larger font size */
        }

        /* Content area styles */
        .content {
            padding: 20px; /* Padding for the content */
            text-align: center; /* Center-align the text */
        }

        /* Styling for buttons and links */
        .button {
            background-color: #008CBA; /* Blue button background */
            color: white; /* White text */
            padding: 10px 20px; /* Padding for buttons */
            text-decoration: none; /* No underline */
            border: none; /* No border */
            border-radius: 5px; /* Rounded corners */
            cursor: pointer; /* Pointer cursor on hover */
            font-size: 1em; /* Standard font size */
        }

        /* Hover effect for buttons */
        .button:hover {
            background-color: #005f73; /* Darker blue on hover */
        }

        /* Table styles for displaying currency rates */
        table {
            margin: 20px auto; /* Center-align the table */
            border-collapse: collapse; /* Collapse table borders */
            width: 80%; /* Set table width */
        }

        table, th, td {
            border: 1px solid #ddd; /* Table border */
        }

        th, td {
            padding: 10px; /* Padding for table cells */
            text-align: center; /* Center-align text */
        }

        th {
            background-color: #333; /* Dark background for table headers */
            color: white; /* White text */
        }
    </style>
</head>
<body>
    <div class="header">
        <h1> Services</h1> <!-- Heading in the header -->
    </div>

    <div class="content">
        <p>We offer a variety of currency-related services, including currency conversion and exchange rate information.</p>

        <!-- Currency conversion button -->
        <a href="design.jsp" class="button">Sample Design</a> <!-- Change the link as needed -->

        <!-- Table for displaying sample currency rates -->
        <table>
            <thead>
                <tr>
                    <th>Currency</th>
                    <th>Rate (USD)</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>EUR</td>
                    <td>1.10</td>
                </tr>
                <tr>
                    <td>GBP</td>
                    <td>1.25</td>
                </tr>
                <tr>
                    <td>JPY</td>
                    <td>0.009</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>