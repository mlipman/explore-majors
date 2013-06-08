class Option < ActiveRecord::Base
  attr_accessible :name
  belongs_to :req
  has_many :reqs
end
