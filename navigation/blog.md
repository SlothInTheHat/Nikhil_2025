---
layout: blogs 
title: Blogs
search_exclude: true
permalink: /blogs/
comments: true
---

# What I've done so far


## Week 1

There was a lot of learning this week. I set up my page and downloaded all the tools. I also made a bash script to show tool versions and start the venv so I don't have to run each command individually.

Had to create a Github access key to push to my own repo.
-   did this 3 times because I kept changing my repo name
    git remote add origin https://<TOKEN>@github.com/<REPO-OWNER-USERNAME>/<REPO-NAME>

### lots of terminal stuff:
- Learned about giving execute permissions with chmod
- Renaming files and moving them around

## Week 2-3

### Custom theme for my site
I modified the default minima leaf theme to have different colors that I liked. It's still a bit dark for my liking so I might change that.

### First time using HTML
Made a program to fly text across the screen with motivational quotes. I added a user input field to add to the quote list. 
- Lots of ChatGPT and Stack Overflow involved. 
- still not entirely confident with HTML.
 
## Notes
- use java 17

## Week 4

### Animated images on about page

### Car game
still needs improvement ie textures and stuff


### Cookie Clicker Pair Project
added an upgrade button


# Team Teaches

1. Learn Units #1-#10 from the College Board.
2. Build a lesson using Java for each of the topics provided by the teacher’s starters.
3. The lesson should include a Tech Talk portion, popcorn hacks, and homework hacks. The lesson should NOT have more than 5 minutes of talking before engaging students in an activity (e.g., popcorn hacks).
3. Be prepared to grade homework. This means having a plan for homework and a plan for grading the homework. You will grade on a “1-point” scale. 
4. Weight popcorn hacks and homework hacks in the grading.
5. Lesson time will be between 20 and 30 minutes. Homework time should be about the same as lesson time.


## Unit 2 Classes takeaways

Classes are the basis of all OOP in Java

Classes can have multiple constructors

They can also have methods that are a part of the Classes

primitive types are usually lowercase while their wrapped counterparts are capatalized ie. Integer

## Unit 3 Booleans takeaways

Boolean logic is pretty standard between langages

Conditions in java follow the format:
`if (condition) {output}`

Most of the stuff is pretty standard

One thing that I thought was interesting was how inverting booleans follows De Morgan's law
![image](../assets/images/unit3bools.png)

## Unit 4 Iteration takeaways

Also quite similar to Python

For loops
`for(int i = 0; i < array.length; i++){do stuff}`

While Loops
`while(i < 10){do stuff}`

the `charAt(index)` can be used to iterate through strings

## Unit 5 Classes takeaways

Classes are essential to OOP
This is the notation to create a class:

```
public class Car {
    // Attributes of the car
    private String make;
    private String model;
    private int year;
    private double mileage;

    // Constructor 1: Default constructor
    public Car() {
        this.make = "Unknown";
        this.model = "Unknown";
        this.year = 0;
        this.mileage = 0.0;
    }

    // Constructor 2: Parameterized constructor
    public Car(String make, String model, int year, double mileage) {
        this.make = make;
        this.model = model;
        this.year = year;
        this.mileage = mileage;
    }

    // Method to display the car details
    public void displayCarInfo() {
        System.out.println("Car Make: " + make);
        System.out.println("Car Model: " + model);
        System.out.println("Year: " + year);
        System.out.println("Mileage: " + mileage + " miles");
    }
}
```

Classes let us reuse code and help with abstraction.


## Unit 6 Arrays takeaways

Creating an array: `int [] array1 = new int[5]`

No negatative indexing (unlike python)

Arrays have a set size that is defined at their creation

You can use for loops and advanced for loops to iterate through Arrays
  **Note you can not modify elements of array when using advanced for loop**

## Unit 7 Arraylists takeaways

importing Arraylist: `import java.util.ArrayList;`

create a new arraylist: `ArrayList<Integer> numbersList = new ArrayList<>();`

Arraylists are like Java's version of Python lists. 

They have methods like:

- .size()

- .remove()

- .add()

that have similar functionality to Python lists

They are also not limited in size the same way arrays are. 

## Unit 8 2D Arrays takeaways

2D arrays are just nested arrays. 

How to create a nested array:

```
int[][] array = {
            {90, 85, 88, 92}, 
            {75, 80, 78, 85},
            {60, 65, 70, 75}
        };

```

These can be useful for creating grids

## Unit 9 Inheritence takeaways 

Our lesson!

Inheritence very importent for abstraction

How to inherit from a class: 

'''
public class Triangle extends Shape
'''

Remember to use `@Override` keyword when overriding methods

`super()` takes attributes from the parent class



## Memory From Presentation

  My attempt at an analogy between Mr. Mortensen and Inheritence did not go as planned and everyone in the class started laughing. 
  I think it did end up being a good refresher in the middle of the lesson to keep it more light hearted. 


## Beyond Perfunctory

We made a team kahoot for review on the topic since it can be difficult. 
![image](../assets/images/kahoot.png)
![image](../assets/images/kahoot2.png)


## Relevancy

Unit 7 **Arraylists** was probably the most significant thing I learned throughout the lessons. It was really the moment where I felt like I could actually code in Java. 

Prior to this I had just assumed that Java's only equivalent to Python's list was an array. I couldn't wrap my head around how so many of the programs I had written in Python would even work in Java without being able to add, access, and modify elements to an ever growing list. 

Participating in the lesson on Arraylists showed me that all of this was possible in Java and helped me gain the confidence to write my own programs in Java. 


## Proof of learning

```
public class Grid {
    private int length;
    private int width;
    private String name;
    private char[][] grid;

    public Grid(int length, int width, String name) {
        this.length = length;
        this.width = width;
        this.name = name;
        grid = new char[length][width];
    }

    public void setCharAt(int row, int col, char ch) {
        if (row >= 0 && row < length && col >= 0 && col < width) {
            grid[row][col] = ch;
        } else {
            System.out.println("Invalid position.");
        }
    }

    public void printGrid() {

        System.out.println(this.name);

        for (int i = 0; i < width; i++) {
            System.out.print(" _");
        }
        System.out.println();
        
        for (int i = 0; i < length; i++) {
            for (int j = 0; j < width; j++) {
                System.out.print("|" + grid[i][j]);
            }
            System.out.println("|");
        }
        System.out.println();
    }
}

public class Main {
    public static void main(String[] args) {
        Grid ticTacToe = new Grid(3, 3, "Tic Tac Toe");

        ticTacToe.setCharAt(0, 0, 'X');
        ticTacToe.setCharAt(1, 1, 'O');
        ticTacToe.setCharAt(2, 0, 'X');

        ticTacToe.printGrid();

        Grid chess = new Grid(8, 8, "Chess");

        chess.setCharAt(7, 0, 'R');
        chess.setCharAt(7, 1, 'K');
        chess.setCharAt(7, 2, 'B');
        chess.setCharAt(7, 3, 'Q');
        chess.setCharAt(7, 4, 'W');
        chess.setCharAt(7, 5, 'B');
        chess.setCharAt(7, 6, 'K');
        chess.setCharAt(7, 7, 'R');

        chess.setCharAt(6, 0, 'P');
        chess.setCharAt(6, 1, 'P');
        chess.setCharAt(6, 2, 'P');
        chess.setCharAt(6, 3, 'P');
        chess.setCharAt(6, 4, 'P');
        chess.setCharAt(6, 5, 'P');
        chess.setCharAt(6, 6, 'P');
        chess.setCharAt(6, 7, 'P');

        chess.setCharAt(0, 0, 'r');
        chess.setCharAt(0, 1, 'k');
        chess.setCharAt(0, 2, 'b');
        chess.setCharAt(0, 3, 'q');
        chess.setCharAt(0, 4, 'w');
        chess.setCharAt(0, 5, 'b');
        chess.setCharAt(0, 6, 'k');
        chess.setCharAt(0, 7, 'r');

        chess.setCharAt(1, 0, 'p');
        chess.setCharAt(1, 1, 'p');
        chess.setCharAt(1, 2, 'p');
        chess.setCharAt(1, 3, 'p');
        chess.setCharAt(1, 4, 'p');
        chess.setCharAt(1, 5, 'p');
        chess.setCharAt(1, 6, 'p');
        chess.setCharAt(1, 7, 'p');

        chess.printGrid();
    }
}
Main.main(null);

```

Output creates game boards of varying sizes

```
Tic Tac Toe
 _ _ _ 
|X| | |
| |O| |
|X| | |

Chess
 _ _ _ _ _ _ _ _ 
|r|k|b|q|w|b|k|r|
|p|p|p|p|p|p|p|p|
| | | | | | | | |
| | | | |P| | | |
|P|P|P|P| |P|P|P|
|R|K|B|Q|W|B|K|R|
```





<script src="https://utteranc.es/client.js"
        repo="SlothInTheHat/Nikhil_2025"
        issue-term="pathname"
        label="comments"
        theme="icy-dark"
        crossorigin="anonymous"
        async>
</script>