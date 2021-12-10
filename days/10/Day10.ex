defmodule Day10 do
  @moduledoc """
  Today we need to write a block parser, for sorting lines unfinished or with 
  a syntax error

  ## I am getting the hang of recursion

  Tpday, I am really pleased with my check_syntax method. The firtst implementation I thought
  about used recursion and not looping, and I think my code is very clear and pleasant.

  Maybe yesterday was a bitter but much needed lesson : I need to think in elixir,
  not in ruby/js/whatever and then transtate to elixir.
  
  ## I found new stuff I needed without knowing it
  
  Some days ago, I finally understood this &Something functions and how to use them.
  Yesterday I stumbled upon the "&()" shorthand syntax, it will really help me.

  Today I found I can store lambdas (or anonymous functions, I don't know what they
  are for now) in variables, like I could in ruby or javascript. I also found a way 
  to use functions like a pseudo case, and I could make my code way dryer with that.
  
  If only I could go back and fix all previous days, I guess my code would be way
  shorter and understandable.
  """

  @doc false
  def inputs do
    AdventOfCode.inputs(10)
      |> Enum.map(&String.split(&1, "", trim: true))
  end

  def check_syntax([character | tail], opened_tag) do
    handle_next = fn
      { :closed, _character, tail } -> check_syntax(tail, opened_tag)
      { :syntax_error, character } -> { :syntax_error, character }
      { :incomplete_command, missing } -> { :incomplete_command, if opened_tag != nil do missing <> opened_tag else missing end }
      { :valid_command } -> { :valid_command }
    end

    case { character, opened_tag } do
      {"[", _open_tag} -> check_syntax(tail, "[") |> then(handle_next)
      {"(", _open_tag} -> check_syntax(tail, "(") |> then(handle_next)
      {"<", _open_tag} -> check_syntax(tail, "<") |> then(handle_next)
      {"{", _open_tag} -> check_syntax(tail, "{") |> then(handle_next)

      {"]", "["} -> { :closed, character, tail }
      {")", "("} -> { :closed, character, tail }
      {">", "<"} -> { :closed, character, tail }
      {"}", "{"} -> { :closed, character, tail }

      _ -> { :syntax_error, character }
    end
  end

  def check_syntax([], open_tag) do 
    if open_tag == nil do
      { :valid_command }
    else
      { :incomplete_command, open_tag }
    end
  end
end
