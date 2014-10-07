defmodule ElixirJobs.Queries do
  import Ecto.Query
  alias ElixirJobs.Jobs
  alias ElixirJobs.Users
  alias ElixirJobs.Repo

  def jobs_query do
    query = from job in Jobs,
            order_by: [desc: job.id],
            select: job
    Repo.all(query)
  end

  def job_detail_query(id) do
    int_id = String.to_integer(id)
    query = from job in Jobs,
            where: job.id == ^int_id,
            select: job
    Repo.all(query) |> List.first
  end

  def login(username, password) do
    md5_password = Crypto.md5(password)
    IO.inspect md5_password

    query = from user in Users,
            where: user.username == ^username,
            where: user.password == ^md5_password,
            select: user
    Repo.all(query) |> List.first
  end
end
