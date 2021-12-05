defmodule Day05 do
  @moduledoc """
  We need to draw a map of thermal vents for calcluating the savest route.

  ## Part 1

  This one is fairly easy on the Part 1. We simply need to "draw" lines 
  and get the number of intersections. So all I need is to interpolates between 
  the two sides of a line and do some reduce/filter. I guess Part2 will be 
  pathfinding or adding oblique lines, so I will need to find a a* package or simply
  modyfing my interpolation implementation.

  ## Part 2  
  
  Finally part 2 ask us to add oblique but only full diagonales, so we don't 
  need to modify anythinhg in our implementation, juste removing a filter.

  # Documentation generation

  Like day 3, let's use quick  exercices for learning new stuffs. I read Elixir
  treat documentation as a first-class citizen, so let's try to use it for writing
  the devblog.
  """

  @doc false
  def inputs do
    AdventOfCode.inputs(5)
      |> Enum.map(fn v -> to_coords(v) end)
  end

  def to_coords(input) do 
    [x1, y1, x2, y2] = String.split(input, [",", " -> "]) 
      |> Enum.map(fn n -> Integer.parse(n) |> elem(0) end)

    { x1, y1, x2, y2 }
  end

  def draw_line(map, { x1, y1, x2, y2 }) do
    deltaX = x2 - x1
    deltaY = y2 - y1
    steps = if abs(deltaX) > abs(deltaY) do
      abs(deltaX)
    else
      abs(deltaY)
    end

    # TODO check if Part2 need ceil or floor
    points = Enum.map(0..steps, fn n -> { trunc(x1 + (n * deltaX / steps)), trunc(y1 + (n * deltaY / steps)) } end)
    Enum.reduce(points, map, fn point, accmap -> draw_point(accmap, point)  end)
  end
  
  def draw_point(map, { x, y }) do
    Map.update(map, { x, y }, 1, fn n -> n + 1 end)
  end

  def calculate_solution(map) do
    map
      |> Map.values 
      |> Enum.filter(fn n -> n >= 2 end)
      |> length
  end

end
