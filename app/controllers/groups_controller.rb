class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = Group.all.order(updated_at: :desc)
  end

  def show
    @group = Group.find(params[:id])

    if !@group.users.include?(current_user)
      @group.users << current_user
      flash[:notice] = "グループに加入しました"
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
      render :new
    end
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
