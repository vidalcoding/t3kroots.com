## What is a Function?

So as we begin to embark on our programming journey together, there is one concept that will come up time and time again. That concept is a function. 

Simply put, a function is a thing that takes in something and returns a result. To understand how pervasive this concept is lets look at a couple of different examples from a bunch of different areas.


### Functions in the Wild

![PayDay](https://media0.giphy.com/media/26xBMuHu0ZFngH7Ta/200.webp?cid=ecf05e47i6luesolzq1u0n3xsipi5mmonnvzi4580upcgwed&rid=200.webp&ct=g)
#### An ATM
A good first example that I believe most people are familiar with is an ATM. 
An ATM takes in a credit card and gives out money. The inputs and outputs are as follows:

    - Input: Credit Card

    - Output : Money


![PayDay](https://media1.giphy.com/media/l41lYNASsqlUOt9Xq/200.webp?cid=ecf05e470far77gx1fo8ltxiqu2ssq1ut5augnpc96cm8ld0&rid=200.webp&ct=g)
#### A Bicycle
Another example is a bicycle. There could be many functions made of this but lets start with a bicycle takes in pedals as input and gives out going forward as output.

    - Input: Pedaling

    - Output : Move Forward
![PayDay](https://media3.giphy.com/media/1wh06XT53tPGw/giphy.webp?cid=ecf05e47bhi7lvrjd4vospwcnldg7pntvbp53sqsvxqwycvh&rid=giphy.webp&ct=g)
#### A Video Game
A more computer related example is a video game. The video game takes in as input button smashes and joystick movements and gives as output picutres on a screen.

    - Input: Joystick Moves, Button Smashes

    - Output : Images
In this example notice that you can have a function that has multiple inputs.
On the flip side of that you can have a function that takes in no inputs at all. 

#### The Human Heart
This may be a little but contrived but think about your heart for a second. It will beat every second and it is virtuall impossibble for you to control its functionality(function). The heart is a fucntion that takes no input from you but gives you life.

    - Input : Nothing
    - Output : Life

### Python: A Language for Creating and Using Functions
So if you read through all that function mumbo jumbo your probably wondering where the code comes in? I will claim that programming is all about creating and using these functions to do things(computations).

So I can expalain to you what these functions are and you theoritcally know how to use some of them. Like riding a bike for instance, you would give the bike the input and start going forward. Now what if you wanted to tell a computer to use some function. That is where a *programming language* comes in handy.

There are many programming languages just like there are many spoken languages. In different spoken languages there are different kinds of vocab and grammar or syntax like *Hallo* and 你好 but they all just mean "hello".
The same is true for programming languages. There are many different syntax's for different languages but they all are essentially expressing the same idea.Functions!

So today we will start going over the syntax(vocab and grammar) for the programming language python. 

#### Python Syntax: Creating a Function

If you'd like to follow along with the below steps, go to [replit.com](https://replit.com) that will allow you to write python to a computer program that can intrepret the language. This program is commonly known as an intrepreter.

Anyway, to create a new function in python you need to first say your creating a new function. The special word for that in python is `def`.
I like to think of this as a shorthand for the word `define`.

Once you have written `def` the python intrepreter will expect you to give it a name next. That name will be the name of your function you are trying to create. So if we were to take an example from above, like bicycle for instance. If we wanted to let someone know who speaks python that we are creating or defining a new function called bicycle we'd write.

```python 
def bicycle
```

but this isnt complete yet and if this is all we wrote the intrepeter would say they didnt understand and give us an error called a *Syntax Error*. In order for the intrepreter to understand us we have to tell it what the functions inputs are and what the functions outputs are.

In order to tell python what the bicylce function takes as input we need to put our inputs seperated by commas inside of parenthisis next to our function name.

So in this case 

```python
def bicycle(pedals)
```
Once we give our function some inputs we need to finish the definition of the function with our outputs. So next to the parentithsis we need to add a semi-colon ':'. This tells the python intrepreter we are now talking about outputs/actions.
```python
def bicycle(pedals):
```
Now Python is a weird language where indentation matters like your writing a letter. So on the next line you must indent then you can tell the intrepreter what this functions returns by writing the special keyword *return* and then after whatever it returns.
```python
def bicycle(pedals):
    return "Move Forward"
```

#### Python Syntax: Using a Function

Now we know how to create a function and we have typed all this in to our intrepreter that speaks python on [replit](https://replit.com). So our intrepreter knows what to do if we asked them to intrepret usage of our function. 

What do I mean by usage of our function? I mean just giving our function some input that it expects. So in the example for our bicycle function we need to give it "pedals" as an input. How do we do that?

Well in python when we want to use a function we need to call it by its name.
In other words we need to write to the intrepreter the name of the function and the inputs we want to use with it. 

So we know what the name is of our function: bicycle.

So we write 
```python 
bicycle
```
Then next to bicyle we write parenthisis with our inputs to the function seperated by commas.
```python 
bicycle(3)
```
What this means to the intrepreter is give us the result of using our function bicycle on the input 3.

#### Things to Do Now

Now that we have talked about what functions are and how to create and use them and python. I encourage you to try creating some functions in a intrepreter session on replit. Your functions wont be very useful right now but that will change next lesson when I go over values and revisit functions again.
