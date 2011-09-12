class CuppingCleanCupsController < ApplicationController

  def new
    @cupping_clean_cup = CuppingCleanCup.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @cupping_clean_cup = CuppingCleanCup.new(params[:cupping_clean_cup])
    @sample = @cupping_clean_cup.sample
    @cupping = @sample.cupping
    @cupping_total_score = @sample.cupping_total_scores.last

    respond_to do |format|
      if @cupping_clean_cup.save
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
    @cupping_clean_cup = CuppingCleanCup.find(params[:id])
    @cupping_clean_cup.destroy
    @sample = @cupping_clean_cup.sample
    @cupping = @sample.cupping
    @cupping_total_score = @sample.cupping_total_scores.last
    
    respond_to do |format|
      format.html { redirect_to totalupdate_path(:id => @cupping_total_score.id) }
    end
  end
end
