class InstructorController < ApplicationController
  before_filter :authenticate_instructor!
  respond_to :html, :json
  layout "instructor"  
end

