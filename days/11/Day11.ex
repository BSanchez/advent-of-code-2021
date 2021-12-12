defmodule Day11 do
  @moduledoc """
  Today assignment is about making a map of octopus. Again, a great exercice for
  recursion.

  ## Organising functions in modules.

  My current organisation don't make a really good use of modules. Putting all needed functions in a module was ok for iex debugging (it only lack hot reloading, currently I need to use `r Day10` each time for example), but I can do better.

  Yesterday I needed median and I used it directly from Day07, but it clearly felt wrong.
  I could have added median and average directly in Enum (could I ? Is monkey patching a thing in
  elixir ? I mean, modules are complied, right ? I need to investigate this.) or made
  a module for this.

  Today, I will not make the same mistake again, and directly make a Map2D from the
  day with the lava.

  ## I can see some of my flaws
  
  My elixir code is crippled with problems I will need to address. I will list here
  what I need to keep in my head for tomorrow.

  * I use tuple when a map would be better for readability
  * I don't have a consistent way to name my functions
  * I use waay too much piping, even when it's not semantically correct
  * I don't use guards enough
  
  """
  
  @doc false
  def inputs do
    AdventOfCode.inputs(11, format: :raw)
      |> Map2D.parse(&String.to_integer/1)
  end

  def flash(coords, squidmap) do
    squid_energy = Map2D.get_point(squidmap, coords)

    if squid_energy == -1 do
      squidmap
    else
      squidmap = Map2D.update_point(squidmap, coords, fn n -> -1 end)

      coords
        |> Map2D.get_neighbors_coords(squidmap, points: 8)
        |> Enum.reduce(squidmap, fn coords, squidmap ->
          if Map2D.get_point(squidmap, coords) == -1 do
            squidmap
          else
            gain_energy(coords, squidmap)
          end
        end)
    end
  end

  def gain_energy(coords, squidmap) do
    squid_energy = Map2D.get_point(squidmap, coords)
    case squid_energy do
      -1 -> squidmap
      x when x >= 9 -> flash(coords, squidmap)
      _ -> Map2D.update_point(squidmap, coords, &( &1 + 1 ))
    end
  end

  def day_pass(squidmap) do
    { { width, height }, _values } = squidmap

    squidmap = 0..(width * height - 1) 
      |> Enum.reduce(squidmap, fn index, squidmap ->
        x = index |> Integer.mod(width)
        y = index / width |> trunc
        gain_energy({ x, y }, squidmap)
      end)

    { values, flashes } = squidmap |> elem(1)
      |> Enum.map_reduce(0, &(if &1 == -1, do: { 0, &2 + 1 }, else: { &1, &2 }))

    {
      flashes,
      squidmap |> put_elem(1, values),
    }
  end
end
