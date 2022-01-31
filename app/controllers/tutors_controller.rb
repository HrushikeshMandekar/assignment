class TutorsController < ApplicationController

  def new
    @tutor = Tutor.new
  end

  def create
    @tutor = Tutor.new(tutor_params)
    if @tutor.save
      flash[:notice] = "Course was created successfully."
      redirect_to courses_path
    else
      render 'new'
    end
  end
  
  def index
    @tutors = Tutor.all
  end

  private

  def tutor_params
    params.require(:tutor).permit(:tutor_name, :course_id)
  end


end
