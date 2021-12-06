defmodule Day06 do
  @moduledoc """
  Does lanternfish spawn exponentially quickly ? I don't know but I guess il will be
  our job to find out !

  ## "Exponentially" generally mean "bad news"

  This day assignment is... fishy. Solving this with something like 
  String.split -> Integer.parse -> map(0 ? 6 : n - 1) -> sprouting_fish is the 
  obvious solution, but it will fill way to much memory.

  I will go for a solution with a list (edit: a tuple. We know the final size, 
  it's a tuple.), where I track the number of fish of each age.

  ## That's all folks !

  My solution work for 80 days, and as expected part 2 ask us to push to 256 days 
  for provoking a OOM. With my implementation I don't have this kind of problems, it's
  an easy win today.
  """

  import Enum

  @doc false
  def inputs do
    pool = { 0, 0, 0, 0, 0, 0, 0, 0, 0 }
    AdventOfCode.inputs(6) 
      |> at(0)
      |> String.split(",")
      |> map(fn n -> Integer.parse(n) |> elem(0) end)
      |> reduce(pool, fn fish, pool ->
          put_elem(pool, fish, elem(pool, fish) + 1)
        end)
  end

  def grow_fish({ term, m1, m2, m3, m4, m5, m6, m7, m8 }) do
    { m1, m2, m3, m4, m5, m6, m7 + term, m8, term }
  end

  @doc false
  def calculate_solution(pool), do: pool |> Tuple.sum

end
