---
layout: base
title: Nikhil's page of funtimes and code :) 
description: My fun lil website
hide: true
---

CODE! CODE! CODE!



![sloth](https://www.rainforest-alliance.org/wp-content/uploads/2021/06/three-toed-sloth-teaser-1-400x400.jpg.webp)
sloth

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Round Number Input</title>
    <script>
        function roundNumber() {
            // Get the value from the input field
            let numInput = document.getElementById('numberInput').value;
            // Parse the number and round it
            let roundedNum = Math.round(parseFloat(numInput));
            // Display the rounded number in the result span
            document.getElementById('result').textContent = 'Rounded Number: ' + roundedNum;
        }
    </script>
</head>
<body>
    <h1>Round a Number</h1>
    <form onsubmit="event.preventDefault(); roundNumber();">
        <label for="numberInput">Enter a number:</label>
        <input type="number" id="numberInput" step="any">
        <button type="submit">Round Number</button>
    </form>
    <p id="result"></p>
</body>
</html>