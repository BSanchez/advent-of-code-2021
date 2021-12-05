defmodule Part1 do
  import Day04
  import Enum

  def solve do
    { drafted_numbers_list, boards } = inputs()

    draft_number_until_solved(drafted_numbers_list, boards)
      |> AdventOfCode.display_solution(1)
  end

  def draft_number_until_solved([number | remaining_drafted_numbers], boards) do
    boards = map(boards, fn board -> cross_number_on_board(board, number) end)

    winning_board = find(boards, false, fn board -> is_board_completed?(board) end)
    if winning_board do 
      IO.puts("And we have a winner !")
      draw_board(winning_board)
      IO.puts("** #{ winning_board |> get_board_score } * #{number} **")

      get_board_score(winning_board) * number
    else
      # Enum.each(boards, fn board -> draw_board(board) end)
      draft_number_until_solved(remaining_drafted_numbers, boards)
    end
    
  end
  
end

defmodule Part2 do
  import Day04

  def solve do
    { drafted_numbers_list, boards } = inputs()

    draft_number_until_solved(drafted_numbers_list, boards)
      |> AdventOfCode.display_solution(2)
  end

  def draft_number_until_solved([number | remaining_drafted_numbers], boards) when length(boards) > 1 do
    boards = 
      boards
      |> Enum.map(fn board -> cross_number_on_board(board, number) end)
      |> Enum.filter(fn board -> !is_board_completed?(board) end)

    if length(boards) == 1 do 
      # [ loosing_board ] = boards
      # draw_board(loosing_board)

      draft_number_until_solved(remaining_drafted_numbers, boards)
    else
      # Enum.each(boards, fn board -> draw_board(board) end)
      draft_number_until_solved(remaining_drafted_numbers, boards)
    end
    
  end

  def draft_number_until_solved([number | remaining_drafted_numbers], [board]) do
    board = cross_number_on_board(board, number)
    draw_board(board)

    if is_board_completed?(board) do 
      IO.puts("At last, event this board win !")
      IO.puts("** #{ board |> get_board_score } * #{number} **")

      get_board_score(board) * number
    else
      draft_number_until_solved(remaining_drafted_numbers, [board])
    end

  end
  
end

Part1.solve
Part2.solve
