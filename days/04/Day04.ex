defmodule Day04 do
  @moduledoc """
  TODO trouver comment fonctionne cette histoire de documentation
  """

  @doc """
  """
  def inputs do
    [drawn_number_input | boards_input] = AdventOfCode.inputs(4)
    
    drawn_numbers = String.split(drawn_number_input, ",", trim: true)
      |> Enum.map(fn n -> Integer.parse(n) |> elem(0) end)

    boards = get_boards(boards_input)

    { drawn_numbers, boards }
  end

  # Mes fonctions pour interragir avec la board.
  def get_boards(list), do: get_boards(list, [])
  def get_boards([a, b, c, d, e | tail], boards) do
    new_board = [a, b, c, d, e] 
      |> Enum.join(" ")
      |> String.split(" ", trim: true)
      |> Enum.map(fn n -> Integer.parse(n) |> elem(0) end)

    boards = boards ++ [new_board]  

    get_boards(tail, boards)
  end
  def get_boards([], boards), do: boards

  def cross_number_on_board(board, number) do
    Enum.map(board, fn n -> if n == number, do: -1, else: n end)
  end

  # def cross_number_on_all_boards(boards, number) do
  #   Enum.map(boards, fn board -> cross_number_on_board(board, number) end)
  # end

  def get_row(board, rowNumber) do
    Enum.slice(board, rowNumber * 5, 5)
  end

  def get_col(board, colNumber) do
    [
      board |> Enum.at(colNumber + 0),
      board |> Enum.at(colNumber + 5),
      board |> Enum.at(colNumber + 10),
      board |> Enum.at(colNumber + 15),
      board |> Enum.at(colNumber + 20),
    ]
  end

  def is_row_or_col_completed?(row_col) do
    Enum.sum(row_col) == -5
  end

  def is_board_completed?(board), do: is_board_completed?(board, 0)
  def is_board_completed?(_board, 10), do: false
  def is_board_completed?(board, row_col_index) do
    sample = if row_col_index < 5 do
      get_row(board, row_col_index)
    else
      get_col(board, row_col_index - 5)
    end

    if is_row_or_col_completed?(sample),
      do: true,
      else: is_board_completed?(board, row_col_index + 1)

  end
  def draw_board(board) do
    board 
      |> Enum.map(fn n -> 
        if n == -1 do
          ' X'
        else
          n |> Integer.to_string |> String.pad_leading(2, " ")
        end
      end)
      |> Enum.chunk_every(5)
      |> Enum.map(fn a -> a |> Enum.join(" ") end)
      |> Enum.join("\n")
      |> then(fn s -> "\n" <> s <> "\n" end)
      |> IO.puts
  end

  def get_board_score(board) do
    board |> Enum.map(fn n -> if n == -1, do: 0, else: n end) |> Enum.sum
  end

end
