class MantrasController < ApplicationController

  def new
    @mantra = Mantra.new
  end

  def create
    @mantra = current_user.mantras.create(mantra_params)
    if @mantra.save
      flash[:success] = 'Nicely done. Your mantra has been saved.'
      redirect_to current_user
    else
      flash[:warning] = 'Whoops, something is missing from your mantra.'
      redirect_to current_user
    end
  end

  def edit
    @mantra = Mantra.find(params[:id])
  end

  def update
    @mantra = Mantra.find(params[:id])
    if @mantra.update(mantra_params)
      flash[:success] = 'Got it, your mantra has been updated.'
      redirect_to current_user
    else
      flash[:warning] = 'Whoops, something is missing. Try again.'
      redirect_to current_user
    end
  end

  def remove_image
    @mantra = Mantra.find(params[:id])
    @mantra.update(image: nil)
    redirect_to current_user
  end

  def destroy
    @mantra = Mantra.find(params[:id])
    if @mantra.update(status: 'Erased')
      flash[:success] = 'All set. The mantra has been removed.'
      redirect_to current_user
    end
  end

  def send_now
    Mantra.find(params[:id]).deliver
    redirect_to current_user
  end

  private

  def mantra_params
    params.require(:mantra).permit(:user_id, :title, :description, :schedule, :image)
  end

end
