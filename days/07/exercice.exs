defmodule Part1 do
  import Day07

  def solve do
    crabs = inputs()
    crabs
      |> calculate_linear_fuel_consumption(crabs |> median)
      |> AdventOfCode.display_solution(1)
  end
end

defmodule Part2 do
  import Day07

  def solve do
    crabs = inputs()
    crabs
      |> calculate_expensive_fuel_consumption(crabs |> average)
      |> AdventOfCode.display_solution(2)
  end
end

Part1.solve()
Part2.solve()
