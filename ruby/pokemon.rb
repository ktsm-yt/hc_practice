class Pokemon
  attr_reader :name, :type1, :type2, :hp, :mp
  def initialize
    @name = name
    @type1 = type
    @type2 = type
    @hp = hp
    @mp = mp
  end
  # rubyに静的型付けはない
  # name.is_a?(String)
  # hp.is_a?(Integer)
  # で判定はできる
  

  def attack
    puts "#{@name}のこうげき"
  end
end

def main
  pokemons = Array.new(100) {Pokemon.new}

  puts pokemons[0].name
  puts pokemons[9].type1
  puts pokemons[99].attack
end

main

