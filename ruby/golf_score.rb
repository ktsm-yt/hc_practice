##ゴルフスコア判定


puts ',で区切って既定値を入力してください'
input_X = gets.chomp
# 配列に格納 文字列を,で分割し、それぞれint化して新配列に
arr_X = input_X.split(',').map(&:to_i)
# Xのバリデーション。int 3 =< X =< 5でなければエラーを出す
if arr_X.any? { |x| x < 3 || x > 5 } #any?は一つでもあるかを問う
  puts '正しい数字を入力してください'
  exit
end

puts ',で区切ってプレイヤーの打数を入力してください'
input_Y = gets.chomp
arr_Y = input_Y.split(',').map(&:to_i) 
# Yのバリデーション。int 1=<でなければエラーを出す
if arr_Y.any? { |y| y < 1 } 
  puts '正しい数字を入力してください'
  exit
end

valid_length = arr_X.length == 18 && arr_Y.length == 18
valid_sum = arr_X.sum == 72 && arr_Y.sum == 72

#unlessは1行のときに使うのが通例
if !valid_length 
  puts '正しいホール数か確かめてください' 
  exit
end

if !valid_sum
  puts '正しい規定打数か確かめてください'
  exit
end

#定数としてハッシュを定義(シンボルじゃないので矢印)
SCORE_NAMES = {
  -4 => 'コンドル',
  -3 => 'アルバトロス',
  -2 => 'イーグル',
  -1 => 'バーディ',
  0 => 'パー',
  1 => 'ボギー'
}

#zip.mapで配列ごと数値計算ができる
def calculate(arr_X,arr_Y)
  score_arr = arr_Y.zip(arr_X).map do |y,x|
      diff = y - x
      if  x == 5 && y == 1 #条件式の順番修正
        'コンドル'
      elsif y == 1
        'ホールインワン'
      elsif x == 5 && y == 2
        'アルバトロス'
      else
        #変数でキーを取り出し,なければ左辺を返す
        SCORE_NAMES[diff] || "#{diff}ボギー"
      end
  end
  
  return score_arr.join(',')
  #差し引きを計算した新しい配列
  #出力形式は横の文字列で ,でくくるjoin(',') 
end

puts 'スコアを出力します'
print calculate(arr_X, arr_Y)




# #テストケースを読み込む
# cat case_1.txt | ruby golf_score.rb
# これはターミナル操作なので記述するコードではない

# #catでファイルの中身を標準出力してパイプでつなげ  txt→ターミナル
# #rubyプログラムは標準出力をうけとる  ターミナル→.rb

# ファイル操作のヒント
# line = File.readlines("case_1.txt")[^0]

# input_line = gets.to_i
# input_line.times do
#   s = gets.chomp.split(" ")
#   print "hello = #{ s[0] } , world = #{ s[1] }\n"
# end