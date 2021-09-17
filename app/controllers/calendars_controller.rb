class CalendarsController < ApplicationController
    def index
        @calendars = Calendar.all
      end
    
      def new
        @calendar = Calendar.new
      end
    
      def show
        @calendar = Calendar.find(params[:id])
        @messages = Message.find_by(calendar_id: params[:id])
      end
    
      def create
        Calendar.create(calendar_parameter)
        redirect_to calendars_path
      end
    
      def destroy
        @calendar = Calendar.find(params[:id])
        @calendar.destroy
        redirect_to calendars_path, notice:"削除しました"
      end
    
      def edit
        @calendar = Calendar.find(params[:id])
        @messages = Message.find_by(calendar_id: params[:id])
      end
    
      def update
        @calendar = Calendar.find(params[:id])
        @messages = Message.find_by(calendar_id: params[:id])
        if @calendar.update(calendar_parameter)
          redirect_to calendars_path, notice: "編集しました"
        else
          render 'edit'
        end
      end
    
      private
    
      def calendar_parameter
        params.require(:calendar).permit(:title, :content, :start_time)
      end
    
end
