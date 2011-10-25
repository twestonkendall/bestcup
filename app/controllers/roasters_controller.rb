class RoastersController < ApplicationController
  # GET /roasters
  # GET /roasters.json
  def index
    @roasters = Roaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @roasters }
    end
  end

  # GET /roasters/1
  # GET /roasters/1.json
  def show
    @roaster = Roaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @roaster }
    end
  end

  # GET /roasters/new
  # GET /roasters/new.json
  def new
    @roaster = Roaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @roaster }
    end
  end

  # POST /roasters
  # POST /roasters.json
  def create
    @roaster = Roaster.new(params[:roaster])
    @roastery = @roaster.roastery

    respond_to do |format|
      if @roaster.save
        format.html { redirect_to @roastery, :notice => 'Roaster was successfully created.' }
        format.json { render :json => @roaster, :status => :created, :location => @roaster }
      else
        format.html { render :action => "new" }
        format.json { render :json => @roaster.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /roasters/1
  # DELETE /roasters/1.json
  def destroy
    @roaster = Roaster.find(params[:id])
    @roaster.destroy
    @roastery = @roaster.roastery
    

    respond_to do |format|
      format.html { redirect_to @roastery }
      format.json { head :ok }
    end
  end
end
