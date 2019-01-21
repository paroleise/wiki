require "application_system_test_case"

class MachinesTest < ApplicationSystemTestCase
  setup do
    @machine = machines(:one)
  end

  test "visiting the index" do
    visit machines_url
    assert_selector "h1", text: "Machines"
  end

  test "creating a Machine" do
    visit machines_url
    click_on "New Machine"

    fill_in "Annotation", with: @machine.annotation
    fill_in "Conclusion", with: @machine.conclusion
    fill_in "Evaluation point", with: @machine.evaluation_point
    fill_in "Feature", with: @machine.feature
    fill_in "Introduction date", with: @machine.introduction_date
    fill_in "Introduction season", with: @machine.introduction_season
    fill_in "Judgment", with: @machine.judgment
    fill_in "Kana", with: @machine.kana
    fill_in "Manufacturer", with: @machine.manufacturer
    fill_in "Name", with: @machine.name
    fill_in "Other", with: @machine.other
    fill_in "Overview", with: @machine.overview
    fill_in "Problem", with: @machine.problem
    fill_in "Pros and cons", with: @machine.pros_and_cons
    fill_in "Spec", with: @machine.spec
    fill_in "Type", with: @machine.type
    click_on "Create Machine"

    assert_text "Machine was successfully created"
    click_on "Back"
  end

  test "updating a Machine" do
    visit machines_url
    click_on "Edit", match: :first

    fill_in "Annotation", with: @machine.annotation
    fill_in "Conclusion", with: @machine.conclusion
    fill_in "Evaluation point", with: @machine.evaluation_point
    fill_in "Feature", with: @machine.feature
    fill_in "Introduction date", with: @machine.introduction_date
    fill_in "Introduction season", with: @machine.introduction_season
    fill_in "Judgment", with: @machine.judgment
    fill_in "Kana", with: @machine.kana
    fill_in "Manufacturer", with: @machine.manufacturer
    fill_in "Name", with: @machine.name
    fill_in "Other", with: @machine.other
    fill_in "Overview", with: @machine.overview
    fill_in "Problem", with: @machine.problem
    fill_in "Pros and cons", with: @machine.pros_and_cons
    fill_in "Spec", with: @machine.spec
    fill_in "Type", with: @machine.type
    click_on "Update Machine"

    assert_text "Machine was successfully updated"
    click_on "Back"
  end

  test "destroying a Machine" do
    visit machines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Machine was successfully destroyed"
  end
end
