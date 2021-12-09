defmodule Day09 do
  @moduledoc """
  Today, we need to find the lowest points of a heightmap.

  Lazy me want to make a simple "get_altitude" and check neighbors of each points, 
  even if I could optimise much further. I hope it will not backfire during part 2.

  ## Finding bassins
  
  Part 2 ask us to find areas where water will "flow" to the lower points. As we know
  at leash 1 point per zone (the lower point), we will use an area fill algorithm.

  ## Unexpectedly hard

  The implementation was unexpectedly hard and the result unexpectedly smelly.
  Clearly my problem here is my usage of tuple and the planning/naming/ordering of 
  my functions. 

  There is still much to learn, and I am looknig forward the end of
  this advent of code, when my "No tuto" restriction will come off. Elixir is a
  really good language, definetly the best pick I could have done.
  """

  import Enum

  @doc false
  def inputs do
    raw = AdventOfCode.inputs(9)

    {
      raw
        |> flat_map(&String.split(&1, "", trim: true))
        |> Enum.map(&String.to_integer/1),
      raw
        |> flat_map(&String.split(&1, "", trim: true))
        |> Enum.map(fn _n -> nil end),
      raw |> at(0) |> String.length,
      raw |> length,
    }
  end

  def get_altitude({ x, y }, { altitudes, _bassins_ids, width, _height }) do
    altitudes |> at(x + y * width) 
  end

  def get_bassin_id({ x, y }, { _altitudes, bassin_ids, width, _height }) do
    bassin_ids |> at(x + y * width) 
  end

  def get_neighbors_coords({ x, y }, { _altitudes, _bassins_ids, width, height }) do
    [ {x - 1, y}, {x + 1, y}, {x, y-1}, {x, y+1} ]
      |> Enum.filter(fn {x, y} -> x != -1 && x != width && y != -1 && y != height end)
  end

  def get_neighbors_altitude({ x, y }, map) do
    get_neighbors_coords({ x, y}, map)
      |> Enum.map(&get_altitude(&1, map))
  end

  def is_lower_point?(point, map) do
    get_neighbors_altitude(point, map)
      |> Enum.min
      |> then(fn lower_neighbour -> if get_altitude(point, map) < lower_neighbour, do: true, else: false end)
  end

  def get_lower_points(map) do
    { _altitudes, _bassin_ids, width, height } = map

    Enum.reduce(0..(width * height - 1), [], 
      fn coords, lower_points -> 
        x = coords |> Integer.mod(100)
        y = coords / 100 |> trunc
        if is_lower_point?({x, y}, map) do
          [{x, y} | lower_points]
        else
          lower_points 
        end
      end) 
  end

  def fill_bassin(map, coords, bassin_id) do
    map = assign_point_to_bassin(map, coords, bassin_id)
    current_altitude = get_altitude(coords, map)

    get_neighbors_coords(coords, map) 
      |> Enum.reduce(map, fn coord, map ->
        altitude = get_altitude(coord, map)
        bassin = get_bassin_id(coord, map)

        if altitude > current_altitude && altitude < 9 && bassin == nil do
          fill_bassin(map, coord, bassin_id)
        else
          map
        end
      end)
  end

  def assign_point_to_bassin({ altitudes, bassin_ids, width, height }, { x, y }, bassin_id) do
    { 
      altitudes,
      bassin_ids |> List.update_at(x + y * width, fn _n -> bassin_id end),
      width,
      height,
    }
  end

end
