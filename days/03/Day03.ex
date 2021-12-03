defmodule Day03 do
  @moduledoc """
  TODO trouver comment fonctionne cette histoire de documentation
  """

  @doc """
  """
  use Bitwise, only_operators: true

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
