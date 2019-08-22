class AttendancesController < ApplicationController
 before_action :find_post 
 

 def create

    if already_liked?
    flash[:notice] = "indraipa iany"
  else
    @event.attendances.create(user_id: current_user.id)
  end
  redirect_to event_path(@event)
  end 
  private  

  def find_post
    @event = Event.find(params[:event_id])
  end


  def already_liked?
  Attendance.where(user_id: current_user.id, event_id:
  params[:event_id]).exists?
end

end
