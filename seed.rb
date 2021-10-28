[
    {name: "Spike Spiegel", age: 27, birth: "2044-06-26", messages: "SwordFish2"},
    {name: "Jet Black", age: 36, birth: "2035-12-03", messages: "Hammerhead"},
    {name: "Faye Valentine", age: 77, messages: "1994-08-14", messages: "redtail"},
    {name: "Edward Wong Hau Pepelu Tivrusly 4", age: 13, birth: "2058-01-01", messages: ""},
    {name: "Ein", age: 2}
].map{|row| Hashie::Mash.new(row) }.each do |data|
    User.create!(
        name: data.name,
        age: data.age,
        birth: data.birth,
        messages: data.messages
        )
end
