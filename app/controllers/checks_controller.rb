class ChecksController < ApplicationController
  load_and_authorize_resource

  def edit
    @batch = @check.batch
  end

  def create
    @batch = @check.batch
    @checks = Check.where(:batch_id => @batch.id)
    respond_to do |format|
      if @check.save
        format.html { redirect_to @check.batch, :notice => 'Check was successfully created.'}
        format.js {@checks}
      else
        format.html { redirect_to @check.batch, :alert => 'You didnt add any information.' }
      end
    end
  end

  def update
    respond_to do |format|
      if @check.update_attributes(params[:check])
        format.html { redirect_to @check.batch, :notice => 'Check was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @check.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @check.destroy
    respond_to do |format|
      format.html { redirect_to @check.batch }
      format.json { head :ok }
    end
  end
end
