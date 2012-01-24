class BeansController < ApplicationController
  load_and_authorize_resource

  def new
    if params[:farm_id]
      @farm = Farm.find(params[:farm_id])
    end
    if params[:batch_id]
      @batch = Batch.find(params[:batch_id])
    end
    if params[:roast_id]
      @roast = Roast.find(params[:roast_id])
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @bean }
    end
  end

  def edit
    @farm = @bean.farm
  end
  
  def create
    if params[:batch_id]
      @batch = Batch.find(params[:batch_id])
    end
    if params[:roast_id]
      @roast = Roast.find(params[:roast_id])
    end
    @farm = @bean.farm
    respond_to do |format|
      if @bean.save
        if @batch
          format.html { redirect_to new_blend_path(:bean_id => @bean.id, :batch_id => @batch.id, :roast_id => @roast.id), :notice => 'Bean was successfully created.' }
        else
          format.html { redirect_to @bean.farm, :notice => 'Bean was successfully created.' }
          format.json { render :json => @bean, :status => :created, :location => @bean }
        end
      else
        format.html { render :action => "new" }
        format.json { render :json => @bean.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bean.update_attributes(params[:bean])
        format.html { redirect_to @bean.farm, :notice => 'Bean was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @bean.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @bean.destroy
    respond_to do |format|
      format.html { redirect_to @bean.farm(:farm_id => @bean.farm_id) }
      format.json { head :ok }
    end
  end
end