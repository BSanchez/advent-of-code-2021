defmodule AdventOfCode_02_P1 do
  def solve(inputs) do
    each(inputs, 0, 0)
  end

  def each([{ command_type, value } | tail], hPos, depth) do
    hPos = if command_type == "forward", do: hPos + value , else: hPos
    depth = if command_type == "down"  , do: depth + value, else: depth
    depth = if command_type == "up"    , do: depth - value, else: depth

    case command_type do
      "forward" -> IO.puts('Going forward. New Position: #{hPos}, #{depth}')
      "down" -> IO.puts('Going deeper. New Position: #{hPos}, #{depth}')
      "up" -> IO.puts('Going up. New Position: #{hPos}, #{depth}')
    end

    each(tail, hPos, depth)
  end

  def each([], hPos, depth) do
    IO.puts(hPos * depth)
  end
end

defmodule AdventOfCode_02_P2 do
  def solve(inputs) do
    each(inputs, 0, 0, 0)
  end
  def each([{ command_type, value } | tail], hPos, depth, aim) do

    aim = if command_type == "down"  , do: aim + value, else: aim
    aim = if command_type == "up"    , do: aim - value, else: aim
    { hPos, depth } = if command_type == "forward"
      do { hPos + value, depth + (aim * value) }
      else { hPos, depth }
    end

    case command_type do
      "forward" -> IO.puts('Going forward. New Position: #{hPos}, #{depth}')
      "down" -> IO.puts('Aiming for the deep. New aim: #{aim}')
      "up" -> IO.puts('Aiming for the surface. New aim: #{aim}')
    end

    each(tail, hPos, depth, aim)
  end

  def each([], hPos, depth, _aim) do
    IO.puts(hPos * depth)
  end
end

inputs = File.read!("input") 
  |> String.split("\n", trim: true)
  |> Enum.map(fn n -> 
      [command_type, value] = String.split(n)
      { command_type, Integer.parse(value) |> elem(0) }
    end)

# AdventOfCode_02_P1.solve(inputs)
AdventOfCode_02_P2.solve(inputs)
