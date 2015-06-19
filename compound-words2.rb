dictionary = ["life","time","else","where","up","side","grand","mother","can","not","base","ball","fire","work","pass","port","down","load","chair","man","lifetime","elsewhere","upside","grandmother","cannot","baseball","fireworks","passport","hello","goodbye","download","hammer","chair","table","chairman"]

dictionary.each do |query|
  results = []
  dictionary.each do |matcher|
    if query[matcher] == matcher && query != matcher
      results << matcher
    end
  end
  if results.length > 0
    puts "The word '#{query}' contains words: #{results}."
  else
    puts "The word '#{query}' does not contain smaller words."
  end
end