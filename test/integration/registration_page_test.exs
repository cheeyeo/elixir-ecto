defmodule Integration.RegistrationPageTest do
  use ExUnit.Case
  use Hound.Helpers

  alias ElixirJobs.Repo
  alias ElixirJobs.Users

  hound_session

  test "The reistration page should have New User as its heading", meta do
    navigate_to("http://localhost:4001/users/new")
    element_id = find_element(:tag, "h1")
    assert visible_text(element_id) == "New User"
  end

  test "The registration page should have a form with fields" do
    navigate_to("http://localhost:4001/users/new")
    parent_element_id = find_element(:tag, "form")
    find_all_within_element(parent_element_id, :name, "username")
    find_all_within_element(parent_element_id, :name, "password")
  end

  test "The registration page should be able to register a user" do
    navigate_to("http://localhost:4001/users/new")
    element_id = find_element(:name, "username")

    fill_field(element_id, "johndoe")
    assert attribute_value(element_id, "value") == "johndoe"

    element_id = find_element(:name, "password")

    fill_field(element_id, "password")
    assert attribute_value(element_id, "value") == "password"

    element_id = find_element(:name, "password_confirm")

    fill_field(element_id, "password")
    assert attribute_value(element_id, "value") == "password"

    element_id = find_element(:class, "btn")

    submit_element(element_id)
    assert current_url == "http://localhost:4001/"

    assert Repo.count(Users) == 1
  end
end
