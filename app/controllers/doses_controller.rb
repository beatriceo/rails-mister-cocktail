class DosesController < ApplicationController

  before_action :find_dose, only: [ :destroy ]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(cocktail: @cocktail)
  end

  def create
    dose = Dose.new(dose_params)
    cocktail = Cocktail.find(params[:cocktail_id])
    dose.cocktail = cocktail
    dose.save
    redirect_to cocktail_path(cocktail)
  end

  def destroy
    cocktail = Cocktail.find(@dose.cocktail_id)
    @dose.destroy
    redirect_to cocktail_path(cocktail)
  end

  private

  def find_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
