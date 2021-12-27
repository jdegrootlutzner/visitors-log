require "application_system_test_case"

class SketchesTest < ApplicationSystemTestCase
  setup do
    @sketch = sketches(:one)
  end

  test "visiting the index" do
    visit sketches_url
    assert_selector "h1", text: "Sketches"
  end

  test "should create sketch" do
    visit sketches_url
    click_on "New sketch"

    fill_in "Artist", with: @sketch.artist
    fill_in "Upvotes", with: @sketch.upvotes
    click_on "Create Sketch"

    assert_text "Sketch was successfully created"
    click_on "Back"
  end

  test "should update Sketch" do
    visit sketch_url(@sketch)
    click_on "Edit this sketch", match: :first

    fill_in "Artist", with: @sketch.artist
    fill_in "Upvotes", with: @sketch.upvotes
    click_on "Update Sketch"

    assert_text "Sketch was successfully updated"
    click_on "Back"
  end

  test "should destroy Sketch" do
    visit sketch_url(@sketch)
    click_on "Destroy this sketch", match: :first

    assert_text "Sketch was successfully destroyed"
  end
end
