defmodule ElixirJobs.Users do
  use Ecto.Model

  schema "users" do
    field :username, :string
    field :password, :string
  end
end
