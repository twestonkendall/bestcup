class BlendsController < ApplicationController

  # GET /blends/new
  # GET /blends/new.json
  def new
    @blend = Blend.new
    @roast = Roast.find(params[:roast_id])
    @roastery = Roastery.find(params[:roastery_id])
    if params[:bean_id]
      @blend.bean = Bean.find(params[:bean_id])
    end
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @blend }
    end
  end

  # GET /blends/1/edit
  def edit
    @blend = Blend.find(params[:id])
    @roast = @blend.roast
    
  end

  # POST /blends
  # POST /blends.json
  def create
    @blend = Blend.new(params[:blend])
    @roast = @blend.roast
    @roastery = @roast.roastery
    

    respond_to do |format|
      if @blend.save
        format.html { redirect_to @roast }
        format.json { render :json => @blend, :status => :created, :location => @blend }
      else
        format.html { render :action => "new" }
        format.json { render :json => @blend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /blends/1
  # PUT /blends/1.json
  def update
    @blend = Blend.find(params[:id])

    respond_to do |format|
      if @blend.update_attributes(params[:blend])
        format.html { redirect_to @blend.roast }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @blend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /blends/1
  # DELETE /blends/1.json
  def destroy
    @blend = Blend.find(params[:id])
    @blend.destroy

    respond_to do |format|
      format.html { redirect_to @blend.roast }
      format.json { head :ok }
    end
  end

end
