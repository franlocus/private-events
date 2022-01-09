class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new(params_with_username_to_id)

    if @invitation.save
      redirect_to root_path, notice: 'Yay! You joined the event.'
    else
      redirect_to root_path, alert: 'Error, the invitation was not sent'
    end
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy

    redirect_to root_path, notice: 'You no longer attendee the event.'
  end

  private

  def invitation_params
    params.require(:invitation).permit(:event_id, :user_id)
  end

  def find_username_id(username)
    User.find_by('username = ?', username).id if User.exists?(['username LIKE ?', username])
  end

  def params_with_username_to_id
    parameters = invitation_params
    parameters['user_id'] = find_username_id(parameters['user_id'])
    parameters
  end
end
