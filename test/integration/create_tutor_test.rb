require "test_helper"

class CreateTutorTest < ActionDispatch::IntegrationTest

  def setup
    @course = Course.create(course_name: "Programming")
  end

  test "get new tutor form and create tutor for a course" do
    get "/tutors/new"
    assert_response :success
    assert_difference 'Tutor.count', 1 do
      post tutors_path, params: { tutor: {tutor_name: "HRUSHIKESH", course_id: @course.id }}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Tutor was created", response.body
  end

  test "get new tutor form and reject invalid tutor submission" do
    get "/tutors/new"
    assert_response :success
    assert_no_difference 'Tutor.count' do
      post tutors_path, params: { tutor: {tutor_name: " "}}  
    end
    assert_match "errors", response.body
    assert_match "Course", response.body
    assert_match "Tutor name", response.body
  end

end
