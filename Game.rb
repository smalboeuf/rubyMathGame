
require_relative './Player'
#choice = $stdin.gets.chomp
class Game




    def initialize
        @player1 = Player.new("Player 1")
        @player2 = Player.new("Player 2")
    end

    def game_over?
			@player1.lives <= 0 && @player2.lives <= 0
    end
    
    def answer_check()
    end

    def new_turn_output
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
      puts "----- NEW TURN -----"
    end
    def display_round
    
    end

    def switch_turns
    end

    def new_question(player)
      puts "#{player.name}"
    end


    def play

      player_counter = 1
      

      until(game_over?) do
        if (player_counter == 1)
          current_player = @player1
        else
          player_counter = @player2
        end
  

        



        
        new_turn_output

        if (player_counter == 1)
          player_counter = 2
        else 
          player_counter = 1
        end
      end

    end


    


end
