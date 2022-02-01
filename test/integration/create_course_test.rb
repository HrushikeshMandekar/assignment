require "test_helper"

class CreateCourseTest < ActionDispatch::IntegrationTest
  
  test "get new course form and create course" do 
    get "/courses/new"
    assert_response :success
    assert_difference 'Course.count', 1 do
      post courses_path, params: { course: {course_name: "Graphics"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Course was created successfully.", response.body
  end

  test "get new course form and reject invalid course submission" do
    get "/courses/new"
    assert_response :success
    assert_no_difference 'Course.count' do
      post courses_path, params: {course: {course_name: " "}}
    end
    assert_match "errors", response.body
  end

end
