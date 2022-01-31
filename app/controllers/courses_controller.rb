class CoursesController < ApplicationController

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = "Course was created successfully."
      redirect_to new_tutor_path
    else
      render 'new'
    end
  end
  
  def index
    @courses = Course.all
  end

  private

  def course_params
    params.require(:course).permit(:course_name)
  end

end