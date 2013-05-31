# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all
seedusers = [{name: "Rob Kittleson", nickname: "Robby", email: 'robkit@gmail.com', password: 'password' },
      {name: "Greg Weiss", nickname: "The Machine", email: 'gweiss2013@kellogg.northwestern.edu', password: 'password' },
      {name: "Boris", nickname: "Boris", email: 'boris@kellogg.northwestern.edu', password: 'password' },
      {name: "Jeff Cohen", nickname: "Jeff", email: 'jeff@kellogg.northwestern.edu', password: 'password' },
      {name: "Nick", nickname: "Nick", email: 'nick@kellogg.northwestern.edu', password: 'password' },
      {name: "Amanda", nickname: "Mandy", email: 'amanda@kellogg.northwestern.edu', password: 'password' },
      {name: "Josh", nickname: "Josh", email: 'josh@kellogg.northwestern.edu', password: 'password' },
      {name: "Raghu", nickname: "Raghu", email: 'Raghu@kellogg.northwestern.edu', password: 'password' }]

seedusers.each do |newuser|
  u = User.new
  u.name = newuser[:name]
  u.nickname = newuser[:nickname]
  u.email = newuser[:email]
  u.password = newuser[:password]
  u.save
end
puts "There are now #{User.count} users in the database"


List.destroy_all
Collaborator.destroy_all
seedlists = [{title: "Final Project", collaborators: ["Rob Kittleson", "Greg Weiss"]},
            {title: "Chores", collaborators: ["Rob Kittleson", "Greg Weiss", "Nick", "Josh", "Amanda"]},
            {title: "June 2013", collaborators: ["Rob Kittleson", "Greg Weiss"]},
            {title: "Class", collaborators: ["Jeff Cohen", "Josh", "Raghu"]}]

seedlists.each do |newlist|
  l = List.new
  l.title = newlist[:title]
  l.save
  newlist[:collaborators].each do |newcollab|
    c = Collaborator.new
    c.list_id = l.id
    c.user_id = User.find_by_name(newcollab).id
    c.save
  end
end

puts "There are now #{List.count} lists in the database"
puts "There are now #{Collaborator.count} collaborations in the database"


Category.destroy_all
seedcategories = [{category: "Coding"},{category: "Personal"},{category: "Classwork"}]

seedcategories.each do |newcategory|
  c = Category.new
  c.category = newcategory[:category]
  c.save
end

puts "There are now #{Category.count} categories in the database"


Item.destroy_all
seeditems = [{task: 'Build app framework', due: '', priority: '5', status: 1, list: 'Final Project', collaborator: 'Rob Kittleson', user: 'Rob Kittleson', category: 'Coding'},
         	{task: 'Add bootstrap style', due: '', priority: '5', status: 1, list: 'Final Project', collaborator: 'Rob Kittleson', user: 'Rob Kittleson', category: 'Coding'},
         	{task: 'Wash dishes', due: '', priority: '3', status: 0, list: 'Chores', collaborator: 'Amanda', user: 'Greg Weiss', category: 'Personal'},
         	{task: 'Buy eggs', due: '', priority: '2', status: 0, list: 'Chores', collaborator: 'Josh', user: 'Greg Weiss', category: 'Personal'},
     		{task: 'Make dinner', due: '', priority: '1', status: 1, list: 'Chores', collaborator: 'Nick', user: 'Rob Kittleson', category: 'Personal'},
     		{task: 'Run around like a maniac', due: '', priority: '4', status: 0, list: 'June 2013', collaborator: 'Greg Weiss', user: 'Rob Kittleson', category: 'Personal'},
     		{task: 'Finish business school', due: '', priority: '5', status: 0, list: 'June 2013', collaborator: 'Rob Kittleson', user: 'Rob Kittleson', category: 'Classwork'},
     		{task: 'Whiteboard new features', due: '', priority: '1', status: 0, list: 'Final Project', collaborator: 'Greg Weiss', user: 'Rob Kittleson', category: 'Classwork'}]

seeditems.each do |newitem|
  t = Item.new
  t.task = newitem[:task]
  t.due = newitem[:due]
  t.priority = newitem[:priority]
  t.status = newitem[:status]
  t.list_id = List.find_by_title(newitem[:list]).id
  t.collaborator_id = User.find_by_name(newitem[:collaborator]).id
  t.user_id = User.find_by_name(newitem[:user]).id
  t.category_id = Category.find_by_category(newitem[:category]).id
  t.save
end

puts "There are now #{Item.count} items in the database"