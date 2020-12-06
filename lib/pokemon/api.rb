class API

    def self.grab_pokemons

        url = "https://pokeapi.co/api/v2/pokemon?limit=151"
        uri = URI(url)
        response = Net::HTTP.get(uri) 
        hash = JSON.parse(response)
        array_of_pokemons = hash["results"]

        array_of_pokemons.each do |pokemon|
            Pokemon.new(name: pokemon["name"], url: pokemon["url"])

    end
end
    
    def self.pokemon_info(pokemon_object_lookup)

        url = "#{pokemon_object_lookup.url}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        pokemon_details = JSON.parse(response)


        pokemon_object_lookup.height = pokemon_details["height"]
        pokemon_object_lookup.weight = pokemon_details["weight"]
        pokemon_object_lookup.abilities = pokemon_details["abilities"][0]["ability"]["name"]
        pokemon_object_lookup.type = pokemon_details["types"][0]["type"]["name"]
        pokemon_object_lookup.moves = pokemon_details["moves"][0]["move"]["name"]
        pokemon_object_lookup.id = pokemon_details["id"]
    
    
    
    end
end







