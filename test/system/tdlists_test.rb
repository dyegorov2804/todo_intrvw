require "application_system_test_case"

class TdlistsTest < ApplicationSystemTestCase
  setup do
    @tdlist = tdlists(:one)
  end

  test "visiting the index" do
    visit tdlists_url
    assert_selector "h1", text: "Tdlists"
  end

  test "creating a Tdlist" do
    visit tdlists_url
    click_on "New Tdlist"

    check "Completed" if @tdlist.completed
    fill_in "Description", with: @tdlist.description
    click_on "Create Tdlist"

    assert_text "Tdlist was successfully created"
    click_on "Back"
  end

  test "updating a Tdlist" do
    visit tdlists_url
    click_on "Edit", match: :first

    check "Completed" if @tdlist.completed
    fill_in "Description", with: @tdlist.description
    click_on "Update Tdlist"

    assert_text "Tdlist was successfully updated"
    click_on "Back"
  end

  test "destroying a Tdlist" do
    visit tdlists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tdlist was successfully destroyed"
  end
end
