require "test_helper"

class ListCoursesTest < ActionDispatch::IntegrationTest

  def setup
    @course = Course.create(course_name: "Maths")
    @course2 = Course.create(course_name: "Programming")
  end

  test "Should show course listing" do
    get "/courses"
    assert_response :success
    assert_match "Maths", response.body
    assert_match "Programming", response.body
  end

end
