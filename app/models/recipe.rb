class Recipe < ApplicationRecord
  belongs_to :user
  validates :title, presence: true

  def formatted_ingredients
    ingredients_list = []
    ingredients.split(", ").each do |ingredient|
      ingredients_list << ingredient.downcase.tr(".", "")
    end
    return ingredients_list
  end

  def formatted_directions
    directions_list = []
    directions.split(", ").each do |direction|
      directions_list << direction.downcase.tr(".", "")
    end
    return directions_list
  end

  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def friendly_prep_time
    hours = prep_time / 60
    minutes = prep_time % 60
    result = ""
    result += "#{hours} hour(s) " if hours > 0
    result += "#{minutes} minute(s)" if minutes > 0
    return result
  end

  def upper_case_chef
    chef.upcase
  end
end
