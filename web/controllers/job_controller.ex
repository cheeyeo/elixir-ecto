defmodule ElixirJobs.JobController do
  use Phoenix.Controller
  plug :action

  alias ElixirJobs.Router
  alias ElixirJobs.Jobs
  alias ElixirJobs.Repo
  alias ElixirJobs.Queries

  def index(conn, _params) do
    jobs = Queries.jobs_query
    render conn, "index", jobs: jobs
  end

   def new(conn, _params) do
    render conn, "new"
  end

  def create(conn, params) do
    job = %Jobs{title: params["title"], description: params["description"], job_type: params["type"], job_status: params["status"]}
    Repo.insert(job)
    redirect conn, Router.Helpers.pages_path(:index)
  end

  def show(conn, params) do
    job = Queries.job_detail_query(params["id"])
    render conn, "show", [job: job, action: params["action"]]
  end

  def edit(conn, %{"id" => id}) do
    job = Queries.job_detail_query(id)
    render conn, "edit", job: job
  end

  def update(conn, params) do
    job = Repo.get(ElixirJobs.Jobs, String.to_integer(params["id"]))
    job = %{job | title: params["title"], description: params["description"],
      job_type: params["type"], job_status: params["status"]}
    Repo.update(job)
    redirect conn, Router.Helpers.pages_path(:index)
  end

  def destroy(conn, params) do
    job = Queries.job_detail_query(params["id"])
    Repo.delete(job)

    redirect conn, Router.Helpers.pages_path(:index)
  end
end
