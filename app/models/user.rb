class User < ActiveRecord::Base
	attr_accessible :name, :login
	has_and_belongs_to_many :courses
end