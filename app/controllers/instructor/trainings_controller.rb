class Instructor::TrainingsController < InstructorController
  respond_to :xls, only: [:students]
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

  def students
    @instructor = current_instructor
    @training = @instructor.trainings.find params[:id]
    respond_with @training do |format|
      format.any(:html, :json) do
        @training_students = @training.training_students.page(params[:page]).per(params[:limit]).includes(:student, :contract => :company)
      end
      format.xls do
        @training_students = @training.training_students.includes(:student, :contract => :company)    
      end
    end
  end
end
