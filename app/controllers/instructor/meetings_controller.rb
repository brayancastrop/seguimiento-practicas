class Instructor::MeetingsController < InstructorController
  def index
    @instructor = current_instructor
    @contract = @instructor.contracts.find params[:contract_id]
    @meetings = @contract.meetings.page(params[:page]).per(params[:limit])
    respond_with @meetings
  end

  def new
    @instructor = current_instructor
    @contract = @instructor.contracts.find params[:contract_id]
    @meeting = @contract.meetings.new
    respond_with @meeting
  end

  def create
    @instructor = current_instructor
    @contract = @instructor.contracts.find params[:contract_id]
    @meeting = @contract.meetings.new params[:meeting]
    @meeting.save
    respond_with @meeting, location: instructor_contract_meeting_path(@contract, @meeting)
  end

  def edit
    @instructor = current_instructor
    @contract = @instructor.contracts.find params[:contract_id]
    @meeting = @contract.meetings.find params[:id]
    respond_with @meeting
  end

  def update
    @instructor = current_instructor
    @contract = @instructor.contracts.find params[:contract_id]
    @meeting = @contract.meetings.find params[:id]
    @meeting.update_attributes params[:meeting]
    respond_with @meeting, location: instructor_contract_meeting_path(@contract, @meeting)
  end

  def show
    @instructor = current_instructor
    @contract = @instructor.contracts.find params[:contract_id]
    @meeting = @contract.meetings.find params[:id]
    respond_with @meeting
  end
end
