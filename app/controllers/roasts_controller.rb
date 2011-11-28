class RoastsController < ApplicationController
  load_and_authorize_resource

  def show
    @roastery = @roast.roastery
    @batches = Batch.where(:roast_id => @roast.id)
    @blend = Blend.new
    @batch = Batch.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @roast }
    end
  end

  def new
    if params[:roastery_id]
      @roastery = Roastery.find(params[:roastery_id])
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @roast }
    end
  end

  def edit
    @roastery = @roast.roastery
  end

  def create
    @roastery = @roast.roastery
    respond_to do |format|
      if @roast.save
        format.html { redirect_to @roast, :notice => 'Roast was successfully created.' }
        format.json { render :json => @roast, :status => :created, :location => @roast }
      else
        format.html { render :action => "new" }
        format.json { render :json => @roast.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @roast.update_attributes(params[:roast])
        format.html { redirect_to @roast, :notice => 'Roast was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @roast.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @roast.destroy
    respond_to do |format|
      format.html { redirect_to @roast.roastery(:roastery_id => @roast.roastery) }
      format.json { head :ok }
    end
  end
end
