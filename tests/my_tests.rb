
# Todo: create tests to verify functionality saving and loading of user data (ie: cat is created and stored, mutated )
# Todo: game tests
module MyTest
	def self.expect_equal(actual, expected)
		if actual == expected
			puts "PASS"
		else
			puts "FAIL\nExpected: #{expected}\nActual: #{actual}\n"
		end
	end
end
