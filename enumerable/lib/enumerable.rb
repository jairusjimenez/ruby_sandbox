module Enumerable
	def my_each
        for x in self
        	yield(x)
        end
	end

	def my_each_with_index
        counter = 0
        for x in self
        	yield x, counter
        	counter += 1
        end
	end

	def my_select
        result = []
        self.my_each { |element| result << element if block_given? && yield(element) }
        result
	end

	def my_all?
        self.my_each { |element| return false if !block_given? || !yield(element) }
        true
	end


    def my_any?
        self.my_each { |element| return true if block_given? && yield(element) }
        false
    end

    def my_none?
        self.my_each { |element| return false if block_given? && yield(element) }
        true
   end

   def my_count (count = nil)
        i = 0
        for x in self
            if block_given?
                i += 1 if yield(x)
            else
                if count == nil
                    return self.length
                else
                    i += 1 if count == x
                end
            end
        end
        return i
   end

   def my_map
        return self.to_enum if !block_given?
        i = []
        for x in self
            i << yield(x)
        end
        return i
   end

   def my_map(&proc)
       return self.to_enum if !block_given?
       my_array = []
       for x in self
           my_array << proc.call(x)
       end
       return my_array
   end


   def my_inject(initial=nil,sym=nil)
        result = initial.nil? ? nil : initial
        if block_given?
            for x in self
                result = yield(result,x)
            end
        else
            if sym.nil?
                sym = initial
                initial = nil
            end

            for x in self
                if initial.nil?
                    initial = x
                    result = initial
                else
                    result = result.send(sym,x)
                end
            end
        end
        return result
   end

   def my_map_two_args(proc=nil, &block)
        result = []
        for x in self
            result << block.call(proc.call(x)) if proc and block_given?
            result << proc.call(x) if !block_given?
            result << yield(x) if !proc and block_given?
        end
        return result
   end
end