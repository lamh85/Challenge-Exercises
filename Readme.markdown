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

# Anagram (see anagram3.rb)

An anagram number is a number formed by rearranging the digits of another. For instance, 2134 is an anagram of 1234. Write a class called AnagramFinder that is initialized with a starting number and has a method called next_highest that returns the next highest number that is an anagram of the starting number. If a next highest anagram does not exist, return the starting number.

> AnagramFinder.new(123).next_highest => 132

> AnagramFinder.new(321).next_highest => 321 # no higher number exists

# Convert Number to String

Create a function that converts a number written in digits into words.

EG: "55" -> "fifty-five"

# Find the missing number

Imagine that you must produce an array of consecutive numbers that range from 1 to the length of the array. But your array is missing a number. Problem: Create a function that finds the missing number.

For example:

> An array of [1,2,4] is missing the number 3

> An array of [1,2,3,4,5,7] is missing the number 6

# Compound Words

Given two dictionaries -- one containing potentially compound words, and one containing words that are not compound -- check if a potentially compound word contains smaller words.

# CSV Analyzer

A Ruby app that creates and analyze data from a CSV file.

# Poker Card Encoder / Decoder

You are going to write a simple function - decoder/encoder for poker cards (any card game in fact).
Your task is to encode array of human readable symbols to array of codes or decode it doing this process with reversed way.

```
['Ac', 'Ks', '5h', 'Td', '3c'] -> [0, 2 ,22, 30, 51] //encoding
[0, 51, 30, 22, 2] -> ['Ac', '3c', 'Td', '5h', 'Ks'] //decoding
```

Remember that the returned array must be sorted from lowest to highest code (or its symbol value).

### Card suits:

```
name    |  symbol   |  precedence
---------------------------------
club          c            0
diamond       d            1
heart         h            2
spade         s            3
```

### 52-card deck:

```

  c    |     d     |    h     |    s
---------------------------------------
 0: A      13: A      26: A      39: A
 1: 2      14: 2      27: 2      40: 2
 2: 3      15: 3      28: 3      41: 3
 3: 4      16: 4      29: 4      42: 4
 4: 5      17: 5      30: 5      43: 5
 5: 6      18: 6      31: 6      44: 6
 6: 7      19: 7      32: 7      45: 7
 7: 8      20: 8      33: 8      46: 8
 8: 9      21: 9      34: 9      47: 9
 9: T      22: T      35: T      48: T
10: J      23: J      36: J      49: J
11: Q      24: Q      37: Q      50: Q
12: K      25: K      38: K      51: K
```

### Requirements

input: array of strings (symbols)/integers (codes) you must encode/decode
output: array of integers (codes)/strings (symbols) sorted by code values ASC
* if input is not defined or is not and array return null, if is empty array return empty array

# Sorted List

The task here is to create a class that maintains a sorted list of numbers in ascending order.

The class will have two methods:

`add(x)` will add `x` to the list

`get(i)` will get the `i`th value in the list

You should also provide a `length` property that gives the length of the list.

Efficiency matters!

http://www.codewars.com/kata/53138a5dbb244a40680000a3

# Formatting a number as a price

Your objective is to add formatting to a plain number to display it as price.

The function should return a string like this:

```
var price = numberToPrice(13253.5123);
console.log(price); // 13,253.51
```

Numbers should use the standard comma for every 3 numbers and dot to separate the cents, cents need to be truncated to 2 decimals, in the case that the decimal part of the number is 1 character long or none you should add 0's so that the result will always have 2 decimal characters, the function will also evaluate negative numbers.

function should return a string `'NaN'` if the input is not a valid number

http://www.codewars.com/kata/5318f00b31b30925fd0001f8

# Arrh, grabscrab! Skip Next Module (under construction)

Pirates have notorious difficulty with enunciating. They tend to blur all the letters together and scream at people.

At long last, we need a way to unscramble what these pirates are saying.

Write a function that will accept a jumble of letters as well as a dictionary, and output a list of words that the pirate might have meant.

For example:

grabscrab "ortsp", ["sport", "parrot", "ports", "matey"]
Should return ["sport", "ports"].

Good luck!

The kata tests are the same as the sample fixtures.

Return an empty array if there are no matches.

http://www.codewars.com/kata/52b305bec65ea40fe90007a7

# Maze (under construction)

Given a 2-dimensional array that represents a rectangular grid:
```
[1, 0 ,1],
[1, 1 ,1],
[0, 0 ,1]
```

Determine the path from top left to top right.

Path can only go right or down.