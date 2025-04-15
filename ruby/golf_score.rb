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

#先に数字にするか、配列のまま計算しちゃうか
#例外を考えてからにしよう


#配列と繰り返しを活用する
#計算は数値でやってアウトプットの直前で文字列に切り替える

#zip.mapで配列ごと数値計算ができる
def calculate(arr_X,arr_Y)
  score_arr = arr_Y.zip(arr_X).map do |y,x|
      if y == 1 
        'ホールインワン'
      elsif x == 5 && y == 1
        'コンドル'
      elsif x == 5 && y == 2
        'アルバトロス'
      elsif y - x == -2
        'イーグル'
      elsif y - x == -1
        'バーディ'
      elsif y - x == 0
        'パー'
      elsif y - x == 1
        'ボギー'
      elsif y - x == 2
        '2ボギー'
      elsif y - x == 3
        '3ボギー'
      else
        "#{y - x}ボギー"
      end
  end
  #この処理する前にX==5,Y==2,1の処理しないとだね。
  return score_arr.join(',')
  #差し引きを計算した新しい配列
  #出力形式は横の文字列で ,でくくるjoin(',') 
end

puts 'スコアを出力します'
print calculate(arr_X, arr_Y)

# #規定打数より少ない
# Y - X == 0 'パー'
# Y - X == -1'バーディ'
# Y - X == -2'イーグル'
# Y - X == -3'アルバトロス' #例外あり X == 5 && Y == 2
# Y - X == -4'コンドル' #例外あり X == 5 && Y == 1
# Y - X == -5'ホールインワン' Y == 1
# #規定打数より多い
# Y - X == 1'ボギー'
# Y - X == 2'2ボギー'
# Y - X == 3'3ボギー'

#例外考えたら一括でやるほうが良さそ



#テストケースを読み込む
File.open('case_1.txt', 'r')
#パイプでつなげる?
cat case_1.txt | ruby golf_score.rb