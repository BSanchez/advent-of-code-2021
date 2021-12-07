defmodule Day07 do
  @moduledoc """
  Crab submarines are really neat underwater vehicles with a quircky way of displacement.
  How can we align them ?

  ## Let's do some maths

  First part of assignment ask me to calculate a median. Testing it on 
  iex gave me the right answer. 

  Part two ask me to calculate an average and a factorial. Testing it on iex also
  gave me the right answer. So, let's call it a day, and see you tomorow !
  """

  import Enum

  @doc false
  def inputs do
    AdventOfCode.inputs(7) 
      |> at(0)
      |> String.split(",")
      |> map(fn n -> Integer.parse(n) |> elem(0) end)
  end

  def median(enum) do
    center = length(enum) |> div(2) |> round
    enum |> sort |> Enum.at(center)
  end

  def average(enum) do
    size = length(enum)
    enum |> Enum.sum |> div(size) |> round
  end

  def factorial(number) do
    1..number |> Enum.sum
  end

  def calculate_linear_fuel_consumption(crabs, position) do
    crabs
      |> Enum.map(fn c -> c - position |> abs end)
      |> Enum.sum
  end

  def calculate_expensive_fuel_consumption(crabs, position) do
    crabs
      |> Enum.map(fn c -> c - position |> abs |> factorial end)
      |> Enum.sum
  end

end
