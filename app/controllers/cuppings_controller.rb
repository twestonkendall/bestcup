class CuppingsController < ApplicationController
  load_and_authorize_resource

  def index
    @cuppings = Cupping.where(:user_id => current_user.id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @cuppings }
    end
  end

  def show
    @samples = Sample.where(:cupping_id => @cupping.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @cupping }
    end
  end

  def new
    sample = @cupping.samples.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @cupping }
    end
  end

  def edit
  end

  def create
    @user = current_user
    @cupping.user_id = @user.id
    respond_to do |format|
      if @cupping.save
        format.html { redirect_to @cupping }
        format.json { render :json => @cupping, :status => :created, :location => @cupping }
      else
        format.html { render :action => "new" }
        format.json { render :json => @cupping.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cupping.update_attributes(params[:cupping])
        format.html { redirect_to @cupping }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @cupping.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @cupping.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :ok }
    end
  end
end