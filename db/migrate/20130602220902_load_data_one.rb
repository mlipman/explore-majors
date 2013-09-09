class LoadDataOne < ActiveRecord::Migration
  def up
  	d = Option.new(:name => "Degree")
  	d.save

  	major = Req.new(:name => "Major")
  	major.option = d
  	major.save

  	symsys = Option.new(:name => "Symbolic Systems")
  	symsys.req = major
  	symsys.save
  	

  end

  def down
  	Option.delete_all
  	Req.delete_all
  end
end
