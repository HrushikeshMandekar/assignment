class TutorsController < ApplicationController

  def new
    @tutor = Tutor.new
  end

  def create
    @tutor = Tutor.new(tutor_params)
    if @tutor.save
      flash[:notice] = "Tutor was created and assigned to a course successfully."
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
