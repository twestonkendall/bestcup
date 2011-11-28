class CuppingAciditiesController < ApplicationController
  load_and_authorize_resource

  def create
    @sample = @cupping_acidity.sample
    @cupping = @sample.cupping
    @cupping_total_score = @sample.cupping_total_scores.last
    respond_to do |format|
      if @cupping_acidity.save
        if @cupping_total_score.present?
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
          @cupping_total_score.save
          format.html { redirect_to totalupdate_path(:id => @cupping_total_score.id) }
          format.js {@cupping_acidity}
        else
          @cupping_total_score = CuppingTotalScore.new
          @cupping_total_score.sample_id = @sample.id
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
          @cupping_total_score.save
          format.html { redirect_to totalcreate_path(:sample_id => @sample.id) }
          format.js {@cupping_acidity}
        end
      else
        format.html { redirect_to @cupping, :notice => 'You missed a required field.' }
        format.js {@cupping_acidity}
      end
    end
  end

  def destroy
    # @cupping_acidity = CuppingAcidity.find(params[:id])
    @cupping_acidity.destroy
    @sample = @cupping_acidity.sample
    @cupping = @sample.cupping
    @cupping_total_score = @sample.cupping_total_scores.last
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
    @cupping_total_score.save
    respond_to do |format|
      format.html { redirect_to totalupdate_path(:id => @cupping_total_score.id) }
      format.js {@cupping_acidity}
    end
  end
end
