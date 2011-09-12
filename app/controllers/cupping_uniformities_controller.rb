class CuppingUniformitiesController < ApplicationController

  def new
    @cupping_uniformity = CuppingUniformity.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @cupping_uniformity = CuppingUniformity.new(params[:cupping_uniformity])
    @sample = @cupping_uniformity.sample
    @cupping = @sample.cupping
    @cupping_total_score = @sample.cupping_total_scores.last

    respond_to do |format|
      if @cupping_uniformity.save
        if @cupping_total_score.present?
          format.html { redirect_to totalupdate_path(:id => @cupping_total_score.id) }
        else
          format.html { redirect_to totalcreate_path(:sample_id => @sample.id) }
        end
      else
        format.html { redirect_to @cupping, :notice => 'You cant leave the only field blank.' }
      end
    end
  end

  def destroy
    @cupping_uniformity = CuppingUniformity.find(params[:id])
    @cupping_uniformity.destroy
    @sample = @cupping_uniformity.sample
    @cupping = @sample.cupping
    @cupping_total_score = @sample.cupping_total_scores.last
    
    respond_to do |format|
      format.html { redirect_to totalupdate_path(:id => @cupping_total_score.id) }
    end
  end
end
