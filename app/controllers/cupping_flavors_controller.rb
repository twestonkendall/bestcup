class CuppingFlavorsController < ApplicationController
  def index
    @sample = Sample.find(params[:sample_id])
    @cupping = @sample.cupping
    @cupping_flavors = CuppingFlavor.where(:sample_id => @sample.id)    
    @cupping_total_score = @sample.cupping_total_scores.last

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @farms }
    end
  end

  def new
    @cupping_flavor = CuppingFlavor.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  def create
    @cupping_flavor = CuppingFlavor.new(params[:cupping_flavor])
    @sample = @cupping_flavor.sample
    @cupping = @sample.cupping
    @cupping_total_score = @sample.cupping_total_scores.last

    respond_to do |format|
      if @cupping_flavor.save
        if @cupping_total_score.present?
          format.html { redirect_to totalupdate_path(:id => @cupping_total_score.id) }
        else
          format.html { redirect_to totalcreate_path(:sample_id => @sample.id) }
        end
      else
        format.html { redirect_to @cupping, :notice => 'You have to fill in at least one field.' }
      end
    end
  end

  def destroy
    @cupping_flavor = CuppingFlavor.find(params[:id])
    @cupping_flavor.destroy
    @cupping = @cupping_flavor.sample.cupping

    respond_to do |format|
      format.html { redirect_to cupping_flavors_path(:sample_id => @cupping_flavor.sample.id) }
      format.json { head :ok }
    end
  end
end
