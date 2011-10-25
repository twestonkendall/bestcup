class CuppingBreakAromasController < ApplicationController
 
  def new
    @cupping_break_aroma = CuppingBreakAroma.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end
 
  def create
    @cupping_break_aroma = CuppingBreakAroma.new(params[:cupping_break_aroma])
    @sample = @cupping_break_aroma.sample
    @cupping = @sample.cupping
    @cupping_total_score = @sample.cupping_total_scores.last

    respond_to do |format|
      if @cupping_break_aroma.save
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
          format.js {@cupping_break_aroma}
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
          format.js {@cupping_break_aroma}
        end
      else
        format.html { redirect_to @cupping, :notice => 'You missed a required field.' }
        format.js {@cupping_break_aroma}
      end
    end
  end

  def destroy
    @cupping_break_aroma = CuppingBreakAroma.find(params[:id])
    @cupping_break_aroma.destroy
    @sample = @cupping_break_aroma.sample
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
      format.js {@cupping_break_aroma}
    end
  end
end
