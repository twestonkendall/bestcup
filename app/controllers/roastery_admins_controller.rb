class RoasteryAdminsController < ApplicationController
  
  
  # GET /roastery_admins
  # GET /roastery_admins.json
  def index
    @roastery_admins = RoasteryAdmin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @roastery_admins }
    end
  end

  # GET /roastery_admins/1
  # GET /roastery_admins/1.json
  def show
    @roastery_admin = RoasteryAdmin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @roastery_admin }
    end
  end

  # GET /roastery_admins/new
  # GET /roastery_admins/new.json
  def new
    @roastery_admin = RoasteryAdmin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @roastery_admin }
    end
  end

  # POST /roastery_admins
  # POST /roastery_admins.json
  def create
    @roastery_admin = RoasteryAdmin.new(params[:roastery_admin])
    @roastery_admin.verified = true
    @roastery = @roastery_admin.roastery
    
    respond_to do |format|
      if @roastery_admin.save
        format.html { redirect_to @roastery, :notice => 'Roastery admin was added.' }
        format.json { render :json => @roastery, :status => :created, :location => @roastery_admin }
      else
        format.html { redirect_to @roastery }
        format.json { render :json => @roastery_admin.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /roastery_admins/1
  # DELETE /roastery_admins/1.json
  def destroy
    @roastery_admin = RoasteryAdmin.find(params[:id])
    @roastery_admin.destroy
    @roastery = @roastery_admin.roastery
    

    respond_to do |format|
      format.html { redirect_to @roastery }
      format.json { head :ok }
    end
  end
end
