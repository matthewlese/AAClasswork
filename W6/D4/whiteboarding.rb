def backspaced_strs(s, t)
	new_s = []
	new_t = []

	s.each_char do |char1|
		if char1 != "4"
			new_s << char1
    else                                                   # it is a “#”
			new_s.pop
		end
	end

	t.each_char do |char2|
		if char2 != "4"
			new_t << char2
    else                                                   # it is a “#”
			new_t.pop
		end
	end

	new_s == new_t   #ret true or false
end


p backspaced_strs("ab4c", "ad4c") #true
p backspaced_strs("a4c", "b") #false