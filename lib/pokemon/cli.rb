class CLI

    def start
        self.pokedex_logo
        sleep(1)
        puts"----------------------------"
        puts "Welcome Pokemaster!"
        puts"----------------------------"
        sleep(1)
        API.grab_pokemons
        self.menu
        loop_or_exit
    end
        

    def menu

        sleep(1)
        puts "Would you like to explore the world of Pokemon?"
        puts"----------------------------"
        sleep(1)
        puts "Y/N?"
        puts"----------------------------"
        user_input = gets.strip.downcase
        
        if user_input == "yes" || user_input == "y"
            self.prompt_user
            sleep(1)
            self.display_list_of_pokemons
            self.ask_user_for_pokemon_choice
            puts "knowledge is frutile!"
            sleep(2)
    
        elsif user_input == "no" || user_input == "n"
            puts "Farewell Pokemaster!"
            exit
        else
        sleep(1)
        puts "Is there anything else you'd like to see?"
        sleep(1)
        self.ask_user_for_pokemon_choice
    end

end 

    def prompt_user
        puts"----------------------------"
        puts "Here we go!"
    end
    
    
    def display_list_of_pokemons
        
        puts "\n"
        Pokemon.all.each.with_index do |pokemon, index|
            puts "#{index+1}. #{pokemon.name}" 
        end
    end

    def loop_or_exit
        puts "Would you like to see more? Enter y/n"
        input = gets.strip.downcase
        if input == "y"
            self.display_list_of_pokemons
            self.ask_user_for_pokemon_choice

        else
            puts "Farewell Pokemaster!"
            exit
        end
    end

    def ask_user_for_pokemon_choice

        puts "Enter a number to the Pokemon you'd like to learn more about."
        pokemon_choice_index = gets.strip.to_i - 1
        max_limit = Pokemon.all.length - 1

        until pokemon_choice_index.between?(0,max_limit)
            puts "Invalid choice"
            pokemon_choice_index = gets.strip.to_i - 1  #If invalid user will be asked again
        end

        #User's pokemon choice
        pokemon_object_lookup = Pokemon.all[pokemon_choice_index]
        puts "Let's see what there is to learn."
        sleep(1)
        API.pokemon_info(pokemon_object_lookup)
        self.display_pokemon_info(pokemon_object_lookup)
    end

    def display_pokemon_info(pokemon_object_lookup)

        #details displayed for user

        puts "Name: #{pokemon_object_lookup.name}"
        sleep(1)
        puts "Type: #{pokemon_object_lookup.type}"
        sleep(1)
        puts "Ability: #{pokemon_object_lookup.abilities}"
        sleep(1)
        puts "Move: #{pokemon_object_lookup.moves}"
        sleep(1)
        puts "Height: #{pokemon_object_lookup.height}"
        sleep(1)
        puts "Weight: #{pokemon_object_lookup.weight}"
        sleep(3)
        loop_or_exit

        
    end
    def pokedex_logo
        file = File.open("./lib/pokemon/pokedex.txt")
        puts file.read
    end
end
