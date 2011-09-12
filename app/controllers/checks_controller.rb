class ChecksController < ApplicationController

  # GET /checks/new
  # GET /checks/new.json
  def new
    @check = Check.new
    @roast = Roast.find(params[:roast_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @check }
    end
  end

  # GET /checks/1/edit
  def edit
    @check = Check.find(params[:id])
    @roast = @check.roast
  end

  # POST /checks
  # POST /checks.json
  def create
    @check = Check.new(params[:check])

    respond_to do |format|
      if @check.save
        format.html { redirect_to @check.roast, :notice => 'Check was successfully created.' }
        format.json { render :json => @check, :status => :created, :location => @check }
      else
        format.html { render :action => "new" }
        format.json { render :json => @check.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /checks/1
  # PUT /checks/1.json
  def update
    @check = Check.find(params[:id])

    respond_to do |format|
      if @check.update_attributes(params[:check])
        format.html { redirect_to @check.roast, :notice => 'Check was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @check.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /checks/1
  # DELETE /checks/1.json
  def destroy
    @check = Check.find(params[:id])
    @check.destroy

    respond_to do |format|
      format.html { redirect_to @check.roast }
      format.json { head :ok }
    end
  end
end
