class CreateCoursesAndUsers < ActiveRecord::Migration
    def change
        create_table :users do |t|
            t.string :name
            t.string :login
          t.timestamps
        end

      	create_table :courses do |t|
      		t.string :dept
      		t.string :num
      		t.string :title
      		t.text :desc
      		t.integer :units
      	  t.timestamps
      	end

        create_table :courses_users do |t|
            t.belongs_to :course
            t.belongs_to :user
        end
    end
end
