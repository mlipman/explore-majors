class CreateReqs < ActiveRecord::Migration
  def change
    create_table :reqs do |t|
    	t.string :name
    	t.integer :option_id

      t.timestamps
    end
  end
end
