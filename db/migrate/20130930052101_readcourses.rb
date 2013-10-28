class Readcourses < ActiveRecord::Migration
  def up
  	Course.reset_column_information
	data = IO.readlines('SlimData.txt')
	arr = JSON.parse(data[0])
	count = 0
	arr.each do |crs|
		count += 1
		if (count%1000==0) then puts "Count is #{count}" end
		tmp_crs = Course.new(crs)
		tmp_crs.save
	end
  end

  def down
  	Course.destroy_all
  end
end
