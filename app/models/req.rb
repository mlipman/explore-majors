class Req < ActiveRecord::Base
  attr_accessible :name
  belongs_to :option
  has_many :options
end
