AdminUser.delete_all
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

def api_fetch(url)
  JSON.parse(URI.open(url).read)
end

def recipe_url(page)
  "http://www.recipepuppy.com/api/?p=#{page}"
end

recipes = []
page_numbers = 1..10
page_numbers.each do |page|
  recipe_page = api_fetch(recipe_url(page))
  recipes += recipe_page["results"]
end

recipes.each do |recipe|
  Product.create(name: , price: , description: , stock: , category:, image_url: )
end