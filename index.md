---
layout: base
title: Nikhil's page of funtimes 
description: My fun lil website
hide: true
---


![sloth](https://www.rainforest-alliance.org/wp-content/uploads/2021/06/three-toed-sloth-teaser-1-400x400.jpg.webp)

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flying Text with User Input</title>
    <style>
        body {
            margin: 0;
            position: relative;
            height: 200vh; /* Ensure there is enough space to scroll */
            background-color: #282c34; /* Dark background for white text contrast */
            color: white;
            overflow-x: hidden; /* Hide horizontal overflow */
            font-family: Arial, sans-serif;
        }

        .input-container {
            position: static;
            bottom: 10px;
            left: 10px;
            z-index: 1000; /* Ensure it stays above other content */
        }

        input[type="text"] {
            padding: 10px;
            font-size: 16px;
            width: 300px;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            margin-left: 10px;
        }

        .flying-text {
            position: fixed; 
            white-space: nowrap;
            font-size: 24px;
            font-weight: bold;
            color: white;
            left: -100%; /* Start off-screen */
            animation: flyAcross 10s linear;
        }

        /* Keyframes for flying text animation */
        @keyframes flyAcross {
            from {
                left: -100%;
            }
            to {
                left: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="input-container">
        <input type="text" id="userInput" placeholder="Enter motivational quote">
        <button onclick="handleSubmit()">Submit</button>
    </div>

    <script>
        // Array to hold sentences
        var sentences = [
            "CODE CODE CODE",
            "BACK TO WORK!",
            "WORK TALK!",
            "LOCK IN!",
            "BE BETTER!",
            "BIG BROTHER IS WATCHING",
            "SEED += 1"
        ];

        function handleSubmit() {
            const inputElement = document.getElementById('userInput');
            const userInput = inputElement.value.trim();

            if (userInput) {
                // Add the input text to the sentences array
                sentences.push(userInput);
                // Create flying text animation for the new sentence
                createFlyingText(userInput);
                inputElement.value = ''; // Clear input field
            } else {
                alert('No text entered!');
            }
        }

        function getRandomSentence() {
            return sentences[Math.floor(Math.random() * sentences.length)];
        }

        function getRandomVerticalPosition() {
            const min = 10; // Minimum distance from the top in pixels
            const max = window.innerHeight - 50; // Maximum distance from the top in pixels
            return Math.random() * (max - min) + min; // Random value between min and max
        }

        
        
        function getRandomColor() {

        const letters = '0123456789ABCDEF';
        let color = '#';
        for (let i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
        }

        
        function createFlyingText(text) {
            const textElement = document.createElement('div');
            textElement.className = 'flying-text';
            textElement.textContent = text;
            textElement.style.top = `${getRandomVerticalPosition()}px`;
            textElement.style.color = getRandomColor();
            document.body.appendChild(textElement);

            // Remove element after animation ends
            textElement.addEventListener('animationend', () => {
                textElement.remove();
            });
        }

        function startSpawningTexts() {
            // Spawn new text every 3-6 seconds
            setInterval(() => {
                createFlyingText(getRandomSentence());
            }, Math.random() * 3000 + 3000);
        }

        // Start spawning texts
        startSpawningTexts();
    </script>
</body>
</html>
