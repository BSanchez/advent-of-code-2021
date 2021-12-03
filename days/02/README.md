# Second day

Yesterday we have read the scanner, now we need to nearn how to pilote the
submarine. For that, we will need to parse each line as a couple of values, and
reducing this new array. Easy enough I guess.

## Elixir scopes

I don't know how I've not stumbled on this topic yesterday, but scopes in elixir
are strict. I mean, REALLY strict : It's not possible to update a variable inside
a if.

Without this problem I could have used a case, but I need to use 3 ifs
instead.

```elixir
  hPos = if command_type == "forward", do: hPos + value , else: hPos
  depth = if command_type == "down"  , do: depth + value, else: depth
  depth = if command_type == "up"    , do: depth - value, else: depth
```

Outside of this problem of scopes nothing much to see here, and the second part
is globally the same.
