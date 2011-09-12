class FarmsController < ApplicationController
  
  # GET /farms
  # GET /farms.json
  def index
    @farms = Farm.all
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @farms }
    end
  end

  # GET /farms/1
  # GET /farms/1.json
  def show
    @farm = Farm.find(params[:id])
    @beans = Bean.where(:farm_id => @farm.id)
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @farm }
    end
  end

  # GET /farms/new
  # GET /farms/new.json
  def new
    @farm = Farm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @farm }
    end
  end

  # GET /farms/1/edit
  def edit
    @farm = Farm.find(params[:id])
  end

  # POST /farms
  # POST /farms.json
  def create
    @farm = Farm.new(params[:farm])
    if params[:roast_id]
      @roast = Roast.find(params[:roast_id])
    end

    respond_to do |format|
      if @farm.save
        if @roast
          format.html { redirect_to new_bean_path(:roast_id => @roast.id, :farm_id => @farm.id), :notice => 'Farm was successfully created.' }
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

  # PUT /farms/1
  # PUT /farms/1.json
  def update
    @farm = Farm.find(params[:id])

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

  # DELETE /farms/1
  # DELETE /farms/1.json
  def destroy
    @farm = Farm.find(params[:id])
    @farm.destroy

    respond_to do |format|
      format.html { redirect_to farms_url }
      format.json { head :ok }
    end
  end
  
  def select
    @farms = Farm.all
    @roast = Roast.find(params[:roast_id])
  end
end
