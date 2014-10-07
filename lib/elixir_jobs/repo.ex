defmodule ElixirJobs.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres, env: Mix.env

  import Ecto.Query, only: [from: 2]
  alias ElixirJobs.Repo

  use Ecto.Model

  @doc "Adapter configuration"
  def conf(env), do: parse_url url(env)

  @doc "The URL to reach the database."
  defp url(:dev) do
    "ecto://elixir_user:elixir@localhost/elixir_jobs_dev"
  end

  defp url(:test) do
    "ecto://elixir_user:elixir@localhost/elixir_jobs_test?size=1&max_overflow=0"
  end

  defp url(:prod) do
    "ecto://user:pass@localhost/elixir_jobs_repo_prod"
  end

  @doc "The priv directory to load migrations and metadata."
  def priv do
    app_dir(:elixir_jobs, "priv/repo")
  end

  def count(module) do
    from(c in module, select: count(c.id))
    |> Repo.all
    |> hd
  end
end
