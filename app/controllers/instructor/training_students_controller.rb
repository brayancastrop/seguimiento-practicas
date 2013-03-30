class Instructor::TrainingStudentsController < InstructorController
   def index
    @instructor = current_instructor
    @training = @instructor.trainings.find params[:training_id]
    @training_students = @training.training_students
    respond_with @trainings_students
  end

  def show
    @instructor = current_instructor
    @training = @instructor.trainings.find params[:training_id]
    @training_student = @training.training_students.find params[:id]
    respond_with @trainings_student
  end
end
