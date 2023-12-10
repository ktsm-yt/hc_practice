# 4.7.4 %記法で文字列の配列を作る。["A","B"...]",文字をタイプするのは非常に面倒くさい！
members = %w(A B C D E F)

#実行するごとに結果が変わる。
shuffled_members = members.shuffle

#グループを3人と3人、または2人と4人にランダムに分ける。
groups = [[3,3],[2,4]]
group = groups.sample

#ここまでで[3,3][2,4]のどちらかの配列になる。
#分けた配列にメンバーを割り当てる。sliceは"配列"から特定の要素を取り出すメソッド
group1 = shuffled_members.slice(0,group[0])
group2 = shuffled_members.slice(group[0],group[1])

#表示結果はアルファベット順
p group1.sort
p group2.sort

# group2 = group - group1 #4.7.4 配列の差集合
