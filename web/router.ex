defmodule ElixirJobs.Router do
  use Phoenix.Router

  scope alias: ElixirJobs do
    get "/", PageController, :index, as: :pages
    resources "/jobs", JobController

    get "/users/new", UserController, :new, as: :user
    post "/users", UserController, :create, as: :user
  end
end