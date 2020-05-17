class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    while @game_over == false
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    if @game_over == false
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    sleep(1)
    system("clear")
    add_random_color
    puts "new_sequence"
    seq.each {|colour| puts colour}
    sleep(2)
  end

  def require_sequence
    system("clear")
    puts "Your turn!"
    (0...sequence_length).each do |idx|
      colour = gets.chomp
      if colour != seq[idx]
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    colour = COLORS.sample
    seq << colour
  end

  def round_success_message
    puts "congo rats!"
  end

  def game_over_message
    puts "Game Over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

a = Simon.new
a.play
