json.array!(@posts) do |post|
  json.extract! post, :id, :speaker_state, :speaker_first, :speaker_last, :speaker_party, :speaking
  json.url post_url(post, format: :json)
end
