# This file is responsible for configuring your application
use Mix.Config

# Note this file is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project.

config :phoenix, ElixirJobs.Router,
  port: System.get_env("PORT"),
  ssl: false,
  static_assets: true,
  cookies: true,
  session_key: "_elixir_jobs_key",
  session_secret: "X7$2(!C!7!RO6F9QT0L=QZJ3P3$T=1C)1GC61R+53F)2V@ET&H)IQ=@*S)E3)OUL7(U7VU300%1",
  catch_errors: true,
  debug_errors: false,
  error_controller: ElixirJobs.PageController

config :phoenix, :code_reloader,
  enabled: false

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. Note, this must remain at the bottom of
# this file to properly merge your previous config entries.
import_config "#{Mix.env}.exs"
