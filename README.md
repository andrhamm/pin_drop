# PinDrop

Simple tool to estimate how strong a pin code is when subjected to a series of basic known patterns of human behavior. Out of the 10,0000 possible combinations of a 4 digit pin code, many can be guessed with ease. Based on patterns from http://www.datagenetics.com/blog/september32012/

## Installation

Add this line to your application's Gemfile:

    gem 'pin_drop'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pin_drop

## Usage

Check a pin to seem how many guesses it might take to guess based on common patterns.

    PinDrop::Cracker.crack_pin 1234 #=> 1

Get an array of all pin codes sorted by how common they are (most common/weak first).

    PinDrop::Cracker.guesses #=> [1234,1111,0000,1212,7777,1004 ...]