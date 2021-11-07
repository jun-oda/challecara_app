class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = Group.all.order(updated_at: :desc)
  end

  def show
    @group = Group.find_by(id: params[:id])

    if !@group.users.include?(current_user)
      @group.users << current_user
      flash[:notice] = "グループに加入しました"
      render groups_path
    end
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    if Group.create(group_params)
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
