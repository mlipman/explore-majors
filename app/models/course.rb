class Course < ActiveRecord::Base
	attr_accessible :dept, :num, :title, :desc, :units
	has_and_belongs_to_many :users
end