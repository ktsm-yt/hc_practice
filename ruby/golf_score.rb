##ゴルフスコア判定
#18ホール72合計の条件はどこかに盛り込む?

arr_X = []
arr_Y = []

puts ',で区切って既定値を入力してください'
input_X = gets.chomp
# Xのバリデーション。int 3 =< X =< 5でなければエラーを出す
X = Integer(inputX)
# 配列に格納
arr_X << X
puts ',で区切ってプレイヤーの打数を入力してください'
input_Y = get.chomp
# Yのバリデーション。int 1=<でなければエラーを出す
Y = Integer(input_Y)
# 配列に格納
arr_Y << Y

#差し引きを計算した新しい配列
#rubyで配列の足し引きってできるん?
score = [Y - Xのバリデーション。3]

#配列と繰り返しを活用する
#入力のXとYの差を比較を繰り返す each (Y - X)
#これで新しくできた配列に対して、対応する文字を割り当てていく
#計算は数値でやってアウトプットの直前で文字列に切り替える

#規定打数より少ない
def calculate(X,Y)
    score.each do |X,Y|
      result =Y - X 
      score << result
    end
end

Y - X == 0 'パー'
Y - X == -1'バーディ'
Y - X == -2'イーグル'
Y - X == -3'アルバトロス' #例外あり
Y - X == -4'コンドル' #例外あり
Y - X == -5'ホールインワン' 
#規定打数より多い
Y - X == 1'ボギー'
Y - X == 2'ダブルボギー'
Y - X == 3'トリプルボギー'

# 配列の数字を名前に置き換えていくメソッド
def change_score_to_name



end

puts 'スコアを出力します'
#出力形式は横の文字列で ,でくくるjoin(',') 
print 


#テストケースを読み込む
File.open('case_1.txt', 'r')
#パイプでつなげる?
cat case_1.txt | ruby golf_score.rb