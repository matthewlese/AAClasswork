def average(num1, num2) #should accept two numbers as arguments
    (num1 + num2) / 2.0 #should return the average of the two numbers
end

def average_array(arr)  #should accept an array of numbers as an arg
    arr.sum / (arr.length * 1.0) #should return the average of the numbers of the array
end

def repeat(str, num)  #should accept a string and a number as args
    str * num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    arr = str.split(" ")
    new_str = arr[0].upcase
    arr.each_with_index do |word, idx|
        if idx > 0
            if idx.odd?
                new_str += " " + word.downcase
            elsif idx.even?
                new_str += " " + word.upcase
            end
        end
    end
    new_str
end