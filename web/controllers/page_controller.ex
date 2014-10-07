defmodule ElixirJobs.PageController do
  use Phoenix.Controller
  plug :action

  alias ElixirJobs.Queries

  def index(conn, _params) do
    jobs = Queries.jobs_query
    render conn, "index", jobs: jobs
  end
end
