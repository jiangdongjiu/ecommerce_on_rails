require 'open-uri'

OrderDetail.delete_all
Product.delete_all
# Category.delete_all
Order.delete_all
Customer.delete_all
Province.delete_all
AdminUser.delete_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# categories = ["Meat and Veggies", "Easy and Fast", "Family Friendly", "Vegetarian"]
def random_category()
  ["Meat and Veggies", "Easy and Fast", "Family Friendly", "Vegetarian"].sample
end

# categories.each do |category|
#   Category.create(name: category)
# end

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
  recipe_entry = Product.create(name: recipe["title"],
                          price: Faker::Commerce.price,
                          description: "Ingredients: " + recipe["ingredients"],
                          stock: 100,
                          category: Category.find_by(name: random_category()),
                          image_url: recipe["thumbnail"])
  if recipe["thumbnail"].present?
    downloaded_image = URI.open("#{recipe["thumbnail"]}")
  else
    downloaded_image = URI.open("http://img.recipepuppy.com/9.jpg")
  end

  if downloaded_image
    recipe_entry.image.attach(io: downloaded_image, filename: "#{recipe["title"]}.jpg")
  end
  # sleep(1)
end