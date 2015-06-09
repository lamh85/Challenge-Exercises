small_words = ["life","time","else","where","up","side","grand","mother","can","not","base","ball","fire","work","pass","port","down","load","chair","man"]

compound_words = ["lifetime","elsewhere","upside","grandmother","cannot","baseball","fireworks","passport","hello","goodbye","download","hammer","chair","table","chairman"]

compound_words.each do |compound|
  results = []
  small_words.each do |small|
    if compound.include? small
      results << small
    end
  end
  if results.length > 0
    puts "The word '#{compound}' contains words: #{results}."
  else
    puts "The word '#{compound}' does not contain smaller words."
  end
end