class Instructor::ContractsController < InstructorController
  def show
    @instructor = current_instructor
    @contract = @instructor.contracts.find params[:id]
    respond_with @contract
  end
end
