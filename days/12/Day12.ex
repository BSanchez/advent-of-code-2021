defmodule AdventOfCode.String do
  def upcase?(string), do: string == String.upcase(string)
  def downcase?(string), do: !upcase?(string)
end

defmodule AdventOfCode.Enum do
  def intersect(a, b), do: a -- (a -- b)

  def unordored_equal?(a, b), do: a -- b == b -- a
end

defmodule Day12 do
  @moduledoc """

  Today I have to explore an interconnected tree for all possible paths. I already
  have a solution with recursion in my head, and I think it will go smoothly
  
  ## defstruct

  Today assignment was nice, and I am pleased by my solution. NOt much to say about it,
  so I will talk about one major discovery I found today while reading 
  [Kernel source code](https://github.com/elixir-lang/elixir/blob/main/lib/elixir/lib/kernel.ex#L2251) : Struct.

  Struct in elixir are globally struct, like in ruby for example. This is the missing
  piece I needed for replacing my (bad) usage of tuples. I don't have any reason to
  use them today, but have some really good usage for them for map_2d ! I hope
  I will need to work on this module again soon. Unfortunately, next week will be
  loaded way to much, I already know I couldn't be diligent.
  """

  import AdventOfCode.String
  import AdventOfCode.Enum

  @doc false
  def inputs do
    AdventOfCode.inputs(12, format: :raw_lines)
      |> Enum.map(&String.split(&1, "-"))
      |> Enum.reduce(%{}, fn [ point_a, point_b], cave_rooms -> 
        cave_rooms = if point_a != "end" && point_b != "start" do
          cave_rooms |> Map.update(point_a, [point_b], &(&1 ++ [point_b]))
        else 
          cave_rooms
        end

        if point_b != "end" && point_a != "start" do 
          cave_rooms |> Map.update(point_b, [point_a], &(&1 ++ [point_a]))
        else
          cave_rooms
        end
      end)
  end

  def seek_paths(room, rooms_map, max \\ 0), do: seek_paths(room, rooms_map, [], max)

  def seek_paths("end", _rooms_map, current_path, _max), do: [["end" | current_path] |> Enum.reverse]

  def seek_paths(room, rooms_map, current_path, max) do
    current_path = [ room | current_path]
    rooms_map 
      |> fetch_room(room)
      |> filter_forbidden_rooms(current_path, max)
      |> Enum.flat_map(&seek_paths(&1, rooms_map, current_path, max))
  end
  
  def fetch_room(rooms_map, room), do: rooms_map |> Map.fetch!(room |> String.trim_leading("*"))

  def filter_forbidden_rooms(rooms_list, current_path, max) do
    already_visited_small_rooms = Enum.filter(current_path, &downcase?/1)

    # Si on a déjà revisité une room, on a plus cette possibilité
    if current_path |> already_contain_maximum_revisited_room?(max) do
      rooms_list -- already_visited_small_rooms

    # Sinon, on a le droit de revisiter !
    else 
      (rooms_list -- already_visited_small_rooms) ++ ( intersect(already_visited_small_rooms, rooms_list) |> Enum.map(&("*" <> &1)) )
    end# |> IO.inspect
  end

  defp already_contain_maximum_revisited_room?(current_path, max) do
    (current_path |> Enum.filter(&String.starts_with?(&1, "*")) |> length) >= max
  end

end
