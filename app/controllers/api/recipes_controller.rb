class Api::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all

    search_terms = params[:search]
    if search_terms
      @recipes = @recipes.where("title ILIKE ?", "%#{search_terms}%")
    end

    @recipes = @recipes.order(:id => :asc)

    render "index.json.jbuilder"
  end

  def create
    @recipe = Recipe.new(
      title: params["input_title"],
      chef: params["input_chef"],
      ingredients: params["input_ingredients"],
      directions: params["input_directions"],
      user_id: current_user.id
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

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    render json: {message: "Recipe successfully destroyed!"}
  end
end
