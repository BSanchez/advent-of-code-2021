defmodule Part1 do
  use Bitwise
  import Day03

  def solve do
    inputs()
      |> extract_epsilon
      |> then(fn epsilon -> { epsilon, (1 <<< 12) - 1 |> bxor(epsilon) } end)
      |> then(fn { epsilon, gamma } -> epsilon * gamma end)
      |> AdventOfCode.display_solution(1)
  end

  def extract_epsilon(list) do
    extract_epsilon(0, 0, list)
  end

  def extract_epsilon(12, accumulator, _list) do
    accumulator
  end

  def extract_epsilon(bit_position, accumulator, list) do
    accumulator = accumulator |> Day03.set_bit(bit_position, 
      list |> Day03.get_most_common_bit(bit_position)
    )
    IO.inspect({ bit_position, accumulator |> Integer.to_string(2)})

    extract_epsilon(bit_position + 1, accumulator, list)
  end

end

defmodule Part2 do
  use Bitwise
  import Day03

  def solve do
    inputs = inputs()

    oxygen_generator = extract(inputs, :o2)
    co2_scrubber = extract(inputs, :co2)

    oxygen_generator * co2_scrubber
      |> AdventOfCode.display_solution(2)
  end

  def extract(list, type) do
    extract(11, list, type)
  end

  def extract(_bit_position, [gas_value], gas_type) do
    IO.puts("#{gas_type} found, it's #{gas_value} (#{gas_value |> Integer.to_string(2) |> String.pad_leading(12, "0") })")

    gas_value
  end

  def extract(bit_position, list, type) do
    target = case type do
      :o2 -> Day03.get_most_common_bit(list, bit_position)
      :co2 -> Day03.get_least_common_bit(list, bit_position)
    end

    list = list |> Enum.filter(fn n -> Day03.select_bit(n, bit_position) == target end)
    IO.puts("target is a #{target}, #{length(list)} left")

    extract(bit_position - 1, list, type)
  end

end

Part1.solve
Part2.solve
