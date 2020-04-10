class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

  if @dose.save
    redirect_to cocktail_path(@cocktail)
    # , notice: 'A new dose was created.'
  else
    @review = Review.new
    render "cocktails/new"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    # why dose.cocktail?
    redirect_to cocktail_path(@dose.cocktail)
    # , notice: 'Your dose was successfully destroyed.'
  end

  private

  def dose_params
    #why ingredient_id?
      params.require(:dose).permit(:description, :ingredient_id)
    end
  end
