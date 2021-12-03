defmodule Day02 do
  @moduledoc """
  TODO trouver comment fonctionne cette histoire de documentation
  """

  @doc """
  """
  def inputs do
    AdventOfCode.inputs(2)
      |> Enum.map(fn n -> 
        [command_type, value] = String.split(n)

        [command_type, Integer.parse(value) |> elem(0)]
      end)
  end

end
