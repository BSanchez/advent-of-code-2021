# Third day

Our submarine does weird nodes, and we need to extract 2 numbers out of it using
bitwise operations.

# Bitwise operations

Well, Elixir has a Bitwise module and I am reaaaaly versed in bitwise operations,
so, we will use bitwise operations.

This exercice is the easiest so far, and I had a working solution inside iex in
less than 10 minutes. I could refactor this crap, but I guess my time will be
better invested in another aspect : structuring and reusing parts of code.

# Importing modules

Elixir have three methods used for managing reuse: require, and import. And not
one of these will help us "require" a file, because it's not needed. Any module
in the directory are automatically loaded and usable, on the sole condition the
file was compiled beforehand.

# Mix

[Mix](https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html#our-first-project) 
is a tool for managing compilations, dependencies, etc of an elixir application.
I'ts the bundler or the npm of Elixir. Using it is pretty easy and I can shape
an application pretty quickly.

It have a built-in documentation syntaxe and I will need to investigate this
further, I would like to use it for compiling this devblog.
