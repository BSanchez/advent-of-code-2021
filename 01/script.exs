defmodule AdventOfCode_01_P1 do
  def solve([head | tail]) do
    reduce(tail, 0, head)
  end
  def reduce([head | tail], deeperNumber, lastDepth) do
    deeperNumber = if head > lastDepth do
      IO.puts("#{head} (increased) - #{deeperNumber + 1}")
      deeperNumber + 1
    else
      IO.puts("#{head} (decreased)")
      deeperNumber
    end

    reduce(tail, deeperNumber, head)
  end

  def reduce([], deeperNumber, _lastDepth) do
    IO.puts(deeperNumber)
  end
end

defmodule AdventOfCode_01_P2 do
  def solve([a, b, c | tail]) do
    sum = a + b + c

    reduce([b, c] ++ tail, 0, sum)
  end
  def reduce([a, b, c | tail], deeperNumber, lastDepth) do
    sum = a + b + c

    deeperNumber = if sum > lastDepth do
      IO.puts("#{a} + #{b} + #{c} = #{sum} (increased)")
      deeperNumber + 1
    else
      IO.puts("#{a} + #{b} + #{c} = #{sum} (decreased)")
      deeperNumber
    end

    reduce([b, c] ++ tail, deeperNumber, sum)
  end

  def reduce([_ampo, b], deeperNumber, _lastDepth) do
    IO.puts(deeperNumber)
  end
end

inputs = File.read!("input") 
  |> String.split("\n", trim: true) \
  |> Enum.map(fn n -> {v, _} = Integer.parse(n); v end)

# AdventOfCode_01_P1.solve(inputs)
AdventOfCode_01_P2.solve(inputs)
