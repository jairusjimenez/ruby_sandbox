require 'caesar_cipher'

describe 'caesar_cipher' do
	subject{ caesar_cipher(string, shift)}
	let(:string) { 'jairus' }
	let(:shift) { 1 }

	context 'shift key 1' do
		it "returns kbjsvt" do
			expect(subject).to  eql("kbjsvt")
		end

		context 'with punctation' do
			let(:string) { 'jairus.' } 

			it "returns 'kbjsvt.'" do
				expect(subject).to  eql('kbjsvt.')
			end
		end

		context "with letter z" do
			let(:string) { 'z' } 

			it "returns a" do
				expect(subject).to eql 'a' 
			end
		end

		context "with white space" do
			let(:string) { 'aa bb' } 

			it "returns bb cc" do
				expect(subject).to eql('bb cc') 
			end
		end

	end

	context "shift key 0" do
		let(:shift) { 0 } 
		it "returns the same string" do
			expect(subject).to eql 'jairus' 
		end
	end

	context "shift key -1" do
		let(:shift) { -1 } 
		it "returns 'jd'" do
			expect(subject).to eql('izhqtr') 
		end
	end

	context "shift key 10" do
		let(:shift) { 10 } 
		it "returns 'tksbec'" do
			expect(subject).to eql('tksbec') 
		end
	end
end