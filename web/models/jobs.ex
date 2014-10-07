defmodule ElixirJobs.Jobs do
  use Ecto.Model

  alias ElixirJobs.Jobs
  alias ElixirJobs.Repo

  schema "jobs" do
    field :title, :string
    field :job_type, :string
    field :description, :string
    field :job_status, :string
  end

  def create(title, description, job_type, job_status) do
    job = %Jobs{title: title, description: description, job_type: job_type, job_status: job_status}

    Repo.insert(job)
  end
end
