class Player

    def initialize(name)
        @name = name
        @lives = 3
    end

    def lose_a_life
        @lives--
    end
    

end
