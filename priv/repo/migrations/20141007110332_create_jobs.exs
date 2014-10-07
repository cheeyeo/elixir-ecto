defmodule ElixirJobs.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def up do
    ["CREATE TABLE jobs(id serial primary key, title varchar(125), job_type varchar(50), description text, job_status varchar(50))"]
  end

  def down do
    "DROP TABLE jobs"
  end
end
