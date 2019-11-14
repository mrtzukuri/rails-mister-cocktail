class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    set_cocktail
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    set_cocktail
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params["id"])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private
  def dose_params
    params.require(:dose).permit!
  end

  def set_cocktail
    @dose.cocktail = @cocktail
  end
end
