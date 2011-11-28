class FarmsController < ApplicationController
  load_and_authorize_resource

  def index
    @farms = Farm.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @farms }
    end
  end

  def show
    @beans = Bean.where(:farm_id => @farm.id)
    @producer_admin = ProducerAdmin.new
    @producer_admins = ProducerAdmin.where(:farm_id => @farm.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @farm }
    end
  end

  def new
    if params[:batch_id]
      @batch = Batch.find(params[:batch_id])
    end
    if params[:roast_id]
      @roast = Roast.find(params[:roast_id])
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @farm }
    end
  end

  def edit
  end

  def create
    if params[:roast_id]
      @roast = Roast.find(params[:roast_id])
    end
    if params[:batch_id]
      @batch = Batch.find(params[:batch_id])
    end
    respond_to do |format|
      if @farm.save
        if @roast
          format.html { redirect_to new_bean_path(:batch_id => @batch.id, :roast_id => @roast.id, :farm_id => @farm.id), :notice => 'Farm was successfully created.' }
        else
        format.html { redirect_to @farm, :notice => 'Farm was successfully created.' }
        format.json { render :json => @farm, :status => :created, :location => @farm }
        end
      else
        format.html { render :action => "new" }
        format.json { render :json => @farm.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @farm.update_attributes(params[:farm])
        format.html { redirect_to @farm, :notice => 'Farm was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @farm.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @farm.destroy
    respond_to do |format|
      format.html { redirect_to farms_url }
      format.json { head :ok }
    end
  end
end
