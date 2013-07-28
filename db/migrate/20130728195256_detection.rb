class Detection < ActiveRecord::Migration
  def change
  	create_table :courses_options do |t|
  		t.belongs_to :course
  		t.belongs_to :option
  	end
  end
end
