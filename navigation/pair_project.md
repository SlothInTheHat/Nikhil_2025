---
layout: page
title: Cookie Clicker
permalink: /pair_project/
---

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Scoped styles to avoid conflicts with Cayman theme */
        .cookie-clicker-container {
            text-align: center;
            padding: 20px;
        }
        #cookieButton {
            font-size: 2rem;
            padding: 10px 20px;
            cursor: pointer;
            background-color: #073d6e;
            border: none;
            border-radius: 5px;
        }
        #cookieButton:hover {
            background-color: #E67E22;
        }
        #cookieCount {
            font-size: 1.5rem;
        }
    </style>
</head>
<body>
    <div class="cookie-clicker-container">
        <button id="cookieButton"> 🍪 Click me!</button>
        <button id="upgradeButton"> 2x upgrade</button>
        <p>Cookies: <span id="cookieCount">0</span></p>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            let cookieCount = 0;
            let multiplier  = 1;
            let upgradePrice = 20;
            const cookieButton = document.getElementById('cookieButton');
            const upgradeButton = document.getElementById('upgradeButton');
            const cookieCountDisplay = document.getElementById('cookieCount');
            upgradeButton.textContent = "2x Price:" + upgradePrice
            cookieButton.addEventListener('click', () => {
                cookieCount += multiplier;
                cookieCountDisplay.textContent = cookieCount;
                upgradeButton.textContent = "2x Price:" + upgradePrice
            });
            upgradeButton.addEventListener('click', () => {
                if (cookieCount > upgradePrice){
                    cookieCount -= upgradePrice;
                    cookieCountDisplay.textContent = cookieCount;
                    multiplier = multiplier * 2;
                    upgradePrice  = upgradePrice*(2**multiplier);
                    upgradeButton.textContent = "2x Price:" + upgradePrice
                }
                else{
                    alert("Not Enough 🍪 for upgrade")
                }
            });
        });
    </script>
</body>
</html>
