def merge_sort(ary)
	return ary if ary.length <= 1
	ary1 = ary[0..(ary.length / 2) -1]
	ary2 = ary[ary1.length..-1]
	a = merge_sort(ary1)
	b = merge_sort(ary2)
	merge(a,b)
end

def merge(a,b)
	@sorted = []
	until a.empty? || b.empty?
		if a[0] <= b[0]
			@sorted << a.shift
		else
			@sorted << b.shift
		end
	end
	@sorted + a + b

end

sample = []
20.times { sample << rand(100) + 1 }
print "Unsorted:\n #{sample} \n"
print "Sorted:\n #{merge_sort(sample)} \n"