class DosesController < ApplicationController
  before_action :find_cocktail, only: [:new, :create, :destroy]

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.new(dose_params)
    @dose.save
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private
  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end

# A user can add a new dose (ingredient/description pair) on an existing cocktail.
# GET "cocktails/42/doses/new"
# POST "cocktails/42/doses"
# A user can delete a dose on an existing cocktail
# DELETE "doses/25"
