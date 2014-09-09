json.array!(@words) do |word|
  json.extract! word, :id, :description, :user_id
  json.url word_url(word, format: :json)
end
