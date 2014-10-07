defmodule Integration.LoginPageTest do
  use ExUnit.Case
  use Hound.Helpers

  hound_session

  setup_all do
    ElixirJobs.Router.start
    on_exit &ElixirJobs.Router.stop/0
    :ok
  end

  test "The login page has Login as its heading and a form with fields", meta do
    navigate_to("http://localhost:4001/users/login")
    element_id = find_element(:tag, "h1")
    assert visible_text(element_id) == "Login"

    parent_element_id = find_element(:tag, "form")
    find_all_within_element(parent_element_id, :name, "username")
    find_all_within_element(parent_element_id, :name, "password")
  end

  test "A user should be able to login to the system" do
    ElixirJobs.Users.create("loremipsum","password")

    navigate_to("http://localhost:4001/users/login")
    element_id = find_element(:name, "username")

    fill_field(element_id, "loremipsum")
    assert attribute_value(element_id, "value") == "loremipsum"

    element_id = find_element(:name, "password")

    fill_field(element_id, "password")
    assert attribute_value(element_id, "value") == "password"

    submit_btn = find_element(:class, "btn")

    submit_element(submit_btn)
    assert current_url == "http://localhost:4001/"

    assert element_displayed?({:css, ".alert"}) == true
    assert visible_text({:css, ".alert"}) == "Login succeessful."
  end
end
