defmodule ElixirJobs.Users do
  use Ecto.Model

  alias ElixirJobs.Users
  alias ElixirJobs.Repo

  schema "users" do
    field :username, :string
    field :password, :string
  end

  def create(username, password) do

    user = %Users{username: username, password: Crypto.md5(password)}

    Repo.insert(user)
  end
end
