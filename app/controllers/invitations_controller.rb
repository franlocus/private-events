class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new(invitation_params)

    if @invitation.save
      redirect_to root_path, notice: 'Yay! You joined the event.'
    else
      render :new, alert: 'Error, the invitation was not created'       
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:user_id, :event_id)
  end
end