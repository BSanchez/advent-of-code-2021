defmodule Day03 do
  use Bitwise

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

defmodule Day03_P1 do
  use Bitwise
  # use DayO3

  def solve(inputs) do
    epsilon = extract_epsilon(inputs)
    gamma = ((1 <<< 12) - 1) |> bxor(epsilon)

    IO.puts(epsilon * gamma)
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

defmodule Day03_P2 do
  use Bitwise

  def solve(inputs) do
    oxygen_generator = extract(inputs, :o2)
    co2_scrubber = extract(inputs, :co2)

    IO.puts(oxygen_generator * co2_scrubber)
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

inputs = File.read!("input") 
  |> String.split("\n", trim: true)
  |> Enum.map(fn n -> Integer.parse(n, 2) |> elem(0) end)

# Day03_P1.solve(inputs)
Day03_P2.solve(inputs)
