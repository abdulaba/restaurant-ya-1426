require "open-uri"

# Borrado de datos
puts "Borrando datos de las tablas"
User.destroy_all
Category.destroy_all


# Creacion de categorias
puts "Creando categorias"
vegana = Category.create!(name: "Vegana")
vegetariana = Category.create!(name: "Vegetariana")
china = Category.create!(name: "China")
japonesa = Category.create!(name: "Japonesa")
mexicana = Category.create!(name: "Mexicana")
tradicional = Category.create!(name: "Tradicional")
pescados = Category.create!(name: "Pescados")
mariscos = Category.create!(name: "Mariscos")

puts "### Fin creacion de categorias ###"

# Creacion user
puts "Creando usuario"
usuario1 = User.create!(email: "beyda@gmail.com", password: "123456")

# Agrego foto
file = URI.open("https://avatars.githubusercontent.com/u/144365996?v=4")
usuario1.photo.attach(io: file, filename: "beyda.png", content_type: "image/png")

# Guardo en la tabla users
usuario1.save

# Muestro en pantalla el usuario creado
puts "Se ha creado el usuario: #{usuario1.email}"

# Creacion de restaurante y categoria para un usuario

restaurante1 = Restaurant.create!(name: "La cantina", description: "La mejor comida mexicana y del mundo", address: "Providencia 1350, Providencia, Chile")