class RoasteriesController < ApplicationController
  # GET /roasteries
  # GET /roasteries.json
  def index
    @roasteries = Roastery.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @roasteries }
    end
  end

  # GET /roasteries/1
  # GET /roasteries/1.json
  def show
    @roastery = Roastery.find(params[:id])
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

  # GET /roasteries/new
  # GET /roasteries/new.json
  def new
    @roastery = Roastery.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @roastery }
    end
  end

  # GET /roasteries/1/edit
  def edit
    @roastery = Roastery.find(params[:id])
  end

  # POST /roasteries
  # POST /roasteries.json
  def create
    @roastery = Roastery.new(params[:roastery])
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

  # PUT /roasteries/1
  # PUT /roasteries/1.json
  def update
    @roastery = Roastery.find(params[:id])

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

  # DELETE /roasteries/1
  # DELETE /roasteries/1.json
  def destroy
    @roastery = Roastery.find(params[:id])
    @roastery.destroy

    respond_to do |format|
      format.html { redirect_to roasteries_url }
      format.json { head :ok }
    end
  end
end
