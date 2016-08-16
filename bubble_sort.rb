def bubble_sort
	my_array = [4,3,78,2,0,2]
	sort_status = false
	while sort_status == false do
		sort_status = true
		(0...my_array.size-1).each do |i|
			if my_array[i] > my_array[i+1]
				my_array[i], my_array[i+1] = my_array[i+1], my_array[i]
				sort_status = false
			end
		end
	end
	print my_array
end

def bubble_sort_by(my_array)
    swap_status = true
    while swap_status
        swap_status = false
        (0...my_array.size-1).each do |i|
            if yield(my_array[i], my_array[i+1]) < 0
                holder = my_array[i+1]
                my_array[i+1] = my_array[i]
                my_array[i] = holder
                swap_status = true
            end
        end
    end
    return my_array
end

#bubble_sort

sample_array = ["hi", "hello", "hey","h"]
bubble_sort_by(sample_array) { |left,right| right.length - left.length }
print sample_array