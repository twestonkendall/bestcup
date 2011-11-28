class RoasteriesController < ApplicationController
load_and_authorize_resource

  def index
    @roasteries = Roastery.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @roasteries }
    end
  end

  def show
    @roasts = Roast.where(:roastery_id => @roastery.id)
    @blend = Blend.new
    @roastery_admin = RoasteryAdmin.new
    @roastery_admins = RoasteryAdmin.where(:roastery_id => @roastery.id)
    @roaster = Roaster.new
    @roasters = Roaster.where(:roastery_id => @roastery.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @roastery }
    end
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @roastery }
    end
  end

  def edit
  end

  def create
    @user = current_user
    respond_to do |format|
      if @roastery.save
        @roastery_admin = RoasteryAdmin.new
        @roastery_admin.user_id = @user.id
        @roastery_admin.roastery_id = @roastery.id
        @roastery_admin.save
        format.html { redirect_to @roastery, :notice => 'Roastery was successfully created.' }
        format.json { render :json => @roastery, :status => :created, :location => @roastery }
      else
        format.html { render :action => "new" }
        format.json { render :json => @roastery.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @roastery.update_attributes(params[:roastery])
        format.html { redirect_to @roastery, :notice => 'Roastery was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @roastery.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @roastery.destroy
    respond_to do |format|
      format.html { redirect_to roasteries_url }
      format.json { head :ok }
    end
  end
end
