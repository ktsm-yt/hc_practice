##ゴルフスコア判定
#18ホール72合計の条件はどこかに盛り込む?



puts ',で区切って既定値を入力してください'
input_X = gets.chomp
# Xのバリデーション。int 3 =< X =< 5でなければエラーを出す
# 配列に格納 文字列を,で分割し、それぞれint化して新配列に
arr_X = input_X.split(',').map(&:to_i)
#入れ物はここで作ればおk

puts ',で区切ってプレイヤーの打数を入力してください'
input_Y = gets.chomp
# Yのバリデーション。int 1=<でなければエラーを出す
# 配列に格納
arr_Y = input_Y.split(',').map(&:to_i)

#差し引きを計算した新しい配列
#rubyで配列の足し引きってできるん?

#先に数字にするか、配列のまま計算しちゃうか
#例外を考えてからにしよう

#配列と繰り返しを活用する
#入力のXとYの差を比較を繰り返す each (Y - X)
#これで新しくできた配列に対して、対応する文字を割り当てていく
#計算は数値でやってアウトプットの直前で文字列に切り替える

#zip.mapで配列ごと数値計算ができる
def calculate(arr_X,arr_Y)
  score_arr = arr_Y.zip(arr_X).map do |y,x|
    y - x
  end
  return score_arr
end

print calculate(arr_X, arr_Y)


#規定打数より少ない
Y - X == 0 'パー'
Y - X == -1'バーディ'
Y - X == -2'イーグル'
Y - X == -3'アルバトロス' #例外あり X == 5 && Y == 2
Y - X == -4'コンドル' #例外あり X == 5 && Y == 1
Y - X == -5'ホールインワン' 
#規定打数より多い
Y - X == 1'ボギー'
Y - X == 2'2ボギー'
Y - X == 3'3ボギー'

# 配列の数字を名前に置き換えていくメソッド
def change_score_to_name
map.


end

puts 'スコアを出力します'
#出力形式は横の文字列で ,でくくるjoin(',') 
print 


#テストケースを読み込む
File.open('case_1.txt', 'r')
#パイプでつなげる?
cat case_1.txt | ruby golf_score.rb