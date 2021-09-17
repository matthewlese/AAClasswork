def my_map(arr, &prc)
    mapped = []
    arr.each do |ele|
        mapped << prc.call(ele)
    end
    mapped
end

def my_select(arr, &prc)
    selected = []
    arr.each do |ele|
        if prc.call(ele)
            selected << ele
        end
    end
    selected
end

def my_count(arr, &prc)
    count = 0
    arr.each do |ele|
        if prc.call(ele)
            count += 1
        end
    end
    count
end

def my_any?(arr, &prc)
    arr.each do |ele|
        if prc.call(ele)
            return true
        end
    end
    false
end

def my_all?(arr, &prc)
    arr.each do |ele|
        if !prc.call(ele)
            return false
        end
    end
    true
end

def my_none?(arr, &prc)
    arr.each do |ele|
        if prc.call(ele)
            return false
        end
    end
    true
end