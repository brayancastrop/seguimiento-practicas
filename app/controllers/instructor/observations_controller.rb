class Instructor::ObservationsController < InstructorController
  before_filter :observation_for_meeting, only: [:new, :create]
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

  private

  def observation_for_meeting
    @instructor = current_instructor
    @meeting = @instructor.meetings.find params[:meeting_id]
    scheduled_at = @meeting.scheduled_at.to_date
    redirect_to instructor_meeting_observations_path(@meeting), alert: "Se ha superado la fecha limite para el ingreso de observaciones" if scheduled_at < Date.today
    redirect_to instructor_meeting_observations_path(@meeting), alert: "El ingreso de observaciones no esta permitido hasta el dia de la visita" if scheduled_at > Date.today
  end
end
