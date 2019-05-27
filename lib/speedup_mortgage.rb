require "speedup_mortgage/version"

module SpeedupMortgage
  class Error < StandardError; end
	go = true
	while go
		print "please enter your LOAN AMOUNT: "
		loan = gets.chomp
		
		while loan.nil? || loan.empty?
			print "please enter your LOAN AMOUNT: "
			loan = gets.chomp
		end
		loan = Float(loan)
		
		print "please enter your INTEREST RATE: "
		rate = Float(gets.chomp)
		while rate.nil? || rate.empty?
			print "please enter your INTEREST RATE: "
			rate = gets.chomp
		end
		mrate =rate/(100*12.0)
		
		print "please enter the LENGTH of the loan IN MONTHS: "
		length = gets.chomp
		while length.nil? || length.empty?
			print "please enter your LOAN LENGTH IN MONTHS: "
			length = gets.chomp
		end
		length = Float(gets.chomp)
		length = length * 12.0
		
		print "What is your MONTHLY PAYMENT?: "
		pay = gets.chomp
		while pay.nil? || pay.empty?
			print "please enter your MONTHLY PAYMENT: "
			pay = gets.chomp
		end
		pay = Float(pay)
		
		print "How much extra per month do you want to pay?: "
		extra = gets.chomp
		while extra.nil? || extra.empty?
			print "please enter the EXTRA AMOUNT: "
			extra = gets.chomp
		end
		extra = Float(extra)
		
		current_time_frame = Math.log10(pay/(pay-loan*mrate)) / Math.log10(1+mrate)
		new_time_frame = Math.log10((pay+extra)/(pay+extra-loan*mrate)) / Math.log10(1+mrate)
		difference = Float(current_time_frame - new_time_frame)
		difference_in_years = difference / 12.0
		puts "currently, you will pay off this loan in %0.2f months." % [current_time_frame]
		current_in_years = Float(current_time_frame / 12.0)
		puts "this is about %0.2f years" % [current_in_years]
		puts
		puts "By paying an extra $%0.2f per month, you will repay this loan in %0.2f months." % [extra, new_time_frame]
		new_in_years = Float(new_time_frame / 12.0)
		puts "this is about %0.2f years." % [new_in_years]
		puts
		puts "You will save about %0.2f months or about %0.2f years." % [difference, difference_in_years]
		
		print "enter 'y' to go again, anything else to exit: "
		go = gets.chomp.to_s.lowercase
	
		if go != 'y'
			go = false
		end
	end
end
