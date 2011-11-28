class BatchesController < ApplicationController
  load_and_authorize_resource

  def show
    @roast = @batch.roast
    @blends = Blend.where(:batch_id => @batch.id)
    @checks = Check.where(:batch_id => @batch.id)
    @roastery = @batch.roast.roastery
    @check = Check.new    
    
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @batch }
    end
  end

  def create
    @batch.user_id = current_user.id
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

  def destroy
    @batch.destroy
    @roast = @batch.roast
    

    respond_to do |format|
      format.html { redirect_to @roast }
      format.json { head :ok }
    end
  end
end
