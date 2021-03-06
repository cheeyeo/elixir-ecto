use Mix.Config

config :phoenix, ElixirJobs.Router,
  port: System.get_env("PORT") || 4001,
  ssl: false,
  cookies: true,
  session_key: "_elixir_jobs_key",
  session_secret: "X7$2(!C!7!RO6F9QT0L=QZJ3P3$T=1C)1GC61R+53F)2V@ET&H)IQ=@*S)E3)OUL7(U7VU300%1"

config :phoenix, :code_reloader,
  enabled: true

config :logger, :console,
  level: :debug


config :hound, driver: "chrome_driver"
