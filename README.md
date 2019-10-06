# INTRODUCTION
**OneLiner** is an interpreter written in Haskell designed to performs computations on streams -
potentially unbounded sequence of integers. This has had an impact on several design choices
we have made during development. The syntax was inspired by the *hard drive sectors alignment*.
The interpreter was developed using:
- **Haskell**
- **Alex** - lexer, which reads the input and breaks it into tokens
- **Happy** - parser, which performs a syntax analysis to check whether the input conforms the grammar rules
It follows a **Functional Programming** style and voids mutable data. **Lazy Evaluation** delays
function evaluation until the time it is needed and it was a design choice that was considered as a
necessity, given the input being unbounded.
# OVERVIEW
OneLiner was designed to keep the grammar of the language simple and with the intention to
stimulate creative thought. It operates on the input row by row, which we call rounds, and the
programmer only writes the functions they want to be applied in each step of the execution. This
encourages developers to focus on what output they would like to get by manipulating the input
with mathematical functions instead of thinking about data, variables and user-defined functions.
That’s correct, in this language one cannot declare their own data. Also, note that the size of the
output (in terms of rows) will be equal to the size of the input.
You are probably already wondering how you would be able to keep track of previous rows if data
cannot be stored in a variable, for instance. Do not stress out just yet, you can do this with the
help of accumulators.
The language supports only integers and several operations to perform on them - addition,
multiplication, division, power, and modulo. What about subtraction? The language supports
negation but not subtraction. Who needs subtraction anyways? The rest of operators provide us
with enough expressivity in order to omit and forget about it. For instance, one can subtract
numbers using addition and negation: `3 + (-1) = 3 – 1 = 2` (brackets can be omitted). Furthermore,
the language does not use the equals sign `=` to assign values to data. As it just evaluates
functions and applies them on the input, if the developer provides only a number then it is assign
to it.
# GETTING STARTED
Programs in OneLiner are written in files with .spl extension and expect input from a text file
which follows a particular syntax explained below. In a Linux terminal they are run as shown
bellow:
```bash
./myinterpreter sample.spl < input.txt
```
Recall that the input is a potentially unbounded sequence of integers. In general the input file
takes the format shown below.

|      Input Format     |    Input    |           Program          |   Output   |
| --------------------- |:-----------:|:--------------------------:|:----------:|
|a11 a21 a31 a41 ... an1<br>a12 a22 a32 a42 … an2 <br>.<br>.<br>.<br>a1k a2k a3k a4k ... ank|-5<br>0<br>3<br>7<br>10 |[ &#124; $1+2 &#124; $1\*3 ] |-3 &nbsp;-15<br>2 &nbsp;&nbsp;&nbsp;0<br>5 &nbsp;&nbsp;&nbsp;9<br>9 &nbsp;&nbsp;&nbsp;21<br>12 &nbsp;&nbsp;&nbsp;30|

where every line is terminated with the new line character EOL and the file ends with EOF. The a’s
are arbitrary (positive or negative) 32 bit integers.
Programs are contained in square brackets `[...|…]` and consist of blocks. The very first block,
which in the example above is empty, is reserved (remember the inspiration from Hard Drive
sectors) for the accumulators (if any). Blocks are separated using a pipe `|` and the number of
pipes corresponds to the number of columns in the output (as in our case – 2). We can access
data (input and accumulators) with the dollar sign `$` . In this example, with `$1` we access the
first column of the input and define what function would be applied on during each round to
produce the corresponding output in the first and the second column.
In order to keep our first program simple, in the example above it outputs 2 columns. On the first
column, we apply addition and on the second – multiplication on each row of the input. One can
apply more complex mathematical functions as well.

# CONDITIONALS
Interestingly, OneLiner does provide support for conditionals – the ternary operator. When
working with streams one might want to execute different functions depending on the input. For
instance, one might want to multiply by 2 if the input is even & add 1 if - odd &:
```
[ | $1 % 2 == 0 ? $1*2 : $1+1 ]
```
Note that the very first block is empty in this example as well because do not use any
accumulators. Hang on! We are getting there.

# ACCUMULATORS
OneLiner may not allow variable declarations but it does come with accumulators support,
which allows the developer to reuse the input. Accumulators are useful especially when we want
to temporary store the value from previous calculations and perform operations depending on it.
```
(0)[ $0+$1 | $0+$1 ]
```
In this example, we initialize an accumulator with `(0)` , which is called an initializer. After this,
define what function to be applied to it on each ‘round’ (row of input) - `$0 + $1` - add the value of
the input at this round to the accumulator. As we have initialized an accumulator we can, of
course, reuse its value from the previous rounds (in the first round we use its initial value – 0 in
this case) – which we access with `$0`.
Just as we are allowed to have multiple columns of input, which we access with `$n` , where n is a
positive, non-zero integer, we are allowed to initialize multiple accumulators, which we access
with `$m` , where `m ∈ (-∞ , 0] ∞ , 0] (- , 0]`. When we want to intialize multiple accumulators we separate them
with a comma `,` in both the initializer and in the program block. We initalize and access them
from left to righ – the leftmost accumulator is `$0` , then `$-1` , `$-2`, … and so on. Any accumulator
which is not written in the program accumulator block is lost. In the example below the third
initialized accumulator (with value 3) - `$-2` is lost because only `$0` and `$-1` are overwritten.
```
(0,0,3)[ $-1, $-1 + $0 + $1 | $-1 + $0 + $1 ]
```
The following program takes an input and adds up all the numbers up to that round with
coefficients which follow the fibonacci series.
Remember, no equals sign `=` is needed to assign values.

|    Program Breakdown    |    Input    |    Output    |
| ----------------------- |:-----------:|:------------:|
|<ul><li>`(0,0)` ⇒ Initialize 2 accumulators both with a value of 0.</li><li>On each round:</li><ul><li>To `$0` accumulator apply assignment ⇒ `$0 = $-1`</li><li>To `$-1` accumulator apply the function ⇒ `$-1 = $-1 + $0 + $1`</li><ul><li>this adds to the `$-1` acc. the value of `$0` acc. from the previous round plus the value of the input in the current round</li><ul><li>On the first column in the output perform ⇒ `$-1 + $0 + $1`</li><ul><li>this outputs the sum of the values of the accumulators from the previous round and the current value of the input</li></ul></ul></ul>|1<br>2<br>3<br>4<br>5|1<br>3<br>7<br>14<br>26|

# PREFIXES
The idea of having a prefix before the actual output came in the early stage of the development
of the language which, later we realized, does not provide to the orthogonality of the language.
They take the form below – a sequence of integers but as it is there – it should be mentioned:
```
0..3(0,0)[ $-1, $-1 + $0 + $1 | $-1 + $0 + $1 ]
```

# ADDITIONAL FEATURES
- Comments `--` (double dash) – a one-line comment which will be ignored by the parser
- Error messages – the language does output sensible error message for some mistakes
    - “index too large” - trying to access undefined accumulator or column number
- Syntactic sugar:
    - `=` (assign operator) – completely ommited to keep the programs coincise
    - ternary-operator – conditional operator instead of if-else statements
    - structure programs in columns to illustrate the idea of streams and keep code neat instead of having scattered code

# Solutions to sample problems
## Problem 1 :smile:
```
0..0[|$1]
``` 
## Problem 2 :smiley:
```
[|$1|$1]
``` 
## Problem 3 :relaxed:
```
[|$1+3*$2]
``` 
## Problem 4 :grin:
```
(0)[$0+$1|$0+$1]
``` 
## Problem 5 :sweat_smile:
```
(0,-5)[$0+$1,$1|$0+$1|$-1]
``` 
## Problem 6 :cold_sweat:
```
(0,0)[ $-1, $-1 + $0 + $1 | $-1 + $0 + $1 ]
``` 
## Problem 7 :smirk:
```
[|$1+$2*-1|$1]
``` 
## Problem 8 :smirk:
```
(0)[$0+1|$0+$1]
``` 
## Problem 9 :scream:
```
(0,0,0,0)[$0+$1,$-1+$0,$-2+1,$-2==0 ? $1 : $-3+$1|$-2 == 0 ? $0+$-1+$1 : $0+$-1+$-3+$1]
``` 
## Problem 10 :dizzy_face:
```
(0,0,0)[$0+1, $0 > 1 ? $1+$-2 : $1, $-1|$0 > 1 ? $1+$-2 : $1|$1|$0|$-1|$-2]
``` 
