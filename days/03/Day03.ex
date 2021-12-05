defmodule Day03 do
  @moduledoc """
  Our submarine does weird nodes, and we need to extract 2 numbers out of it using
  bitwise operations.

  ## Bitwise operations

  Well, Elixir has a Bitwise module and I am reaaaaly versed in bitwise operations,
  so, we will use bitwise operations.

  ## Importing modules

  This exercice was the easiest so far, I had a working solution inside iex in
  less than 10 minutes. I could refactor this crap, but I guess my time will be
  better invested in another aspect : structuring and reusing parts of code.

  Elixir have three methods used for managing reuse: require, and import. And not
  one of these will help us "require" a file, because it's not needed. Any module
  in the directory are automatically loaded and usable, on the sole condition the
  file was compiled beforehand.

  ## Mix

  [Mix](https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html#our-first-project) 
  is a tool for managing compilations, dependencies, etc of an elixir application.
  I'ts the bundler or the npm of Elixir. Using it is pretty easy and I can shape
  an application pretty quickly.

  It have a built-in documentation syntaxe and I will need to investigate this
  further, I would like to use it for compiling this devblog.
  """

  use Bitwise, only_operators: true

  @doc false
  def inputs do
    AdventOfCode.inputs(3)
      |> Enum.map(fn n -> Integer.parse(n, 2) |> elem(0) end)
  end

  def set_bit(number, bit_position, value) do
    # C'est faux, ça ne fait que set, ça ne peut pas retirer, mais bon osef
    # c'est suffisant pour notre cas
    number + (value <<< bit_position)
  end

  def select_bit(number, bit) do
    (number >>> bit) &&& 1
  end

  def get_average_for_bit_position(list, bit_position) do
    bit_list = Enum.map(list, fn n -> select_bit(n, bit_position) end)
    (Enum.sum(bit_list)) / length(bit_list)
  end

  def get_most_common_bit(list, bit_position) do
    average = get_average_for_bit_position(list, bit_position)
    if (average >= 0.5), do: 1, else: 0
  end

  def get_least_common_bit(list, bit_position) do
    average = get_average_for_bit_position(list, bit_position)
    if (average >= 0.5), do: 0, else: 1
  end

end
