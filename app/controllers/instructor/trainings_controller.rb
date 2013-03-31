class Instructor::TrainingsController < InstructorController
  def index
    @instructor = current_instructor
    @trainings = @instructor.trainings.page(params[:page]).per(params[:limit])
    respond_with @trainings
  end

  def show
    @instructor = current_instructor
    @training = @instructor.trainings.find params[:id]
    respond_with @training
  end
end
