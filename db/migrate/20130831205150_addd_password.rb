class AdddPassword < ActiveRecord::Migration
    def up
  	    User.reset_column_information
  		change_table :users do |t|
  			t.string :password_digest
  			t.string :salt
  		end
  		User.all.each do |usr|
      		numS = Random.rand.to_s
  			usr.update_attributes!(:salt => numS)
      		temp = "password" + numS # setting passowrd for current users
  			usr.update_attributes!(:password_digest => Digest::SHA1.hexdigest(temp))
	  	end
    end

    def down
    	change_table :users do |t|
    		t.remove :password_digest
    		t.remove :salt
    	end
    end
end
