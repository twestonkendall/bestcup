class CuppingAfterTastesController < ApplicationController
  # GET /cupping_after_tastes
  # GET /cupping_after_tastes.json
  def index
    @sample = Sample.find(params[:sample_id])
    @cupping = @sample.cupping
    @cupping_after_tastes = CuppingAfterTaste.where(:sample_id => @sample.id)
    @cupping_total_score = @sample.cupping_total_scores.last

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @cupping_after_taste = CuppingAfterTaste.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @cupping_after_taste = CuppingAfterTaste.new(params[:cupping_after_taste])
    @sample = @cupping_after_taste.sample
    @cupping = @sample.cupping
    @cupping_total_score = @sample.cupping_total_scores.last

    respond_to do |format|
      if @cupping_after_taste.save
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
    @cupping_after_taste = CuppingAfterTaste.find(params[:id])
    @cupping_after_taste.destroy
    @cupping = @cupping_after_taste.sample.cupping
    

    respond_to do |format|
      format.html { redirect_to cupping_after_tastes_path(:sample_id => @cupping_after_taste.sample.id) }
      format.json { head :ok }
    end
  end
end
