defmodule Part1 do
  import Day06

  def solve do
    Enum.reduce(1..80, inputs(), fn _day, pool -> pool |> grow_fish end)
    |> calculate_solution()
    |> AdventOfCode.display_solution(1)
  end
end

defmodule Part2 do
  import Day06

  def solve do
    Enum.reduce(1..256, inputs(), fn _day, pool -> pool |> grow_fish end)
    |> calculate_solution()
    |> AdventOfCode.display_solution(2)
  end
end

Part1.solve()
Part2.solve()
