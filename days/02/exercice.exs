defmodule Part1 do
  import Day02

  def solve do
    inputs()
      |> each
      |> then(fn { hPos, depth } -> hPos * depth end)
      |> AdventOfCode.display_solution(1)
  end

  def each(inputs), do: each(inputs, 0, 0)
  defp each([[command_type, value] | tail], hPos, depth) do

    # I really want to clean all of this inside a single case, but I must resist the urge
    hPos = if command_type == "forward", do: hPos + value , else: hPos
    depth = if command_type == "down"  , do: depth + value, else: depth
    depth = if command_type == "up"    , do: depth - value, else: depth

    # IO.inspect([command_type, value])
    # case command_type do
    #   "forward" -> IO.puts('Going forward. New Position: #{hPos}, #{depth}')
    #   "down" -> IO.puts('Going deeper. New Position: #{hPos}, #{depth}')
    #   "up" -> IO.puts('Going up. New Position: #{hPos}, #{depth}')
    # end

    each(tail, hPos, depth)
  end
  defp each([], hPos, depth), do: { hPos, depth }
end

defmodule Part2 do
  import Day02

  def solve do
    inputs()
      |> each
      |> then(fn { hPos, depth } -> hPos * depth end)
      |> AdventOfCode.display_solution(2)
  end

  def each(inputs), do: each(inputs, 0, 0, 0)
  def each([[command_type, value] | tail], hPos, depth, aim) do

    aim = if command_type == "down"  , do: aim + value, else: aim
    aim = if command_type == "up"    , do: aim - value, else: aim
    { hPos, depth } = if command_type == "forward"
      do { hPos + value, depth + (aim * value) }
      else { hPos, depth }
    end

    # IO.inspect([command_type, value])

    each(tail, hPos, depth, aim)
  end
  def each([], hPos, depth, _aim), do: { hPos, depth }
end

Part1.solve
Part2.solve
