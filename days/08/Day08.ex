defmodule Day08 do
  @moduledoc """
  Today we need to repair a broken seven-segment display.

  First part was confusing. I started searching how to find which is which number by 
  making comparison of segments, and have done all my preparatory work before reading
  the end of my assignment.

  So, I need to find numbers with specific lengths, so a simple filter will do.

  # Let's get real !
  
  Part 2 was as fun as expected ! I find my solution dirty, but I guess I still don't
  "think" in elixir. Anyway, it works and it was tons of fun !
  """

  import Enum

  @doc false
  def inputs do
    AdventOfCode.inputs(8) 
      |> map(fn n -> to_signal_note(n) end)
  end

  def to_signal_note(input) do
    [ part1, part2 ] = input |> String.split("|", trim: true)
    signal_pattern = part1 |> String.split(" ", trim: true) |> map(fn digit -> digit |> String.split("", trim: true) end)
    four_digit_output = part2 |> String.split(" ", trim: true) |> map(fn digit -> digit |> String.split("", trim: true) end)

    { signal_pattern, four_digit_output }
  end

  def transcript({ signal_pattern, four_digit_output }) do
    dictionary = signal_pattern |> get_dictionary

    four_digit_output
      |> map(fn d -> find(dictionary, fn { key, n } -> same_set?(n, d) end) |> elem(0) end)
      |> Enum.join
      |> Integer.parse
      |> elem(0)
  end

  def get_dictionary(signal_pattern) do
    { dictionary, _signal_pattern } = { %{}, signal_pattern }
      |> extract_1
      |> extract_4
      |> extract_7
      |> extract_8
      |> extract_9
      |> extract_0
      |> extract_6
      |> extract_3
      |> extract_5
      |> extract_2

    dictionary
  end

  def intersect(a, b) do
    c = a -- b
    a -- c
  end

  def same_set?(a, b) do
    a -- b == b -- a
  end

  def extract_1({ dictionary, signal_pattern }) do
    elem = signal_pattern |> find(fn digit -> length(digit) == 2 end)

    { 
      dictionary |> Map.put("1", elem),
      signal_pattern,
    }
  end
  def extract_7({ dictionary, signal_pattern }) do
    elem = signal_pattern |> find(fn digit -> length(digit) == 3 end)

    { 
      dictionary |> Map.put("7", elem),
      signal_pattern,
    }
  end
  def extract_4({ dictionary, signal_pattern }) do
    elem = signal_pattern |> find(fn digit -> length(digit) == 4 end)

    { 
      dictionary |> Map.put("4", elem),
      signal_pattern,
    }
  end
  def extract_8({ dictionary, signal_pattern }) do
    elem = signal_pattern |> find(fn digit -> length(digit) == 7 end)

    { 
      dictionary |> Map.put("8", elem),
      signal_pattern,
    }
  end

  def extract_9({ dictionary, signal_pattern }) do
    elem = signal_pattern |> find(fn digit -> 
      length(digit) == 6 && digit |> intersect(dictionary["4"]) |> length == 4 
    end)
    { 
      dictionary |> Map.put("9", elem),
      signal_pattern,
    }
  end


  def extract_0({ dictionary, signal_pattern }) do
    elem = signal_pattern |> find(fn digit -> 
      length(digit) == 6 && digit != dictionary["9"] && digit |> intersect(dictionary["1"]) |> length == 2 
    end)

    { 
      dictionary |> Map.put("0", elem),
      signal_pattern,
    }
  end

  def extract_6({ dictionary, signal_pattern }) do
    elem = signal_pattern |> find(fn digit -> 
      length(digit) == 6 && digit !== dictionary["9"] && digit !== dictionary["0"]
    end)

    { 
      dictionary |> Map.put("6", elem),
      signal_pattern,
    }
  end

  def extract_3({ dictionary, signal_pattern }) do
    elem = signal_pattern |> find(fn digit -> 
      length(digit) == 5 && digit |> intersect(dictionary["1"]) |> length == 2 
    end)

    { 
      dictionary |> Map.put("3", elem),
      signal_pattern,
    }
  end

  def extract_5({ dictionary, signal_pattern }) do
    elem = signal_pattern |> find(fn digit -> 
      length(digit) == 5 && digit |> intersect(dictionary["4"] -- dictionary["1"]) |> length == 2 
    end)

    { 
      dictionary |> Map.put("5", elem),
      signal_pattern,
    }
  end

  def extract_2({ dictionary, signal_pattern }) do
    elem = signal_pattern |> find(fn digit -> 
      length(digit) == 5 && digit !== dictionary["5"] && digit !== dictionary["3"]
    end)

    { 
      dictionary |> Map.put("2", elem),
      signal_pattern,
    }
  end

end
