hash = {
  cogs: {
    jan: 100,
    feb: 200,
    mar: 300,
  },
  utilities: {
    jan: 400,
    feb: 500,
    mar: 600
  },
  shipping: {
    jan: 700,
    feb: 800,
    mar: 900
  },
  total: {
    jan: nil,
    feb: nil,
    mar: nil
  }
}

shallow_keys = hash.keys

hash.each do |key, value|
  hash[key].each do |deep_key, deep_value|
    puts deep_value
  end
end