class BookSerializer
  def self.pairing_total_count(words, count)
    {
    "data": {
        "id": "null",
        "type": "book",
        "attributes": {
              "word_pairing": {
                                  "word_pairing": words,
                                  "total_count": count
                                  }
                                }
                              }
                            }


  end
  

end
