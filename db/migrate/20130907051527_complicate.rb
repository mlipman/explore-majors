class Complicate < ActiveRecord::Migration
	def up
		Req.reset_column_information
		change_table :reqs do |t|
			t.integer :chunk_id
			t.integer :opt_parent # 1 if it belongs to an opt, else 0
		end

		create_table :chunks do |t|
			t.string :name
			t.integer :option_id
			t.integer :chunk_id
			t.integer :opt_parent # 1 if it belongs to an opt, else 0			
			t.timestamps
		end		
	end

	def down
		change_table :reqs do |t|
			t.remove :chunk_id
		end

		drop_table :chunks
	end
end
