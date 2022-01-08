class AttendancesController < ApplicationController
  def new
  end

  def create
    @attendance = Attendance.new(attendance_params)

    if @attendance.save
      redirect_to root_path, notice: 'attendance created successfully'
    else
      render :new, alert: 'Error, the attendance was not created'       
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:attended_event_id, :attendee_id)
  end
end
