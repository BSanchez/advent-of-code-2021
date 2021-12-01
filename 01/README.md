# First day

Let's go for our first assignment ! We need to help this pool elves by reading
an input file, parsing values insides it, and looping through while keeping
trace of how many times n+1 is greater than n.

## Preparing input

Reading a file is fairly easy : `File.read!("input")` does wonderfully the job.

My first try was with File.read (note the absence of ! at the end of read), but
I received a tuple. Maybe it's something rust-like, I don't know at this point
and I don't need to know for the first exercice, so whatever.

Now I have my file, I need to cut and cast each line to an int. In search of how
to do it, I discovered Elixir use pipes, and I really love pipes ! Good point
for you Elixir. This time again, Integer.parse gives me a tuple. I will need to
read the API for clearing this point.

```elixir
File.read!("input") 
  |> String.split
  |> Enum.map(fn n -> {v, _} = Integer.parse(n); v end)
```

## Looping without loops

You want loops ? Well, in elixir there is none. NO. LOOPS. It is not the first
time I find myself without loops (TI-BASIC and Eve don't have any) but I still
have the strange impression to be Samus, ripped of all my goodies during my
first room exploration.

Well, I lost my looping powers, but y still have ~~my Power beam~~recursion !
I read the Enumerable.reduce implementation and solved the problem swiftly.

Part2 is roughly the same and was done in seconds.

## First day : conclusion

Elixir gives us pretty interesting things, like multi-signatures functions,
guards, and list/tuple destructuring (which I tend to overuse in Typescript).

It's my first time seeing pipes outside bash, and I must say it's a instant
love. This single thing can easily remove intermediary values and
this(kind(of(stupid("things")))).

We don't have loops, but writing recursive functions is as easy as writing
loops, and it seem easier to debug.
