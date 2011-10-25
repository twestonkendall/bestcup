class CuppingsController < ApplicationController
  # GET /cuppings
  # GET /cuppings.json
  def index
    @cuppings = Cupping.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @cuppings }
    end
  end

  # GET /cuppings/1
  # GET /cuppings/1.json
  def show
    @cupping = Cupping.find(params[:id])
    @samples = Sample.where(:cupping_id => @cupping.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @cupping }
    end
  end

  # GET /cuppings/new
  # GET /cuppings/new.json
  def new
    @cupping = Cupping.new
    sample = @cupping.samples.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @cupping }
    end
  end

  # GET /cuppings/1/edit
  def edit
    @cupping = Cupping.find(params[:id])
  end

  # POST /cuppings
  # POST /cuppings.json
  def create
    @cupping = Cupping.new(params[:cupping])
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

  # PUT /cuppings/1
  # PUT /cuppings/1.json
  def update
    @cupping = Cupping.find(params[:id])

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

  # DELETE /cuppings/1
  # DELETE /cuppings/1.json
  def destroy
    @cupping = Cupping.find(params[:id])
    @cupping.destroy

    respond_to do |format|
      format.html { redirect_to cuppings_url }
      format.json { head :ok }
    end
  end
end
