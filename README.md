# Oystercard Challenge (Redo)

![Screenshot](https://raw.githubusercontent.com/Thatguy560/Oystercard-Redo/master/Assets/Screenshot%202020-07-06%20at%2016.26.39.png)

**Requirements**

Taken from https://github.com/makersacademy/course/tree/master/oystercard

This is a re-do of the second weeks challenge at Makers Academy

This project emulates London's Oystercard. It implements the following user stories:

# User Stories

```
In order to use public transport
As a customer
I want money on my card
```
```
In order to keep using public transport
As a customer
I want to add money to my card 
```
```
In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card 
```
```
In order to pay for my journey
As a customer
I need my fare deducted from my card 
```
```
In order to get through the barriers.
As a customer
I need to touch in and out. 
```
```
In order to pay for my journey
As a customer
I need to have the minimum amount (£1) for a single journey. 
```
```
In order to pay for my journey
As a customer
When my journey is complete, I need the correct amount deducted from my card 
```
```
In order to pay for my journey
As a customer
I need to know where I've travelled from 
```
```
In order to know where I have been
As a customer
I want to see all my previous trips 
```
```
In order to know how far I have travelled
As a customer
I want to know what zone a station is in 
```
```
In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out 
```
```
In order to be charged the correct amount
As a customer
I need to have the correct fare calculated 
```

# Running the program in irb 

$ git clone https://github.com/Thatguy560/Oystercard-Redo.git

$ cd Oystercard-Redo

$ run bundle in Commandline (To install all the dependencies)

$ Type irb in Commandline

$ require './Lib/oystercard.rb'

$ Instantiate a new instance of the Oystercard class with oystercard = Oystercard.new or you can create a new Oystercard with a balance of your choosing by typing in - oystercard = Oystercard.new(20)

$ To top up your Oystercard type in - oystercard.top_up(10)

$ To touch in at a station of your choice type in - oystercard.touch_in("Finsbury Park") # Whatever station you choose

$ To touch out at a station of your choice type in - oystercard.touch_out("Old Street") # Whatever station you choose

$ To find out the balance of your Oystercard at any point type in - oystercard.check_balance

$ To see all of your previous journeys or incompleted journeys type in - oystercard.journey_history

# Example Usage 

```ruby

oystercard = Oystercard.new(10)

oystercard.top_up(20)

oystercard.check_balance

oystercard.touch_in("Finsbury Park")

oystercard.touch_out("Old Street")

oystercard.touch_in("Enfield Town")

oystercard.touch_out("London Liverpool Street")

oystercard.journey_history

[<Journey:0x00007f83739d7b20 @entry_station="Finsbury Park", @exit_station="Old Street">, <Journey:0x00007f83748a2538 @entry_station="Enfield Town", @exit_station="London Liverpool Street">]

```

# Check Test Coverage 

```ruby
Type 'bundle install' into terminal 

Type 'rspec' into terminal 

Test Coverage 100.00% -- 125/125 lines in 7 files
```

# Testing Frameworks Used

## Rubocop, Simplecov, rspec
