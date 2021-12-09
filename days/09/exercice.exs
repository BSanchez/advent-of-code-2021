defmodule Part1 do
  import Day09

  def solve do
    map = inputs()
    Enum.reduce(0..9999, 0, 
      fn coords, sum -> 
        x = coords |> Integer.mod(100)
        y = coords / 100 |> trunc
        if is_lower_point?({x, y}, map) do
          sum + get_altitude({x,y}, map) + 1
        else
          sum 
          end
      end) 
      |> AdventOfCode.display_solution(1)
  end
end

defmodule Part2 do
  import Day09

  def solve do
    map = Day09.inputs()
    lower_points = Day09.inputs() |> Day09.get_lower_points

    1..(lower_points |> length)
      |> Enum.reduce(map, fn current, acc -> 
        fill_bassin(acc, lower_points |> Enum.at(current - 1), current)
      end)
      |> elem(1)
      |> Enum.filter(fn n -> n != nil end)
      |> Enum.frequencies
      |> Map.values
      |> Enum.sort
      |> Enum.reverse
      |> Enum.slice(0..2)
      |> Enum.reduce(1, &(&1 * &2))
      |> AdventOfCode.display_solution(2)
  end
end

Part1.solve()
Part2.solve()
