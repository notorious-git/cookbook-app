json.array! @recipes.each do |recipe|
  json.id recipe.id
  json.ingredients recipe.ingredients
  json.directions recipe.directions
  json.image_url recipe.image_url
  json.title recipe.title
  json.prep_time recipe.prep_time
  json.chef recipe.chef
end
