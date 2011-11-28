class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  def edit
    @roasterFor = Roaster.where(:user_id => @user.id)
    @unverifyed = RoasteryAdmin.where(:user_id => @user.id)
    @radminFor = @unverifyed.where(:verified => true)
  end

  def create
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to root_url, :notice => 'You are now logged in.' }
        format.json { render :json => root_url, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if current_user.admin?
        if @user.update_attributes(params[:user])
          format.html { redirect_to users_url, :notice => 'User was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render :action => "edit" }
        end
      else
        if @user.update_attributes(params[:user])
          format.html { redirect_to root_url, :notice => 'User was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render :action => "edit" }
        end
      end
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to root_url, :notice => 'Account destroyed.' }
      format.json { head :ok }
    end
  end
end
