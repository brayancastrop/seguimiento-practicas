class Instructor::ObservationsController < InstructorController
  def index
    @instructor = current_instructor
    @meeting = @instructor.meetings.find params[:meeting_id]
    @observations = @meeting.observations.page(params[:page]).per(params[:limit])
    respond_with @observations
  end

  def new
    @instructor = current_instructor
    @meeting = @instructor.meetings.find params[:meeting_id]
    @observation = @meeting.observations.new
    respond_with @observation
  end

  def create
    @instructor = current_instructor
    @meeting = @instructor.meetings.find params[:meeting_id]
    @observation = @meeting.observations.new params[:observation]
    @observation.save
    respond_with @observation, location: instructor_meeting_observation_path(@meeting, @observation)
  end

  def edit
    @instructor = current_instructor
    @meeting = @instructor.meetings.find params[:meeting_id]
    @observation = @meeting.observations.find params[:id]
    respond_with @observation
  end

  def update
    @instructor = current_instructor
    @meeting = @instructor.meetings.find params[:meeting_id]
    @observation = @meeting.observations.find params[:id]
    @observation.update_attributes params[:observation]
    respond_with @observation, location: instructor_meeting_observation_path(@meeting, @observation)
  end

  def show
    @instructor = current_instructor
    @meeting = @instructor.meetings.find params[:meeting_id]
    @observation = @meeting.observations.find params[:id]
    respond_with @observation
  end
end
