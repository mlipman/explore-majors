class LoadDataOne < ActiveRecord::Migration
  def up
  	d = Option.new(:name => "Degree")
  	d.save

  	# pwr1 = Req.new(:name => "PWR 1")
  	# pwr1.option = d
  	# pwr1.save
  	# pwr2 = Req.new(:name => "PWR 2")
  	# pwr2.option = d
  	# pwr2.save
  	# tm = Req.new(:name => "Thinking Matters")
  	# tm.option = d
  	# tm.save
  	major = Req.new(:name => "Major")
  	major.option = d
  	major.save

  	# myPWR1A = Option.new(:name => "PWR 1 A")
  	# myPWR1A.req = pwr1
  	# myPWR1A.save
  	# myPWR1B = Option.new(:name => "PWR 1 B")
  	# myPWR1B.req = pwr1
  	# myPWR1B.save
  	# myPWR1C = Option.new(:name => "PWR 1 C")
  	# myPWR1C.req = pwr1
  	# myPWR1C.save

  	# myPWR2A = Option.new(:name => "PWR 2 A")
  	# myPWR2A.req = pwr2
  	# myPWR2A.save
  	# myPWR2B = Option.new(:name => "PWR 2 B")
  	# myPWR2B.req = pwr2
  	# myPWR2B.save
  	# myPWR2C = Option.new(:name => "PWR 2 C")
  	# myPWR2C.req = pwr2
  	# myPWR2C.save

  	# myTMA = Option.new(:name => "TM A")
  	# myTMA.req = tm
  	# myTMA.save
  	# myTMB = Option.new(:name => "TM B")
  	# myTMB.req = tm
  	# myTMB.save
  	# myTMC = Option.new(:name => "TM C")
  	# myTMC.req = tm
  	# myTMC.save

  	symsys = Option.new(:name => "Symbolic Systems")
  	symsys.req = major
  	symsys.save
  	
   #  humbio = Option.new(:name => "Human Biology")
  	# humbio.req = major
  	# humbio.save
  	# ee = Option.new(:name => "Electrical Engineering")
  	# ee.req = major
  	# ee.save







  	# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].each do |n|
  	# 	core = Req.new(:name => "Kore#{n}")
  	# 	core.option = symsys
  	# 	core.save
  	# end

  	# conc = Req.new(:name => "Concentration")
  	# conc.option = symsys
  	# conc.save

  	# hci = Option.new(:name => "Human-Computer Interaction")
  	# hci.req = conc
  	# hci.save
  	# dmr = Option.new(:name => "Decision Making and Rationality")
  	# dmr.req = conc
  	# dmr.save
  	# cm = Option.new(:name => "Computer Music")
  	# cm.req = conc
  	# cm.save



  end

  def down
  	Option.delete_all
  	Req.delete_all
  end
end
