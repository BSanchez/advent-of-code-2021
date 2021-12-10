defmodule Part1 do
  import Day10

  def solve do
    inputs() 
      |> Enum.map(&check_syntax(&1, nil)) 
      |> Enum.filter(&( elem(&1, 0) == :syntax_error)) 
      |> Enum.map(&elem(&1, 1))
      |> Enum.map(&to_score/1)
      |> Enum.sum
      |> AdventOfCode.display_solution(1)
  end

  def to_score(char) do
    case char do
      ")" -> 3
      "]" -> 57
      "}" -> 1197
      ">" -> 25137
    end
  end

end

defmodule Part2 do
  import Day10

  def solve do
    inputs() 
      |> Enum.map(&check_syntax(&1, nil)) 
      |> Enum.filter(&( elem(&1, 0) == :incomplete_command)) 
      |> Enum.map(&elem(&1, 1))
      |> Enum.map(&to_score/1)
      |> Enum.sort
      |> Day07.median
      |> AdventOfCode.display_solution(2)
  end

  def char_to_score(char) do
    case char do
      "(" -> 1
      "[" -> 2
      "{" -> 3
      "<" -> 4
    end
  end

  def to_score(missing) do
    missing 
      |> String.split("", trim: true) 
      |> Enum.map(&char_to_score/1)
      |> Enum.reduce(0, &(&2 * 5 + &1))
  end
end

Part1.solve()
Part2.solve()
