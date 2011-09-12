class CuppingDefectsController < ApplicationController
  
  def new
    @cupping_defect = CuppingDefect.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @cupping_defect = CuppingDefect.new(params[:cupping_defect])
    @cupping_defect.score = @cupping_defect.number_of_cups * @cupping_defect.intensity
    @sample = @cupping_defect.sample
    @cupping = @sample.cupping
    @cupping_total_score = @sample.cupping_total_scores.last

    respond_to do |format|
      if @cupping_defect.save
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
    @cupping_defect = CuppingDefect.find(params[:id])
    @cupping_defect.destroy
    @sample = @cupping_defect.sample
    @cupping = @sample.cupping
    @cupping_total_score = @sample.cupping_total_scores.last
    
    respond_to do |format|
      format.html { redirect_to totalupdate_path(:id => @cupping_total_score.id) }
    end
  end
end
