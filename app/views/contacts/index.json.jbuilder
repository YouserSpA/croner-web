json.array!(@contacts) do |contact|
  json.extract! contact, :id, :run, :names, :lastnames, :email, :birthdate
  json.url contact_url(contact, format: :json)
end
