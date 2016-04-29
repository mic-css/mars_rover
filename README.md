# Mars Rover

Welcome to the NASA Mars Rover Command Center! From here you can deploy new rovers onto specific areas of the Mars surface and direct their exploration.

## Instructions

#### Run

To run the program, run `ruby bin/run.rb`. The program runs in the command line and will prompt you for the following input as strings:
1. The upper-right hand coordinates of the area to be explored
2. The coordinates and direction to deploy a new rover
3. Directions for the rover, either `M`, `R` or `L` to move forward, rotate 90 degrees right, or rotate 90 degrees left, respectively.

You can then repeat steps 2 and 3 to deploy new rovers.
You can exit the program at any time by typing `exit`.

Example:
```
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

To run the sample data, run `bin/sample_data.rb`. This will run the program with the supplied sample data:

```
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
