# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

List.destroy_all
seedlists = [{title: "Final Project"},{title: "Chores"},{title: "Stuff that would be nice"}]

seedlists.each do |newlist|
  l = List.new
  l.title = newlist[:title]
  l.save
end

puts "There are now #{List.count} lists in the database"


Category.destroy_all
seedcategories = [{category: "Tasks"},{category: "Manual Labor"},{category: "Cooking"}]

seedcategories.each do |newcategory|
  c = Category.new
  c.category = newcategory[:category]
  c.save
end

puts "There are now #{Category.count} categories in the database"


User.destroy_all
seedusers = [{name: "Rob Kittleson", email: 'robkit@gmail.com', password: 'password' },
			{name: "Greg Weiss", email: 'gweiss2013@kellogg.northwestern.edu', password: 'password' }]

seedusers.each do |newuser|
  u = User.new
  u.name = newuser[:name]
  u.email = newuser[:email]
  u.password_digest = newuser[:password]
  u.save
end

puts "There are now #{User.count} users in the database"


Collaborator.destroy_all
seedcollaborators = [{name: 'Rob Kittleson', nickname: 'Robby', user: 'Rob Kittleson'},
					{name: 'Greg Weiss', nickname: 'The Machine', user: 'Greg Weiss'},
					{name: 'Timmy', nickname: 'Little Timmy', user: 'Greg Weiss'}]

seedcollaborators.each do |newcollab|
  c = Collaborator.new
  c.name = newcollab[:name]
  c.nickname = newcollab[:nickname]
  c.user_id = User.find_by_name(newcollab[:user]).id
  c.save
end

puts "There are now #{Collaborator.count} collaborators in the database"


Item.destroy_all
seeditems = [{task: 'Build app framework', due: '', priority: '5', status: '', list: 'Final Project', collaborator: 'Robby', user: 'Rob Kittleson', category: 'Tasks'},
         	{task: 'fix display', due: '', priority: '5', status: '', list: 'Final Project', collaborator: 'Robby', user: 'Rob Kittleson', category: 'Tasks'},
         	{task: 'Take out the trash', due: '', priority: '3', status: '', list: 'Chores', collaborator: 'The Machine', user: 'Greg Weiss', category: 'Manual Labor'},
         	{task: 'Make your bed', due: '', priority: '2', status: '', list: 'Chores', collaborator: 'Little Timmy', user: 'Greg Weiss', category: 'Manual Labor'},
     		{task: 'Make dinner', due: '', priority: '1', status: '', list: 'Chores', collaborator: 'Robby', user: 'Rob Kittleson', category: 'Cooking'},
     		{task: 'Run around like a maniac', due: '', priority: '4', status: '', list: 'Stuff that would be nice', collaborator: 'The Machine', user: 'Rob Kittleson', category: 'Manual Labor'},
     		{task: 'Finish business school', due: '', priority: '5', status: '', list: 'Stuff that would be nice', collaborator: 'Robby', user: 'Rob Kittleson', category: 'Tasks'},
     		{task: 'working as intended', due: '', priority: '1', status: '', list: 'Final Project', collaborator: 'Robby', user: 'Rob Kittleson', category: 'Tasks'}]

seeditems.each do |newitem|
  t = Item.new
  t.task = newitem[:task]
  t.due = newitem[:due]
  t.priority = newitem[:priority]
  t.status = newitem[:status]
  t.list_id = List.find_by_title(newitem[:list]).id
  t.collaborator_id = Collaborator.find_by_nickname(newitem[:collaborator]).id
  t.user_id = User.find_by_name(newitem[:user]).id
  t.category_id = Category.find_by_category(newitem[:category]).id
  t.save
end

puts "There are now #{Item.count} items in the database"