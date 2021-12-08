defmodule Part1 do
  import Day08

  def solve do
    inputs() 
      |> Enum.map(fn n -> n 
        |> elem(1) 
        |> Enum.map(fn n -> n |> length end) 
        end) 
      |> List.flatten 
      |> Enum.filter(fn n -> n == 2 || n ==3 || n == 4 || n == 7 end) 
      |> length
      |> AdventOfCode.display_solution(1)
  end
end

defmodule Part2 do
  import Day08

  def solve do
    inputs() 
      |> Enum.map(fn n -> n |> Day08.transcript end)
      |> Enum.sum
      |> AdventOfCode.display_solution(2)
  end
end

Part1.solve()
Part2.solve()
