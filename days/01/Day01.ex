defmodule Day01 do
  @moduledoc """
  TODO trouver comment fonctionne cette histoire de documentation
  """

  @doc """
  """
  def inputs do
    AdventOfCode.inputs(1)
      |> Enum.map(fn n -> Integer.parse(n) |> elem(0) end)
  end

end
