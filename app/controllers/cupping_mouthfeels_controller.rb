class CuppingMouthfeelsController < ApplicationController

  def new
    @cupping_mouthfeel = CuppingMouthfeel.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end
 
  def create
    @cupping_mouthfeel = CuppingMouthfeel.new(params[:cupping_mouthfeel])
    @sample = @cupping_mouthfeel.sample
    @cupping = @sample.cupping
    @cupping_total_score = @sample.cupping_total_scores.last

    respond_to do |format|
      if @cupping_mouthfeel.save
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
    @cupping_mouthfeel = CuppingMouthfeel.find(params[:id])
    @cupping_mouthfeel.destroy
    @sample = @cupping_mouthfeel.sample
    @cupping = @sample.cupping
    @cupping_total_score = @sample.cupping_total_scores.last
    
    respond_to do |format|
      format.html { redirect_to totalupdate_path(:id => @cupping_total_score.id) }
    end
  end
end
