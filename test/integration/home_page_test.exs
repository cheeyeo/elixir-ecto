defmodule Integration.HomePageTest do
  use ExUnit.Case
  use Hound.Helpers

  hound_session

  test "The home page has Elixir Jobs as its title", meta do
    navigate_to("http://localhost:4001/")
    assert page_title() == "Elixir Jobs"
  end
end
