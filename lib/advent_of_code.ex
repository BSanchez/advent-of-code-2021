defmodule AdventOfCode do
  @moduledoc false
  def inputs(day) do
    inputs(day, [])
  end

  def inputs(day, options) when is_list(options) do
    argv_options = OptionParser.parse(System.argv, strict: [example: :boolean]) |> elem(0)

    type = Keyword.get(options, :type, if (argv_options[:example]) do :example else :input end)
    format = Keyword.get(options, :format, :raw_lines)

    case format do
      :raw -> input_file(day, type)
      :raw_lines -> input_file(day, type) |> String.split("\n", trim: true)
      _ -> "TODO Gérer une fonction pour le formatting"
    end
  end

  def input_file(day, type) do
    day_to_string = Integer.to_string(day) |> String.pad_leading(2, "0")

    File.read!("inputs/#{day_to_string}.#{type}")
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
