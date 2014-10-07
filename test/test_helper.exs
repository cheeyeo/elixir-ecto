Phoenix.CodeReloader.reload!
ExUnit.start

Mix.Task.run "ecto.drop", ["ElixirJobs.Repo"]
Mix.Task.run "ecto.create", ["ElixirJobs.Repo"]
Mix.Task.run "ecto.migrate", ["ElixirJobs.Repo"]

defmodule ElixirJobsDataTest.Case do
  use ExUnit.CaseTemplate

  alias Ecto.Adapters.Postgres

  setup do
    Postgres.begin_test_transaction(ElixirJobs.Repo)
    on_exit fn ->
      Postgres.rollback_test_transaction(ElixirJobs.Repo)
    end
  end
end
