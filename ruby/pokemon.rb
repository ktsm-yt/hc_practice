# rubyに静的型付けはない
# name.is_a?(String)
# hp.is_a?(Integer)
# で判定はできる

#rubyではモジュール内に処理を書くのが通例
module NameService 
  def change_name(new_name)
    if new_name == 'うんこ'
      puts '不適切な名前です'
      return
    end
    @name = new_name #これはincludeしたクラスのインスタンス変数
  end

  def name
    @name #同様
  end
end

class Pokemon
  include NameService
  attr_writer :name
  attr_reader :name, :type1, :type2, :hp
  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end
  #rubyにおいてインスタンス変数はデフォルトでprivate
  #アクセサメソッドを必ず通さなければならない
  #カプセル化を推進するような言語設定になっている

  def attack
    puts "#{@name}のこうげき"
  end

end

class Pikachu < Pokemon
  attr_reader :name

  def attack
    super
    puts "#{@name}の10万ボルト"
  end

end

class Player
  include NameService
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

# 動作テスト
poke = Pokemon.new('test','test','',10)
poke.change_name('適切')
puts poke.name
poke.change_name('うんこ')
puts poke.name
