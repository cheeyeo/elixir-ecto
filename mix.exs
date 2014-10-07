defmodule ElixirJobs.Mixfile do
  use Mix.Project

  def project do
    [ app: :elixir_jobs,
      version: "0.0.1",
      elixir: "~> 1.0.0-rc1",
      elixirc_paths: ["lib", "web"],
      deps: deps ]
  end

  def application do
    [
      mod: { ElixirJobs, [] },
      applications: app_list(Mix.env)
    ]
  end

  defp app_list(:test), do: [:hound | app_list]
  defp app_list(_),     do: app_list
  defp app_list,        do: [:phoenix, :cowboy, :logger, :postgrex, :ecto]

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat" }
  defp deps do
    [
      {:phoenix, "0.4.1"},
      {:cowboy, "~> 1.0.0"},
      {:postgrex, "~> 0.6.0"},
      {:ecto, "~> 0.2.5"},
      {:hound, github: "HashNuke/hound"}
    ]
  end
end
