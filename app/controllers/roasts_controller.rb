class RoastsController < ApplicationController

  # GET /roasts/1
  # GET /roasts/1.json
  def show
    @roast = Roast.find(params[:id])
    @roastery = @roast.roastery
    @blends = Blend.where(:roast_id => @roast.id)
    @checks = Check.where(:roast_id => @roast.id)
    @weight = @blends.sum(:weight)
    
    @blend = Blend.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @roast }
    end
  end

  # GET /roasts/new
  # GET /roasts/new.json
  def new
    @roast = Roast.new
    @roastery = Roastery.find(params[:roastery_id])
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @roast }
    end
  end

  # GET /roasts/1/edit
  def edit
    @roast = Roast.find(params[:id])
    @roastery = @roast.roastery
    
  end

  # POST /roasts
  # POST /roasts.json
  def create
    @roast = Roast.new(params[:roast])

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

  # PUT /roasts/1
  # PUT /roasts/1.json
  def update
    @roast = Roast.find(params[:id])

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

  # DELETE /roasts/1
  # DELETE /roasts/1.json
  def destroy
    @roast = Roast.find(params[:id])
    @roast.destroy

    respond_to do |format|
      format.html { redirect_to @roast.roastery(:roastery_id => @roast.roastery) }
      format.json { head :ok }
    end
  end
end
