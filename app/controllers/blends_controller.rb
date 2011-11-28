class BlendsController < ApplicationController
  load_and_authorize_resource

  def new
    @batch = Batch.find(params[:batch_id])
    @roast = Roast.find(params[:roast_id])
    if params[:bean_id]
      @blend.bean = Bean.find(params[:bean_id])
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @blend }
    end
  end

  def edit
    @batch = @blend.batch
    @roast = @batch.roast    
  end

  def create
    @batch = @blend.batch
    @roast = @batch.roast
    respond_to do |format|
      if @blend.save
        format.html { redirect_to @batch }
        format.json { render :json => @blend, :status => :created, :location => @blend }
      else
        format.html { render :action => "new", :roast_id => @roast.id, :batch_id => @batch.id }
        format.json { render :json => @blend.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blend.update_attributes(params[:blend])
        format.html { redirect_to @blend.batch }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @blend.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @blend.destroy
    respond_to do |format|
      format.html { redirect_to @blend.batch }
      format.json { head :ok }
    end
  end
end
