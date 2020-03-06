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

## How to Run

Add this line to your application's Gemfile:

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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/toy_robot. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
