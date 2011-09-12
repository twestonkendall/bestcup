class CuppingTotalScoresController < ApplicationController

  def create
    @cupping_total_score = CuppingTotalScore.new
    
    @sample = Sample.find(params[:sample_id])
    @cupping_total_score.sample_id = @sample.id
    @cupping = Cupping.find(@sample.cupping_id)
    @cupping_total_score.score =  @sample.cupping_acidities.average(:score).to_i +
                                  @sample.cupping_after_tastes.average(:score).to_i +
                                  @sample.cupping_balances.average(:score).to_i +
                                  @sample.cupping_break_aromas.average(:score).to_i +
                                  @sample.cupping_clean_cups.average(:score).to_i +
                                  @sample.cupping_crust_aromas.average(:score).to_i -
                                  @sample.cupping_defects.average(:score).to_i +
                                  @sample.cupping_dry_fragrances.average(:score).to_i +
                                  @sample.cupping_flavors.average(:score).to_i +
                                  @sample.cupping_mouthfeels.average(:score).to_i +
                                  @sample.cupping_overalls.average(:score).to_i +
                                  @sample.cupping_sweetnesses.average(:score).to_i +
                                  @sample.cupping_uniformities.average(:score).to_i

    respond_to do |format|
      if @cupping_total_score.save
          format.html { redirect_to @cupping }
        else
          format.html { redirect_to @cupping }
      end
    end
  end


  def update
    @cupping_total_score = CuppingTotalScore.find(params[:id])
    
    @sample = @cupping_total_score.sample
    @cupping_total_score.sample_id = @sample.id
    @cupping = Cupping.find(@sample.cupping_id)
    @cupping_total_score.score =  @sample.cupping_acidities.average(:score).to_i +
                                  @sample.cupping_after_tastes.average(:score).to_i +
                                  @sample.cupping_balances.average(:score).to_i +
                                  @sample.cupping_break_aromas.average(:score).to_i +
                                  @sample.cupping_clean_cups.average(:score).to_i +
                                  @sample.cupping_crust_aromas.average(:score).to_i -
                                  @sample.cupping_defects.average(:score).to_i +
                                  @sample.cupping_dry_fragrances.average(:score).to_i +
                                  @sample.cupping_flavors.average(:score).to_i +
                                  @sample.cupping_mouthfeels.average(:score).to_i +
                                  @sample.cupping_overalls.average(:score).to_i +
                                  @sample.cupping_sweetnesses.average(:score).to_i +
                                  @sample.cupping_uniformities.average(:score).to_i

    respond_to do |format|
      if @cupping_total_score.update_attributes(params[:cupping_total_score])
        format.html { redirect_to @cupping }
      end
    end
  end

end
