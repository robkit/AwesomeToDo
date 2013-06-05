class User < ActiveRecord::Base

	has_secure_password
	
	has_many :items
	has_many :assigned_items, class_name: "Item", foreign_key: "collaborator_id"
	has_many :collaborators

	validates :name, uniqueness: true
	validates :email, uniqueness: true

end
