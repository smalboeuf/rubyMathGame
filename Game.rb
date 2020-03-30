
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
    
    def new_turn_output
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
      puts "----- NEW TURN -----"
    end

    def finish_game
      if (@player2.lives <= 0)
        puts "Player 1: wins with a score of #{@player1.lives}/3"
      else
        puts "Player 2: wins with a score of #{@player2.lives}/3"
      end
      puts "----- GAME OVER -----"
      puts "Goodbye!"
    end

    def correct_answer?(choice, answer)
      choice == answer
    end

    def decrease_lives(playerNumb)
      if (playerNumb == 1)
        @player1.lives = @player1.lives - 1
      else
        @player2.lives = @player2.lives - 1
      end
    end


    def play

      player_counter = 1
      

      until(game_over?) do
        if (player_counter == 1)
          current_player = @player1
        else
          current_player = @player2
        end

        numb1 = rand(1..20)
        numb2 = rand(1..20)
  
        question = "#{current_player.name}: What does #{numb1} plus #{numb2} equal?"
        answer = numb1 + numb2

        puts question

        choice = $stdin.gets.chomp

        if(correct_answer?(choice.to_i, answer))
          puts "#{current_player.name}: YES! You are correct."
        else
          puts "#{current_player.name}: Seriously? No!"
          decrease_lives(player_counter)
        end



        if (game_over?)
          finish_game
        else
          new_turn_output
        end

        if (player_counter == 1)
          player_counter = 2
        else 
          player_counter = 1
        end
      end

    end
    
end
