# What is this?

These files are my attempts at completing complex coding problems. Some are school assignments, and some are from random encounters (EG: job interviews).

Here are the exercises:

# Looping

Given a number n. 

Do the following:

1. Generate an array that goes from 1 to the number n (for instance if n=3 array would be [1, 2, 3]
2. keep looping through the array eliminating every second number until there is one element left and return that element. If you are at the end of the array loop around the same way.

For instance. If n = 5 then you get an array [1,2,3,4,5]
First round you would remove the 2 and 4 ending up with: 1, 3, 5 and because there is no element "6" you loop around and remove the 1 and then the 5. You are then left with number 3.

# Anagram (work in progress)

An anagram number is a number formed by rearranging the digits of another. For instance, 2134 is an anagram of 1234. Write a class called AnagramFinder that is initialized with a starting number and has a method called next_highest that returns the next highest number that is an anagram of the starting number. If a next highest anagram does not exist, return the starting number.

> AnagramFinder.new(123).next_highest => 132

> AnagramFinder.new(321).next_highest => 321 # no higher number exists

# Convert Number to String

Create a function that converts a number written in digits into words.

EG: "55" -> "fifty-five"