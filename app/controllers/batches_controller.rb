class BatchesController < ApplicationController
  # GET /batches
  # GET /batches.json
  def index
    @batches = Batch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @batches }
    end
  end

  # GET /batches/1
  # GET /batches/1.json
  def show
    @batch = Batch.find(params[:id])
    @roast = @batch.roast
    @blends = Blend.where(:batch_id => @batch.id)
    @checks = Check.where(:batch_id => @batch.id)
    
    
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @batch }
    end
  end

  # GET /batches/new
  # GET /batches/new.json
  def new
    @batch = Batch.new
    @roast = Roast.find(params[:roast_id])
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @batch }
    end
  end

  # GET /batches/1/edit
  def edit
    @batch = Batch.find(params[:id])
  end

  # POST /batches
  # POST /batches.json
  def create
    @batch = Batch.new(params[:batch])
    @roast = @batch.roast
    @numOfBatchesToday = Batch.find(:all, :conditions => { :roast_id => @roast.id, :roasted_on => @batch.roasted_on }).length
    @batch.batch_number = @numOfBatchesToday.to_i + 1

    respond_to do |format|
      if @batch.save
        format.html { redirect_to @roast }
        format.json { render :json => @roast, :status => :created, :location => @batch }
      else
        format.html { render :action => "new" }
        format.json { render :json => @roast.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /batches/1
  # PUT /batches/1.json
  def update
    @batch = Batch.find(params[:id])

    respond_to do |format|
      if @batch.update_attributes(params[:batch])
        format.html { redirect_to @batch, :notice => 'Batch was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @batch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1
  # DELETE /batches/1.json
  def destroy
    @batch = Batch.find(params[:id])
    @batch.destroy
    @roast = @batch.roast
    

    respond_to do |format|
      format.html { redirect_to @roast }
      format.json { head :ok }
    end
  end
end
