# Volitional CLI

Prompt the user for ideas, one on each line
Use Elixir's IO.gets recursively
Type "done" to stop giving ideas

Step 1: Get Ideas
Step 2: For each idea, write why
Step 3: Rank order

Part 1 would be
Prompt for each idea why pair, a number -> parsed into an integer
Then sort based on those integers
And then if there are ties, prompt to break ties
Perhaps only break ties for `1`s.

Tie break will be round robin comparisons between anything marked as `1`.

Edge case 1:
What if they don't put in an integer

Edge case 2:
Our tied rank 1 case from above

How do you test IO in Elixir?

Pipe operator in Elixir works like this:

```
def my_function(arg1, arg2) do
  ...
end

arg1 |> my_function(arg2)
# same as
my_function(arg1, arg2)
```


Protocols in Elixir:

```
defprotocol Enumerable do
  def reduce(enumerable, acc, reduce_function)
end 

```

Maps in Elixir:

look like `%{}`

Structs in Elixir look like `%Module{}`
