class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new(invitation_params)

    if @invitation.save
      redirect_to root_path, notice: 'invitation created successfully'
    else
      render :new, alert: 'Error, the invitation was not created'       
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:attended_event_id, :attendee_id)
  end
end
