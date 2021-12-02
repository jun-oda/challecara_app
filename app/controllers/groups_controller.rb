class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = Group.all.order(updated_at: :desc)
    @calendars = Calendar.all
    @invites = Invite.where(email: current_user.email)#招待された人を特定
  end

  def show
    @group = Group.find(params[:id])

    if !@group.users.include?(current_user)
      @group.users << current_user
      flash[:notice] = "グループに参加しました"
      redirect_to groups_path
    else
      redirect_to group_calendars_path(group_id: @group)
    end
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      @group.users << current_user
      redirect_to groups_path, notice: 'グループを作成しました'
    else
      flash[:alert] = "グループ名を記入してください"
      render :new
    end
  end

  def destroy
    @group = Group.find(params[:id])
    #current_userは、@group.usersから消されるという記述。
    @group.users.delete(current_user)
    flash[:notice] = "退会しました"
    redirect_to groups_path
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path, notice: "編集しました"
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
