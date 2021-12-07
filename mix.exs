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
    ]
  end
end
