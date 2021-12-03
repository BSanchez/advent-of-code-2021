defmodule AdventOfCode.MixProject do
  use Mix.Project

  def project do
    [
      app: :advent_of_code,
      version: "2021.3.1",
      elixir: "~> 1.12",
      start_permnent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      elixirc_paths: ["lib", "days"],
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp aliases do
    [
      day01: ["run days/01/exercice.exs"],
      day02: ["run days/02/exercice.exs"],
      day03: ["run days/03/exercice.exs"],
    ]
  end
end
