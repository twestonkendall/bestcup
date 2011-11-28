class ProducerAdminsController < ApplicationController
  load_and_authorize_resource  

  def index
    @producer_admins = ProducerAdmin.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @producer_admins }
    end
  end

  def create
    @producer_admin = ProducerAdmin.new(params[:producer_admin])
    respond_to do |format|
      if @producer_admin.save
        format.html { redirect_to @producer_admin.farm, :notice => 'Producer admin was successfully created.' }
      else
        format.html { redirect_to @producer_admin.farm }
      end
    end
  end

  def destroy
    @producer_admin = ProducerAdmin.find(params[:id])
    @producer_admin.destroy
    respond_to do |format|
      format.html { redirect_to @producer_admin.farm }
      format.json { head :ok }
    end
  end
end
