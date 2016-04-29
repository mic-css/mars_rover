# Mars Rover

Welcome to the NASA Mars Rover Command Center! From here you can deploy new rovers onto specific areas of the Mars surface and direct their exploration.

## Instructions

#### Build

Please run `bundle` to install or update any dependencies.

#### Run

To run the program, run `ruby bin/run.rb`. The program runs in the command line and will prompt you for the following input as strings:

1. The upper-right hand coordinates of the area to be explored
2. The coordinates and direction to deploy a new rover
3. Directions for the rover, either `M`, `R` or `L` to move forward, rotate 90 degrees right, or rotate 90 degrees left, respectively.

You can then repeat steps 2 and 3 to deploy new rovers.
You can exit the program at any time by typing `exit`.

Example:
```sh
$ ruby bin/run.rb

# Welcome to the NASA Mars Rover command center.
# Type "exit" at any time to quit the program.
# Enter terrain boundary:

$ 5 5

# Enter new rover coordinates:

$ 3 3 N

# Enter rover directions:

$ LMMLMM

# Rover position: 1 1 S
```

#### Sample data

To run the sample data, run `ruby bin/sample_data.rb`. This will run the program with the supplied sample data:

```sh
$ ruby bin/sample_data.rb

# Input:
# 5 5
# 1 2 N
# LMLMLMLMM
# 3 3 E
# MMRMMRMRRM

# Output:
# 1 3 N
# 5 1 E
```

#### Test

To run the tests, run `rspec`. This will output all the test descriptions in an easily readable format.

The tests use **SimpleCov** to check test coverage. The final line of the test output shows the coverage level of the tests. Once you have run the tests once, you can also open `coverage/index.html` in your browser to inspect the code coverage in more detail.

## Technologies

* Ruby
* RSpec
* SimpleCov
* Git

## Objectives

The objective of this exercise was to test-drive the development of a simple, functional MVP, then refactor it to adhere to good OOP practices.

The program was developed using the red-green-refactor method, and commits were made on complete passing tests. Extensive refactoring was carried out once a functional MVP at 100% code coverage was achieved.

You can check out commit `f3bb97e` to see the MVP prior to refactoring.

## Challenges

#### Flying solo
I found it very difficult not being able to discuss alternative approaches and issues with other people. I found myself asking a number of people to be my "rubber ducks" so I could verbalise my thoughts!

#### Too much upfront design
I spent too long thinking through design choices and found this extremely counter-productive and stressful. I knew I wanted to avoid the significant amount of conditionals a first draft of the Rover class would involve, but forgot to benefits of discovering design through TDD -- once I began writing my MVP and focusing on making it work, it made refactoring much simpler.

#### Handling user input
I was unsure how to handle user input (e.g. injecting an InputParser or FileReader class into the Rover, using a script with lots of logic). In part this was simply down to inexperience handling user input through the command line in an OO manner, plus it added a second moment of "too much upfront design". Ultimately I settled on having a class to handle user input (this is discussed further under **Improvements**) and a script to handle presentation.

## Design

The initial MVP consisted of only three classes: a `Rover` class, a `Terrain` class and a `CommandCenter` class tasked with parsing user input and program logic flow.

This introduced several design issues: primarily, the Rover class had an unwieldy case statement to determine how to change coordinates based on direction, as well as incorporating rotation logic by cycling through an array.

#### State design pattern

Some research led me to the State design pattern, which allows the encapsulation of behaviour that changes depending on state. In this case, the Rover turning left or right (behaviour ) depends on it's current direction (state).

This design pattern also lent itself well further down the line for encompassing the logic of how to change the coordinates when moving the rover (behaviour) depending on the direction (state).

A Direction class was extracted that acts as a wrapper object holding a reference to a North, East, South or West object, each of which has unique implementations of #left, #right and #forward. The Rover class interacts with it's Direction object when moving, which in turn delegates to the current specific direction.

In more statically-typed languages, these direction objects would adhere to an explicit interface, however, in Ruby these are an example of duck-typing.

#### Further class extraction

To further this design pattern, a Point class was extracted to encapsulate coordinates and error handling for boundaries. This allows the logic of whether to increase or decrease the x or y coordinate to also be pushed down to the individual implementations of a direction.

A Terrain class was created in the first iteration of the program too: it does not currently have any behaviour and simply wraps around a Point object that acts as it's boundary. Nonetheless, it made sense to extract it into it's own class since multiple Rovers and coordinates would interact with the same Terrain object, and it simplifies future features, such as obstacles.

## Improvements
The following are some of several improvements I would like to make to this program:
* The CommandCenter class has too many responsibilities due to limited time. It should be possible to extract input parser and factory classes.
* Error handling! The program only assumes the "happy path" and does not feature test the only error handling logic present (out-of-bounds movements). For example, users can currently deploy rovers outside the defined grid and incorrect commands will crash the program.
* Explore the Command design pattern to encapsulate individual command logic.
* Review instantiation of Direction classes, perhaps through a factory class.
* New features: obstacles (including deployed rovers), improved interface, multiple commands to any deployed rover, etc.
