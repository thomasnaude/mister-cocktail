class CocktailsController < ApplicationController

  before_action :set_cocktail, only: :show

  def index
    @cocktails = Cocktail.all
  end

  def show

  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_cocktail
    @coktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    # params.require()
  end
end

# A user can see the list of all cocktails
# GET "cocktails"
# A user can see the details of a given cocktail, with the ingredient list
# GET "cocktails/42"
# A user can create a new cocktail.
# GET "cocktails/new"
# POST "cocktails"
