defmodule Part1 do
  import Day11

  def solve do
    1..100
      |> Enum.map_reduce(inputs(), fn _day, squidmap -> day_pass(squidmap) end)
      |> elem(0)
      |> IO.inspect
      |> Enum.sum
      |> AdventOfCode.display_solution(1)
  end
end

defmodule Part2 do
  import Day11

  def solve do
      inputs()
      |> wait_for_sync
      |> AdventOfCode.display_solution(2)
  end

  def wait_for_sync(squidmap, counter \\ 1) do
    squidmap = day_pass(squidmap) |> elem(1)

    if squidmap |> elem(1) |> Enum.sum == 0 do
      counter
    else
      wait_for_sync(squidmap, counter + 1)
    end
  end
end

Part1.solve()
Part2.solve()
