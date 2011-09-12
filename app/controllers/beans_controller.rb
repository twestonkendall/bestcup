class BeansController < ApplicationController
  # GET /beans/1
  # GET /beans/1.json
  def show
    @bean = Bean.find(params[:id])
    @farm = @bean.farm
    @blends = Blend.where(:bean_id => @bean.id)
    
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @bean }
    end
  end

  # GET /beans/new
  # GET /beans/new.json
  def new
    @bean = Bean.new
    @farm = Farm.find(params[:farm_id])
    if params[:roast_id]
      @roast = Roast.find(params[:roast_id])
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @bean }
    end
  end

  # GET /beans/1/edit
  def edit
    @bean = Bean.find(params[:id])
    @farm = @bean.farm
    
  end

  # POST /beans
  # POST /beans.json
  def create
    @bean = Bean.new(params[:bean])    
    if params[:roast_id]
      @roast = Roast.find(params[:roast_id])
    end

    respond_to do |format|
      if @bean.save
        if @roast
          format.html { redirect_to new_blend_path(:bean_id => @bean.id, :roast_id => @roast.id, :roastery_id => @roast.roastery), :notice => 'Bean was successfully created.' }
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

  # PUT /beans/1
  # PUT /beans/1.json
  def update
    @bean = Bean.find(params[:id])

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

  # DELETE /beans/1
  # DELETE /beans/1.json
  def destroy
    @bean = Bean.find(params[:id])
    @bean.destroy

    respond_to do |format|
      format.html { redirect_to @bean.farm(:farm_id => @bean.farm_id) }
      format.json { head :ok }
    end
  end
  
  
end


