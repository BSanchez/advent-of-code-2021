defmodule Part1 do
  import Day05
  import Enum

  def solve do
    inputs()
      |> filter(fn { x1, y1, x2, y2} -> x1 == x2 || y1 == y2 end)
      |> reduce(%{}, fn line, map -> draw_line(map, line) end)
      |> calculate_solution()
      |> AdventOfCode.display_solution(1)
  end
end

defmodule Part2 do
  import Day05
  import Enum

  def solve do
    inputs()
      |> reduce(%{}, fn line, map -> draw_line(map, line) end)
      |> calculate_solution()
      |> AdventOfCode.display_solution(2)
  end

end

Part1.solve
Part2.solve
