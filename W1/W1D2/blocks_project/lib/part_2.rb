def all_words_capitalized?(arr)
    arr.all? { |ele| ele == ele.capitalize }
end

def no_valid_url?(arr)
    valids = ['.com', '.net', '.io', '.org']
    arr.none? do |url|
        valids.any? { |ending| url.end_with?(ending) }
    end
end

def any_passing_students?(students)
    students.any? { |student| avg_grade(student[:grades]) >= 75 }
    
end

def avg_grade(arr)
    1.0 * arr.sum / arr.length
end

