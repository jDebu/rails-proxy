Post.destroy_all
Post.create!([
  { title: "Primer Post", body: "Este es el contenido del primer post." },
  { title: "Segundo Post", body: "Este es el contenido del segundo post." },
  { title: "Tercer Post", body: "Este es el contenido del tercer post." }
])

puts "Se han creado #{Post.count} posts."