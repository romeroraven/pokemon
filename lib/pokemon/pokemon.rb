require "poke-api-v2"
class Pokemon
    attr_accessor :name, :url, :height, :weight, :abilities, :type, :moves, :id, :description

    @@all = [ ]


    def initialize(name:, url:)
        @name = name
        @url = url
        @height = height
        @weight = weight
        @abilities = abilities
        @type = type
        @moves = moves
        @id = id
        @description = description
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(pokemon_choice)
        self.all.find {|pokemon| pokemon.name == pokemon_choice}
    end
end