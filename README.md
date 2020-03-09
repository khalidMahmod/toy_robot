# ToyRobot

Description
-----------

- The application is a simulation of a toy robot moving on a square tabletop,
  of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be
  prevented from falling to destruction. Any movement that would result in the
  robot falling from the table must be prevented, however further valid
  movement commands must still be allowed.
- I choose a behavioral design pattern. This simulation is a based on Strategy Design Pattern in a simplified manner.

## How to Run

Run following command that will prompt for user input:

```ruby
bin/toy_robot.rb
```

## Usage

The application can read in commands of the following (textual) form:

- PLACE X,Y,F
- MOVE
- LEFT
- RIGHT
- REPORT

## Run Test
```ruby
rake test
```

Example Input and Output
------------------------

### Example a

    PLACE 0,0,NORTH
    MOVE
    REPORT

Expected output:

    0,1,NORTH

### Example b

    PLACE 0,0,NORTH
    LEFT
    REPORT

Expected output:

    0,0,WEST

### Example c

    PLACE 1,2,EAST
    MOVE
    MOVE
    LEFT
    MOVE
    REPORT

Expected output

    3,3,NORTH

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/toy_robot. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
