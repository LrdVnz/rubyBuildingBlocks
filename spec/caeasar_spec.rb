require "./lib/ceasarCipher.rb"

describe "Caesar" do
    describe "#caesar_cipher" do 
    it "returns the ciphred word" do
        expect(caesar_cipher("What a string!", 5)).to eql("Bmfy f xywnsl!")
    end

    it "wraps around" do 
        expect(caesar_cipher("What a string!", -5)).to eql("Rcvo v nomdib!")
    end
    
    it "works" do
        expect(caesar_cipher("Hi, I'm caesar. That piece of shit of my son Brutus wants me dead smh", 13)).to eql(
            "Uv, V'z pnrfne. Gung cvrpr bs fuvg bs zl fba Oehghf jnagf zr qrnq fzu")
    end

    it "doesn't accept decimals" do
        expect(caesar_cipher("COolest string", 0.5)).to eql("Decimals aren't accepted.")
    end

    it "doesn't accept more than 26" do 
       expect(caesar_cipher("cool string", 28)).to eql("Please put a key less or equal 26.")
    end

    it "returns empty strings" do
       expect(caesar_cipher("", 3)).to eql("")
    end
  end
end