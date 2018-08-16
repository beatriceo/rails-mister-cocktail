Ingredient.destroy_all
Review.destroy_all

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

  cocktail = cocktails.sample
  cocktail_name = cocktail["strDrink"]
  cocktail_image_url = cocktail["strDrinkThumb"]
  cocktail_db = Cocktail.create(name: cocktail_name, image_url: cocktail_image_url)

  rand(1..5).times do
    Review.create(rating: rand(0..5), content: Faker::RickAndMorty.quote, cocktail: cocktail_db)
  end

  dose = Dose.create(
    description: "#{rand(1..10)} cl",
    ingredient: ingredient_db,
    cocktail: cocktail_db
  )
end


