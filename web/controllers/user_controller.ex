defmodule Crypto do
  def md5(str) do
    :crypto.hash(:md5, str)
      |> :erlang.bitstring_to_list
      |> Enum.map(&(:io_lib.format("~2.16.0b", [&1])))
      |> List.flatten
      |> :erlang.list_to_bitstring
  end
end

defmodule ElixirJobs.UserController do
  use Phoenix.Controller
  alias ElixirJobs.Router
  alias ElixirJobs.Repo

  plug :action

  def new(conn,_params) do
    render conn, "new"
  end


  def create(conn,params) do
    user = %ElixirJobs.Users{username: params["username"], password: Crypto.md5(params["password"])}

    Repo.insert(user)

    redirect conn, Router.Helpers.pages_path(:index)
  end
end
