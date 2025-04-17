class Pokemon
  attr_reader :name, :type1, :type2, :hp
  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end
  # rubyに静的型付けはない
  # name.is_a?(String)
  # hp.is_a?(Integer)
  # で判定はできる
  

  def attack
    puts "#{@name}のこうげき"
  end
end

class Pikachu < Pokemon
  attr_reader

  def attack
    super
    puts "#{@name}の10万ボルト"
  end
end


def main
  pika = Pikachu.new('ピカチュウ','でんき','', 100)
  
  puts pika.attack
  
  # pokemons = Array.new(100) {Pokemon.new}
  # puts pokemons[0].name
  # puts pokemons[9].type1
  # puts pokemons[99].attack
end

main

