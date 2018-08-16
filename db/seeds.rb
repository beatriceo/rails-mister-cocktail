Ingredient.destroy_all

# Get ingredients from the web
ingredient_url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredient_content = open(ingredient_url).read
ingredients = JSON.parse(ingredient_content)["drinks"]

ingredients.each do |ingredient|
  ingredient_name = ingredient["strIngredient1"]
  ingredient_db = Ingredient.create(name: ingredient_name)

  cocktail_url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{URI.encode(ingredient_name)}"
  cocktail_content = open(cocktail_url).read
  cocktails = JSON.parse(cocktail_content)["drinks"]

  cocktail_name = cocktails.sample["strDrink"]
  cocktail_db = Cocktail.create(name: cocktail_name)

  dose = Dose.create(
    description: "#{rand(1..10)} cl",
    ingredient: ingredient_db,
    cocktail: cocktail_db
  )
end


