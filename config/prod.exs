use Mix.Config

# NOTE: To get SSL working, you will need to set:
#
#     ssl: true,
#     keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#     certfile: System.get_env("SOME_APP_SSL_CERT_PATH"),
#
# Where those two env variables point to a file on disk
# for the key and cert

config :phoenix, ElixirJobs.Router,
  port: System.get_env("PORT"),
  ssl: false,
  host: "example.com",
  cookies: true,
  session_key: "_elixir_jobs_key",
  session_secret: "X7$2(!C!7!RO6F9QT0L=QZJ3P3$T=1C)1GC61R+53F)2V@ET&H)IQ=@*S)E3)OUL7(U7VU300%1"

config :logger, :console,
  level: :info,
  metadata: [:request_id]

