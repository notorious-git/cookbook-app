class Api::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render "index.json.jbuilder"
  end

  def create
    @recipe = Recipe.new(
      title: params["input_title"],
      chef: params["input_chef"],
      ingredients: params["input_ingredients"],
      directions: params["input_directions"]
    )
    @recipe.save
    render "show.json.jbuilder"
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.title = params["input_title"] || @recipe.title
    @recipe.chef = params["input_chef"] || @recipe.chef
    @recipe.ingredients = params["input_ingredients"] || @recipe.ingredients
    @recipe.directions = params["input_directions"] || @recipe.directions
    @recipe.save
    render "show.json.jbuilder"
  end
end
