require "enumerable"

describe Enumerable do
	subject { [2,4,9,11,3] } 

	describe "#my_count" do
		context "block is given" do
			it "returns 0 with empty array" do
				array = []
				expect(array.my_count{ |x| x > 4 }).to eq(0)
			end

			it "returns greater than zero with an array with cases" do
				expect(subject.my_count{ |x| x > 4}).to eq(2) 
			end
		end

		context "no block is given" do
			it "returns 0 when empty array" do
				expect([].my_count).to  be_zero
			end

			it "returns size of the enumerable when array is not empty" do
				expect(subject.my_count).to  eq(5)
			end
		end
	end

	describe "#my_select" do
		context "block is given" do
			it "returns empty array when empty array is given" do
				expect([].my_select{ |x| x > 4 }).to  be_empty
			end

			it "returns a non empty array when selection succeeds" do
				expect(subject.my_select{ |x| x > 4 }).not_to  be_empty
			end
		end

		context "no block is given" do
			it "returns empty array when empty array is given" do
				expect([].my_select).to  be_empty
			end

			it "returns empty array when non empty array is given" do
	          expect(subject.my_select).to be_empty
	        end
		end
	end

	describe "#my_all" do
		context "block is given" do
			it "returns true when everything is true" do
				expect(subject.my_all?{ |x| x > 0 }).to be true
			end

			it "returns false when something is not true" do
				expect(subject.my_all?{ |x| x > 4 }).to be false
			end

			it "returns true when empty array is given" do
				expect([].my_all?{ |x| x > 4 }).to be true
			end
		end

		context "no block is given" do
			it "returns false with non-empty array" do
				expect(subject.my_all?).to be false
			end

			it "returns false with empty array" do
				expect(subject.my_all?).to be false
			end
		end
	end

	describe "#my_any" do
		context "block is given" do
			it "returns true when something is true" do
				expect(subject.my_any?{ |x| x > 2 }).to be true
			end

			it "returns false when everything is false" do
				expect(subject.my_any?{ |x| x == -4 }).to be false 
			end

			it "returns false when empty array is given" do
				expect([].my_any?{ |x| x > 4 }).to be false 
			end
		end

		context "no block is given" do
			it "returns false with non-empty array" do
				expect(subject.my_any?).to be false 
			end

			it "returns false with empty array" do
				expect(subject.my_any?).to be false 
			end
		end
	end

	describe "#my_none" do
		context "block is given" do
			it "returns true when everything is true" do
				expect(subject.my_none?{ |x| x == -2}).to be true
			end

			it "returns false when something is true" do
				expect(subject.my_none?{ |x| x == 2}).to be false 
			end

			it "returns true when empty array is given" do
				expect([].my_none?{ |x| x > 4}).to be true 
			end
		end

		context "no block is given" do
			it "returns true with non-empty array" do
				expect(subject.my_none?).to be true
			end

			it "returns true with empty array" do
				expect(subject.my_none?).to be true
			end
		end
	end

	describe "#my_map" do
		context "block is given" do
			it "returns maped array with non-empty array" do
				expect(subject.my_map{ |x| x * 2 }).to eq([4,8,18,22,6]) 
			end

			it "returns empty array when empty array is given" do
				expect([].my_map{ |x| x * 2}).to be_empty 
			end
		end
	end
	
end