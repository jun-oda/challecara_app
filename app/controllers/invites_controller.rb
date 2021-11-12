class InvitesController < ApplicationController
  before_action :authenticate_user!
  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.new(invite_params)

    if @invite.email != current_user.email
      @invite.save
      flash[:notice] = "招待を送りました"
      redirect_to groups_path
    else
      flash[:alert] = "正しいメールアドレスを入力してください"
      render :new
    end
  end

  def destroy
    @invite = Invite.find(params[:id])
    @invite.destroy
    redirect_to group_path(@invite.group_id)
    #redirect_to groups_path
  end

  private
  def invite_params
    params.require(:invite).permit(:user_id, :group_id, :email)
  end
end


