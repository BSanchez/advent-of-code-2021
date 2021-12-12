defmodule Map2D do
  @moduledoc """
  Récupération de ce qui a été fait Day09
  """

  import Enum

  @doc false
  def parse(string) do
    raw = string |> String.split("\n", trim: true)
    width = raw |> at(0) |> String.length
    height = raw |> length
    values = raw |> flat_map(&String.split(&1, "", trim: true))

    {
      { width, height },
      values,
    }
  end

  def parse(string, format_fn) do
    raw = string |> String.split("\n", trim: true)

    width = raw |> at(0) |> String.length
    height = raw |> length
    values = raw |> flat_map(&String.split(&1, "", trim: true)) |> Enum.map(format_fn)

    {
      { width, height },
      values, 
    }
  end

  def get_point({ { width, _height }, values }, { x, y }) do
    values |> at(x + y * width)
  end

  def update_point({ { width, height }, values }, { x, y },  update_fn) do
    {
      { width, height },
      values |> List.update_at(x + y * width, update_fn)
    }
  end

  def get_neighbors_coords({ x, y }, { { width, height }, _values }, options)  when is_list(options) do
    points = Keyword.get(options, :points, 8)

    case points do
      8 -> 
        [ {x - 1, y}, {x + 1, y}, {x, y-1}, {x, y+1},
          {x - 1, y - 1}, {x + 1, y + 1}, {x + 1, y - 1}, {x - 1, y + 1} ]
      4 ->
        [ {x - 1, y}, {x + 1, y}, {x, y-1}, {x, y+1} ]
    end 
      |> Enum.filter(fn {x, y} -> x != -1 && x != width && y != -1 && y != height end)
  end

end
