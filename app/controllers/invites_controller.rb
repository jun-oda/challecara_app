class InvitesController < ApplicationController
  before_action :authenticate_user!
  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.new(invite_params)

    if @invite.save
      flash[:notice] = "招待を送りました"
      redirect_to groups_path
    else
      render :new
    end
  end

  def destroy

  end

  private
  def invite_params
    params.require(:invite).permit(:user_id, :group_id, :email)
  end
end


