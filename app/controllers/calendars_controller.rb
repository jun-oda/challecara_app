class CalendarsController < ApplicationController
  before_action :authenticate_user!
    def index
      @group = Group.find(params[:group_id])
      @calendars = Calendar.where(group_id: params[:group_id])
    end
  
    def new
      @calendar = Calendar.new
    end
  
    def create
      Calendar.create(create_calendar_params)
      redirect_to group_calendars_path
    end
  
    def destroy
      @calendar = Calendar.find(params[:id])
      @calendar.destroy
      redirect_to calendars_path, notice:"削除しました"
    end
  
    def edit
      @calendar = Calendar.find(params[:id])
    end
  
    def update
      @calendar = Calendar.find(params[:id])
      if @calendar.update(update_calendar_params)
        redirect_to calendar_path, notice: "編集しました"
      else
        render 'edit'
      end
    end
  
    private
  
    def create_calendar_params
      params.require(:calendar).permit(:title, :content, :start_time).merge(group_id: params[:group_id])
    end

    def update_calendar_params
      params.require(:calendar).permit(:title, :content, :start_time)
    end
    
end
