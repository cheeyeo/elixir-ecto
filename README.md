## Elixir jobs web application

Example tutorial on creating a simple jobs site using phoenix and ecto

## Setup

```
mix deps.get
mix compile

mix phoenix.start
```

## Postgresql database:

The database uses the default user of elixir_user and password of elixir
for both dev and test and can be changed to suit within lib/elixir_jobs/repo.ex

```
psql -U elixir_user -W template1
```

## To run the tests:

Before running the integration tests you need chromedriver installed first and
running in a separate window:

```
chromedriver
```

Then:

```
mix test
```
