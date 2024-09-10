---
layout: page
title: Game
permalink: /game/
---


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Top-Down Car Driving Game</title>
    <style>
        /* Reset default body margin and padding */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        /* Style for the canvas */
        #gameCanvas {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh; /* Full viewport height */
            z-index: 1; /* Ensure canvas is above other content */
            pointer-events: none; /* Prevent interactions with canvas affecting other content */
            background: rgba(255, 255, 255, 0); /* Transparent background */
        }

        /* Style for scrollable content */
        .content {
            position: relative;
            z-index: 0; /* Ensure content is below the canvas */
            padding: 20px;
            background-color: #f4f4f4;
        }

        /* Example content to enable scrolling */
        .content h1 {
            margin-top: 1500px; /* Space to demonstrate scrolling */
        }

        .content p {
            margin-bottom: 100px; /* Space to demonstrate scrolling */
        }
    </style>
</head>
<body>
    <!-- Game canvas -->
    <canvas id="gameCanvas"></canvas>

    <!-- Scrollable content -->
    <div class="content">
        <h1>Scrollable Content</h1>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vel ligula sed lacus egestas hendrerit. Donec auctor magna nec libero egestas, at ultrices dolor auctor. Cras sit amet velit nec ipsum interdum varius.</p>
        <p>More content to enable scrolling. Curabitur consequat ultricies nunc, et ullamcorper lacus vehicula eget. Nullam luctus erat orci, eu tincidunt augue gravida et. Phasellus at erat nulla. Proin sit amet nisl non ante fermentum varius vel at orci.</p>
        <!-- Add more content as needed -->
    </div>

    <script>
        // JavaScript for game logic

        // Get canvas element and context
        const canvas = document.getElementById('gameCanvas');
        const ctx = canvas.getContext('2d');

        // Set canvas size to full viewport width and height
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;

        // Car properties
        const carWidth = 50;
        const carHeight = 30;
        const carSpeed = 5;

        let car = {
            x: canvas.width / 2 - carWidth / 2,
            y: canvas.height / 2 - carHeight / 2,
            width: carWidth,
            height: carHeight,
            speed: carSpeed,
            dx: 0,
            dy: 0
        };

        // Draw the car
        function drawCar() {
            ctx.fillStyle = '#ff6347'; // Car color (tomato red)
            ctx.fillRect(car.x, car.y, car.width, car.height);
        }

        // Clear the canvas
        function clear() {
            ctx.clearRect(0, 0, canvas.width, canvas.height);
        }

        // Update car position
        function update() {
            // Update car position based on direction
            car.x += car.dx;
            car.y += car.dy;

            // Sync page scroll with car's y position
            window.scrollTo(0, car.y);

            // Boundary conditions
            if (car.y < 0) car.y = 0;
            if (car.y + car.height > canvas.height) car.y = canvas.height - car.height;
            if (car.x < 0) car.x = 0;
            if (car.x + car.width > canvas.width) car.x = canvas.width - car.width;
        }

        // Draw the game
        function draw() {
            clear();
            drawCar();
            update();
        }

        // Move the car based on key press
        function moveCar(e) {
            switch(e.key) {
                case 'ArrowUp':
                    car.dy = -car.speed;
                    break;
                case 'ArrowDown':
                    car.dy = car.speed;
                    break;
                case 'ArrowLeft':
                    car.dx = -car.speed;
                    break;
                case 'ArrowRight':
                    car.dx = car.speed;
                    break;
                default:
                    break;
            }
        }

        // Stop the car when key is released
        function stopCar(e) {
            if (['ArrowUp', 'ArrowDown'].includes(e.key)) {
                car.dy = 0;
            }
            if (['ArrowLeft', 'ArrowRight'].includes(e.key)) {
                car.dx = 0;
            }
        }

        // Add event listeners for keydown and keyup
        document.addEventListener('keydown', moveCar);
        document.addEventListener('keyup', stopCar);

        // Set game loop to run at 60 frames per second
        setInterval(draw, 1000 / 60);

        // Adjust canvas size on window resize
        window.addEventListener('resize', () => {
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;
        });
    </script>
</body>
</html>
