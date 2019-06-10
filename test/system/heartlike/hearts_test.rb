require "application_system_test_case"

module Heartlike
  class HeartsTest < ApplicationSystemTestCase
    setup do
      @heart = heartlike_hearts(:one)
    end

    test "visiting the index" do
      visit hearts_url
      assert_selector "h1", text: "Hearts"
    end

    test "creating a Heart" do
      visit hearts_url
      click_on "New Heart"

      click_on "Create Heart"

      assert_text "Heart was successfully created"
      click_on "Back"
    end

    test "updating a Heart" do
      visit hearts_url
      click_on "Edit", match: :first

      click_on "Update Heart"

      assert_text "Heart was successfully updated"
      click_on "Back"
    end

    test "destroying a Heart" do
      visit hearts_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Heart was successfully destroyed"
    end
  end
end
