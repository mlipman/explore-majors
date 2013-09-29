class CreateCoursesAndUsers < ActiveRecord::Migration
	def change
			create_table :users do |t|
					t.string :name
					t.string :login
				t.timestamps
			end

			create_table :courses do |t|
				t.string :deptCode
				t.string :deptNum
				t.string :title
				t.text :desc
				t.integer :minUnits
				t.integer :maxUnits
				t.timestamps
			end

			create_table :courses_users do |t|
					t.belongs_to :course
					t.belongs_to :user
			end
	end
end
