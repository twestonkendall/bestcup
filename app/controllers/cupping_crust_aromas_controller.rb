class CuppingCrustAromasController < ApplicationController

  def new
    @cupping_crust_aroma = CuppingCrustAroma.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @cupping_crust_aroma = CuppingCrustAroma.new(params[:cupping_crust_aroma])
    @sample = @cupping_crust_aroma.sample
    @cupping = @sample.cupping
    @cupping_total_score = @sample.cupping_total_scores.last

    respond_to do |format|
      if @cupping_crust_aroma.save
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
    @cupping_crust_aroma = CuppingCrustAroma.find(params[:id])
    @cupping_crust_aroma.destroy
    @sample = @cupping_crust_aroma.sample
    @cupping = @sample.cupping
    @cupping_total_score = @sample.cupping_total_scores.last
    
    respond_to do |format|
      format.html { redirect_to totalupdate_path(:id => @cupping_total_score.id) }
    end
  end
end
