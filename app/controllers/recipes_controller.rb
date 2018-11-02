class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @recipe = Recipe.new(
      title: params[:form_title],
      chef: params[:form_chef],
      prep_time: params[:form_prep_time],
      ingredients: params[:form_ingredients],
      directions: params[:form_directions],
      image_url: params[:form_image_url],
      user_id: 1
    )
    @recipe.save
    redirect_to "/recipes/#{@recipe.id}"
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    render "show.html.erb"
  end
end
