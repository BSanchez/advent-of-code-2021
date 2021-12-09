defmodule AdventOfCode.MixProject do
  use Mix.Project

  def project do
    [
      app: :advent_of_code,
      version: "2021.3.1",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      elixirc_paths: ["lib", "days"],

      # Docs
      name: "Advent of code",
      source_url: "https://github.com/bsanchez/PROJECT",
      homepage_url: "http://YOUR_PROJECT_HOMEPAGE",
      docs: [
        api_reference: false,
        main: "readme", # The main page in the docs
        # logo: "path/to/logo.png",
        extras: ["README.md"],
      ]
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
      {:ex_doc, "~> 0.24", only: :dev, runtime: false},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp aliases do
    [
      day01: ["run days/01/exercice.exs"],
      day02: ["run days/02/exercice.exs"],
      day03: ["run days/03/exercice.exs"],
      day04: ["run days/04/exercice.exs"],
      day05: ["run days/05/exercice.exs"],
      day06: ["run days/06/exercice.exs"],
      day07: ["run days/07/exercice.exs"],
      day08: ["run days/08/exercice.exs"],
      day09: ["run days/09/exercice.exs"],
      day10: ["run days/10/exercice.exs"],
      day11: ["run days/11/exercice.exs"],
      day12: ["run days/12/exercice.exs"],
      day13: ["run days/13/exercice.exs"],
      day15: ["run days/15/exercice.exs"],
      day16: ["run days/16/exercice.exs"],
      day17: ["run days/17/exercice.exs"],
      day18: ["run days/18/exercice.exs"],
      day19: ["run days/19/exercice.exs"],
      day20: ["run days/20/exercice.exs"],
      day21: ["run days/21/exercice.exs"],
      day22: ["run days/22/exercice.exs"],
      day23: ["run days/23/exercice.exs"],
      day24: ["run days/24/exercice.exs"],
      day25: ["run days/25/exercice.exs"],
    ]
  end
end
