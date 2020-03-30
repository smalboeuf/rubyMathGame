
require_relative './Player'
#choice = $stdin.gets.chomp
class Game



    def initialize
        @player1 = Player.new("Player 1")
        @player2 = Player.new("Player 2")
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

        answer = add_numbers(numb1, numb2)

        puts create_question(current_player, numb1, numb2)

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

        player_counter = switch_player_counter(player_counter)

      end
    end





    def game_over?
			@player1.lives <= 0 || @player2.lives <= 0
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
        @player1.lose_a_life
      else
        @player2.lose_a_life
      end
    end

    def switch_player_counter(player_counter)
      if (player_counter == 1)
        2
      else 
        1
      end
    end
    
    def create_question(current_player, numb1, numb2)
      "#{current_player.name}: What does #{numb1} plus #{numb2} equal?"
    end

    def add_numbers(numb1, numb2)
      numb1 + numb2
    end

    
end
