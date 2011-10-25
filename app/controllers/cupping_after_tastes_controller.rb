class CuppingAfterTastesController < ApplicationController
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
          format.js {@cupping_after_taste}
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
          format.js {@cupping_after_taste}
        end
      else
        format.html { redirect_to @cupping, :notice => 'You have to fill in at least one field.' }
        format.js {@cupping_after_taste}
      end
    end
  end

  def destroy
    @cupping_after_taste = CuppingAfterTaste.find(params[:id])
    @cupping_after_taste.destroy
    @sample = @cupping_after_taste.sample
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
      format.html { redirect_to cupping_after_tastes_path(:sample_id => @cupping_after_taste.sample.id) }
      format.js {@cupping_after_taste}
    end
  end
end
