class CuppingDryFragrancesController < ApplicationController

  def new
    @cupping_dry_fragrance = CuppingDryFragrance.new
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @cupping_dry_fragrance = CuppingDryFragrance.new(params[:cupping_dry_fragrance])
    @sample = @cupping_dry_fragrance.sample
    @cupping = @sample.cupping
    @cupping_total_score = @sample.cupping_total_scores.last
    
    respond_to do |format|
      if @cupping_dry_fragrance.save
        if @cupping_total_score.present?
          format.html { redirect_to totalupdate_path(:id => @cupping_total_score.id) }
        else
          format.html { redirect_to totalcreate_path(:sample_id => @sample.id) }
        end
      else
        format.html { redirect_to @cupping, :notice => 'You missed a required field.' }
      end
    end
  end
  
  def destroy
    @cupping_dry_fragrance = CuppingDryFragrance.find(params[:id])
    @cupping_dry_fragrance.destroy
    @sample = @cupping_dry_fragrance.sample
    @cupping = @sample.cupping
    @cupping_total_score = @sample.cupping_total_scores.last
    
    respond_to do |format|
      format.html { redirect_to totalupdate_path(:id => @cupping_total_score.id) }
    end
  end
end
