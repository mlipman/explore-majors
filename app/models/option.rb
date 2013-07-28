class Option < ActiveRecord::Base
  attr_accessible :name
  belongs_to :req
  has_many :reqs
  has_and_belongs_to_many :courses
end
