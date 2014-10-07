defmodule ElixirJobs.Jobs.JobsTest do
  use ElixirJobsDataTest.Case

  alias ElixirJobs.Jobs
  alias ElixirJobs.Repo
  alias ElixirJobs.Queries

  test "Jobs can be created" do
    job = Jobs.create("Title", "Description", "Remote", "Part time")
    assert job.title == "Title"
    assert job.description == "Description"
    assert job.job_status == "Part time"
    assert job.job_type == "Remote"

    assert Repo.count(Jobs) == 1
  end

  test "Jobs can be fetched after being created" do
    job1 = Jobs.create("Title", "Description", "Remote", "Part time")
    job = Queries.job_detail_query(Integer.to_string(job1.id))
    assert job1 == job
  end
end
