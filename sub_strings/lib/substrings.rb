class SubString
    def substrings(text, dictionary)
        matches = {} 
        dictionary.each do |word|
          matches[word] = text.downcase.scan(/(?=#{word})/).count if text.downcase.include?(word)
        end
        p matches
    end
end

dictionary = ['below','down','go','going','horn','how','howdy','it','i','low','own','part','partner','sit']

ss = SubString.new

ss.substrings('below', dictionary)
