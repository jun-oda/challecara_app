def index
  @users = User.all
  @user = User.new   #追記
end

def create
  @user = User.new(user_params)

  respond_to do |format|
    if @user.save
      format.html { redirect_to  users_path, notice: 'User was successfully created.' }
      format.json { render :show, status: :created, location: @user }
    else
      format.html { render :new }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end
