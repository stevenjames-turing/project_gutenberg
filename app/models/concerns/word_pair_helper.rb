module WordPairHelper
  def set_word_pairs
    # Remove new lines
    single_line = contents.gsub(/\R+/, ' ')

    # Standardize text
    formatted_text = single_line.downcase.gsub(/[^0-9a-z' ]/, '')
    text_array = formatted_text.split(' ')

    # Set pairs and save to record
    pairs = []
    text_array.each_cons(2) do |pair|
      pairs << pair 
    end

    pair_hash = {}
    pairs.each do |pair|
      if !pair_hash.has_key?(pair)
        pair_hash[pair] = 1
      else 
        pair_hash[pair] += 1
      end
    end    

    self.word_pairs = pair_hash
  end
end