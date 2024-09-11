---
layout: page
title: Game
permalink: /game/
---
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rotate and Move Rectangle</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f0f0f0; /* Light background color for the body */
            overflow: hidden; /* Prevents page scrolling */
            height: 100vh; /* Full viewport height */
            position: relative; /* Establishes a positioning context for absolute positioning */
        }
        canvas {
            border: 1px solid #000; /* Border around the canvas */
            position: absolute; /* Use absolute positioning for placement */
            top: 58px; /* Set the vertical position from the top */
            left: 50%; /* Center horizontally */
            transform: translateX(-50%); /* Adjust horizontal centering */
        }
    </style>
</head>
<body>
    <canvas id="myCanvas" width="1280" height="500"></canvas>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const canvas = document.getElementById('myCanvas');
            const ctx = canvas.getContext('2d');

            const rectWidth = 50;
            const rectHeight = 30;
            const rectColor = '#e67e22'; // Orange color
            const canvasBackgroundColor = '#ffffff'; // Canvas background color
            const circleColor = '#ffff00'; // Yellow color
            const circleRadius = 20; // Radius of the circles
            const circleLifetime = 4000; // Circle lifetime in milliseconds (4 seconds)

            let rectX = (canvas.width - rectWidth) / 2;
            let rectY = (canvas.height - rectHeight) / 2;
            let angleDegrees = 0; // Rotation angle in degrees

            let velocity = 0;
            const acceleration = 0.1; // Acceleration per frame
            const maxSpeed = 10; // Maximum speed
            const deceleration = 0.1; // Deceleration per frame

            let keysPressed = {};

            const circles = []; // Array to store circles
            let score = 0; // Score counter

            function drawRectangle() {
                // Clear the canvas with the background color
                ctx.fillStyle = canvasBackgroundColor;
                ctx.fillRect(0, 0, canvas.width, canvas.height);

                // Convert angle to radians for rotation
                const angleRadians = angleDegrees * (Math.PI / 180);

                // Save the current state
                ctx.save();

                // Move to the rectangle's position
                ctx.translate(rectX + rectWidth / 2, rectY + rectHeight / 2);
                // Rotate the canvas
                ctx.rotate(angleRadians);
                // Move back to the original position
                ctx.translate(-rectWidth / 2, -rectHeight / 2);

                // Draw the rectangle
                ctx.fillStyle = rectColor;
                ctx.fillRect(0, 0, rectWidth, rectHeight);

                // Restore the previous state
                ctx.restore();

                // Draw the circles
                ctx.fillStyle = circleColor; // Use the yellow color
                circles.forEach(circle => {
                    ctx.beginPath();
                    ctx.arc(circle.x, circle.y, circleRadius, 0, 2 * Math.PI);
                    ctx.fill();
                });

                // Draw the score
                ctx.fillStyle = '#000000'; // Black color for text
                ctx.font = '24px Arial';
                ctx.textAlign = 'right';
                ctx.fillText('Score: ' + score, canvas.width - 10, 30); // Draw score on the top right

                // Draw "You Crashed" notification if game is reset
                if (gameReset) {
                    ctx.fillStyle = '#ff0000'; // Red color for text
                    ctx.font = '48px Arial';
                    ctx.textAlign = 'center';
                    ctx.fillText('You Crashed!', canvas.width / 2, canvas.height / 2);
                }
            }

            function checkCollision(circle) {
                // Check for collision between rectangle and circle
                const angleRadians = angleDegrees * (Math.PI / 180);
                const cos = Math.cos(-angleRadians);
                const sin = Math.sin(-angleRadians);
                
                // Get rectangle center position
                const rectCenterX = rectX + rectWidth / 2;
                const rectCenterY = rectY + rectHeight / 2;
                
                // Get circle center position
                const circleCenterX = circle.x;
                const circleCenterY = circle.y;
                
                // Transform circle position to rectangle's coordinate space
                const transformedX = cos * (circleCenterX - rectCenterX) - sin * (circleCenterY - rectCenterY) + rectCenterX;
                const transformedY = sin * (circleCenterX - rectCenterX) + cos * (circleCenterY - rectCenterY) + rectCenterY;

                // Check if the circle's center is within the rectangle's bounds
                const dx = Math.max(rectX, Math.min(transformedX, rectX + rectWidth)) - transformedX;
                const dy = Math.max(rectY, Math.min(transformedY, rectY + rectHeight)) - transformedY;
                return (dx * dx + dy * dy) <= (circleRadius * circleRadius);
            }

            function resetGame() {
                window.location.reload();
                // Reset rectangle position and other states
                rectX = (canvas.width - rectWidth) / 2;
                rectY = (canvas.height - rectHeight) / 2;
                angleDegrees = 0;
                velocity = 0;
                score = 0;
                circles.length = 0; // Clear all circles
                gameReset = false;
            }

            let gameReset = false;

            function update() {
                // Handle movement based on angle and key presses
                if (keysPressed['w']) {
                    velocity = Math.min(velocity + acceleration, maxSpeed);
                } else if (keysPressed['s']) {
                    velocity = Math.max(velocity - acceleration, -maxSpeed); // Allow negative velocity for backward movement
                } else {
                    // Apply deceleration when no key is pressed
                    if (velocity > 0) {
                        velocity = Math.max(velocity - deceleration, 0);
                    } else if (velocity < 0) {
                        velocity = Math.min(velocity + deceleration, 0);
                    }
                }

                // Update position based on velocity and angle
                const angleRadians = angleDegrees * (Math.PI / 180);
                rectX += velocity * Math.cos(angleRadians);
                rectY += velocity * Math.sin(angleRadians);

                // Check if the rectangle hits the edge of the canvas
                if (rectX < 0 || rectY < 0 || rectX + rectWidth > canvas.width || rectY + rectHeight > canvas.height) {
                    gameReset = true; // Set flag to show notification
                    alert('You Crashed 💥🚗💥');
                    resetGame();
                }

                // Update angle based on key presses (rotation)
                if (keysPressed['a']) {
                    angleDegrees -= 2; // Rotate counter-clockwise
                }
                if (keysPressed['d']) {
                    angleDegrees += 2; // Rotate clockwise
                }

                // Remove circles that are older than circleLifetime
                const currentTime = Date.now();
                circles.forEach((circle, index) => {
                    if (currentTime - circle.timestamp > circleLifetime) {
                        circles.splice(index, 1);
                    }
                });

                // Check for collisions and update score
                circles.forEach((circle, index) => {
                    if (checkCollision(circle)) {
                        score++;
                        circles.splice(index, 1); // Remove the circle upon collision
                    }
                });

                // Draw the rectangle and circles
                drawRectangle();

                // Continue the animation
                requestAnimationFrame(update);
            }

            function handleKeyDown(event) {
                keysPressed[event.key] = true;
                event.preventDefault(); // Prevent default scrolling
            }

            function handleKeyUp(event) {
                keysPressed[event.key] = false;
            }

            function spawnCircle() {
                // Generate a random position for the circle
                const x = Math.random() * (canvas.width - 2 * circleRadius) + circleRadius;
                const y = Math.random() * (canvas.height - 2 * circleRadius) + circleRadius;
                circles.push({ x, y, timestamp: Date.now() });
            }

            document.addEventListener('keydown', handleKeyDown);
            document.addEventListener('keyup', handleKeyUp);

            // Start the animation
            update();

            // Spawn a circle every 2 seconds
            setInterval(spawnCircle, 2000);
        });
    </script>
</body>
</html>
