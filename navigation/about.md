---
layout: page
title: About Me
permalink: /about/
---

<br/><br/>

<style>
    .grid-container {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
        gap: 10px;
    }
    .grid-item {
        text-align: center;
    }
    .grid-item img {
        width: 100%;
        height: 100px;
        object-fit: contain;
    }
    .grid-item p {
        margin: 5px 0;
    }

    .image-gallery-container {
        overflow: hidden;
        position: relative;
        width: 100%;
        height: 200px; /* Adjust based on your needs */
    }

    .image-gallery {
        display: flex;
        flex-wrap: nowrap;
        gap: 10px;
        animation: scroll 20s linear infinite;
        will-change: transform;
    }

    .image-gallery img {
        max-height: 150px;
        object-fit: cover;
        border-radius: 5px;
    }

    @keyframes scroll {
        0% {
            transform: translateX(0);
        }
        100% {
            transform: translateX(-100%);
        }
    }
</style>

<!-- HTML Structure -->
<div class="grid-container" id="grid_container"></div>

<div class="image-gallery-container">
    <div class="image-gallery" id="image_gallery">
        <!-- Images will be added here by JavaScript -->
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        // References to the HTML containers
        var container = document.getElementById("grid_container");
        var gallery = document.getElementById("image_gallery");

        // Data for images
        var living_in_the_world = [
            {"flag": "../assets/images/CR.JPG", "greeting": "Monkey", "description": "Costa Rica"},
            {"flag": "../assets/images/CA.jpg", "greeting": "Dunes", "description": "Yuma Desert"},
            {"flag": "../assets/images/HA.jpg", "greeting": "Seal", "description": "Hawaii"},
            {"flag": "../assets/images/YS.jpg", "greeting": "Bison", "description": "Yellowstone"},
            {"flag": "../assets/images/CR2.jpg", "greeting": "Bison", "description": "Yellowstone"},
            {"flag": "../assets/images/NV.jpg", "greeting": "Bison", "description": "Yellowstone"},
            {"flag": "../assets/images/CC.JPG", "greeting": "Bison", "description": "Yellowstone"},
            {"flag": "../assets/images/PS.jpg", "greeting": "Bison", "description": "Yellowstone"},
        ];

        // Function to populate the grid and gallery
        function populateGallery() {
            // Loop through data to create grid and gallery items
            living_in_the_world.forEach(location => {
                // Grid item
                var gridItem = document.createElement("div");
                gridItem.className = "grid-item";

                var img = document.createElement("img");
                img.src = location.flag;
                img.alt = location.description + " Flag";

                var description = document.createElement("p");
                description.textContent = location.description;

                var greeting = document.createElement("p");
                greeting.textContent = location.greeting;

                // gridItem.appendChild(img);
                // gridItem.appendChild(description);
                // gridItem.appendChild(greeting);

                // container.appendChild(gridItem);

                // Gallery item
                var galleryImg = document.createElement("img");
                galleryImg.src = location.flag;
                galleryImg.alt = location.description + " Flag";

                gallery.appendChild(galleryImg);
            });

            // Duplicate gallery images for seamless scroll
            duplicateGalleryImages();
        }

        // Function to duplicate gallery images
        function duplicateGalleryImages() {
            const items = gallery.children;
            const totalItems = items.length;
            for (let i = 0; i < totalItems; i++) {
                let clone = items[i].cloneNode(true);
                gallery.appendChild(clone);
            }
        }

        // Call the function to populate gallery
        populateGallery();
    });
</script>

## Nikhil Lalwani
Senior at Del Norte High School
Interested in: 
- Engineering
- Computer Science
- GIS (Geographical Information Systems)


I enjoy biking and swimming and I have an aquarium at home. 
- DNHS Swim Team
- [Ride Across California](https://www.rideacrosscalifornia.com/) Youth Support for 3 years
- 22 gallon Planted aquarium at home

This Website will have all the things I make and do in CSA this trimester and possibly even later.

## Resume
- Eagle Scout
- [MIT Beaver Works](https://beaverworks.ll.mit.edu/CMS/bw/bwsi) Program for disaster Response
- Story Map for [Vexcel](https://www.vexcel-imaging.com/) showcased at national Esri User Conference
- National Youth Leadership Training
- National Merit Scholarship Semifinalist
- Debate
- Illumina Genomic Discovery Program
- UCLA LACC program
- Languages
    - Hindi, Spanish, English