defmodule Part1 do
  import Day01 

  def solve do
    inputs()
      |> each
      |> AdventOfCode.display_solution(1)
  end

  def each([head | tail]) do
    each(tail, 0, head)
  end

  def each([head | tail], deeperNumber, lastDepth) do
    deeperNumber = if head > lastDepth do
      # IO.puts("#{head} (increased) - #{deeperNumber + 1}")
      deeperNumber + 1
    else
      # IO.puts("#{head} (decreased)")
      deeperNumber
    end

    each(tail, deeperNumber, head)
  end

  def each([], deeperNumber, _lastDepth) do
    deeperNumber
  end

end

defmodule Part2 do
  import Day01 

  def solve do
    inputs()
      |> each
      |> AdventOfCode.display_solution(2)
  end

  def each([a, b, c | tail]) do
    sum = a + b + c

    each([b, c] ++ tail, 0, sum)
  end

  def each([a, b, c | tail], deeperNumber, lastDepth) do
    sum = a + b + c

    deeperNumber = if sum > lastDepth do
      # IO.puts("#{a} + #{b} + #{c} = #{sum} (increased)")
      deeperNumber + 1
    else
      # IO.puts("#{a} + #{b} + #{c} = #{sum} (decreased)")
      deeperNumber
    end

    each([b, c | tail], deeperNumber, sum)
  end

  def each([_a, _b], deeperNumber, _lastDepth) do
    deeperNumber
  end
end

Part1.solve
Part2.solve
