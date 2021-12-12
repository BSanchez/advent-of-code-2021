defmodule Part1 do
  import Day12

  def solve do
    seek_paths("start", inputs())
      |> length
      |> AdventOfCode.display_solution(1)
  end

end

defmodule Part2 do
  import Day12

  def solve do
    seek_paths("start", inputs(), 1)
      |> length
      |> AdventOfCode.display_solution(2)
  end

end

Part1.solve()
Part2.solve()
