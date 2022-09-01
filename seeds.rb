puts "🌱 Seeding spices..."

# Seed your database here
Category.create(description: 'Category 1')
Todo.create(description: 'Todo one', category_id: 1)

puts "✅ Done seeding!"
