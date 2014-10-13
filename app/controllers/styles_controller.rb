class StylesController < ApplicationController

  def edit
    @style = current_user.style
  end

  def update
    if current_user.style.update(style_params)
      flash[:success] = 'Looks great. Your profile has been updated.'
      redirect_to user_path(current_user)
    else
      flash[:warning] = 'Whoops. Looks like something went wrong.'
      redirect_to user_path(current_user)
    end
  end

  private

  def style_params
    params.require(:style).permit(:background, :card_title, :card_title_hover, :card_background, :heading,
      :send_mantra, :send_mantra_hover, :delete_mantra, :delete_mantra_hover, :create_button, :navbar)
  end

end







