class ExperiencesController < ApplicationController
  def create
    @spot = Spot.find(params[:spot_id])
    @experience = Experience.new(experience_params)
    @experience.spot = @spot
    @experience.user = current_user
    if @experience.save
      redirect_to dashboard_path, notice: "Congrats! Your experience was posted."
    else
      flash.now[:alert] = "Oops, something went wrong."
      render 'spots/show', status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private

  def experience_params
    params.require(:experience).permit(:content, photos: [])
  end
end
