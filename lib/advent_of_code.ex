defmodule AdventOfCode do
  @moduledoc """
  Documentation for `AdventOfCode`.
  """

  @doc """
  inputs(day)

  Load input values for the given exercice

  ## Examples

      iex> AdventOfCode.loadInputValues(3)
        [
        00100,
        11110,
        10110,
        10111,
        10101,
        01111,
        00111,
        11100,
        10000,
        11001,
        00010,
        01010,
        ]

  """

  def inputs(day) do
    options = OptionParser.parse(System.argv, strict: [example: :boolean]) |> elem(0)

    day_to_string = Integer.to_string(day) |> String.pad_leading(2, "0")
    type = if (options[:example]), do: "example", else: "input"

    File.read!("inputs/#{day_to_string}.#{type}") |> String.split("\n", trim: true)
  end

  def example(day) do
    day_to_string = Integer.to_string(day) |> String.pad_leading(2, "0")
    type = "example"

    File.read!("inputs/#{day_to_string}.#{type}") |> String.split("\n", trim: true)
  end

  def display_solution(solution), do: display_solution(solution, 0)

  def display_solution(solution, part) do
    solution = Integer.to_string(solution)
    end_separator = solution |> String.length |> then(fn n -> n + 2 end) |> div(2) |> trunc |> then(fn n -> String.duplicate(" ", 13 - n) <> "*" end)

    case part do
      0 -> "**************************"
      1 -> "******* FIRST PART *******"
      2 -> "******* SECOND PART ******"
    end |> IO.puts
    IO.puts(solution <> end_separator |> String.pad_leading(25, " ") |> then(fn s -> "*" <> s end))
    IO.puts("**************************\n")
  end

end
