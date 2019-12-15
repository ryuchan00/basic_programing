# 演習1
def bench(count = 1)
  t1 = Process.times.utime
  count.times do
    yield
  end
  t2 = Process.times.utime
  return t2 - t1
end

def square1(n)
  return n * n
end

def pirandom(n)
  count = 0
  n.times do
    x = rand
    y = rand
    if x ** 2 + y ** 2 < 1.0
      count = count + 1
    end
  end
  return 4 * count.to_f / n
end

def sekibun(n)
  count = 0
  n.times do
    x = rand
    y = rand
    if x >= y
      count = count + 1
    end
  end
  return count.to_f / n
end

def sekibun2(n)
  count = 0
  n.times do
    x = rand
    y = rand
    if x ** 2 > y
      count = count + 1
    end
  end
  return count.to_f / n
end

def sekibun3(n)
  count = 0
  n.times do
    x = rand * 2
    y = rand * 2
    if x >= y ** 2
      count = count + 1
    end
  end
  return count.to_f / n * 3
end

def toss10
  sum = 0
  10.times do
    sum = sum + rand(2)
  end
  return sum
end

def toss10hist
  a = Array.new(11, 0)
  1000.times do
    n = toss10
    a[n] = a[n] + 1
  end
  return a
end

# 40マスのすごろくメソッド
def sugo40
  pos = 0
  count = 0
  while pos < 40 do
    n = rand(6) + 1
    pos = pos + n
    count = count + 1
    # 10,20,30のマスに止まったら振り出しに戻る
    if pos < 40 && pos % 10 == 0
      pos = 0
    end
  end
end

# すごろくの分布を調べる
def sugo40hist
  a = []
  1000.times do
    n = sugo40
    while a.length < n + 1 do
      a.push(0)
    end
  end
  return 0
end

# サイコロを2回振る
def roll_dice
  sum = 0
  2.times do
    sum += rand(6) + 1
  end
  return sum
end

# 演習4a サイコロの分布を調べる
def roll_dice_hist
  distribution = Array.new(13, 0)
  1000.times do
    distribution[roll_dice] += 1
  end
  return distribution
end

# 60%の確率で表がでるイカサマコイン
def ikasama_coin
  if rand(5) <= 2
    return true
  end
  return false
end

# 演習4b
# イカサマコインを10回投げて、その分布を表示する
def ikasama_coin_hist
  distribution = Array.new(11, 0)
  1000.times do
    sum = 0
    # 10回イカサマコインを投げる
    10.times do
      sum += 1 if ikasama_coin
    end
    distribution[sum] += 1
  end
  return distribution
end

def normal_coin_hist
  distribution = Array.new(11, 0)
  1000.times do
    sum = 0
    # 10回イカサマコインを投げる
    10.times do
      if rand(2) < 1
        sum += 1
      end
    end
    distribution[sum] += 1
  end
  return distribution
end

# 演習6
# ランダムアートを生成する
# ランダムに百人一首の上の句と下の句を組み合わせる
def rand_hyakunin_issyu
  above_phrase = %w(
秋の田の　かりほの庵の　苫をあらみ
春すぎて　夏来にけらし　白妙の
あしびきの　山鳥の尾の　しだり尾の
田子の浦に　うち出でてみれば　白妙の
奥山に　紅葉踏みわけ　鳴く鹿の
かささぎの　渡せる橋に　おく霜の
天の原　ふりさけ見れば　春日なる
わが庵は　都のたつみ　しかぞす
花の色は　うつりにけりな　いたづらに
これやこの　行くも帰るも　別れては
  )
  lower_phrase = %w(
わが衣手は　露にぬれつつ
衣ほすてふ　天の香具山
ながながし夜を　ひとりかも寝む
富士の高嶺に　雪は降りつつ
声きく時ぞ　秋は悲しき
白きをみれば　夜ぞふけにける
三笠の山に　出でし月かも
世をうぢ山と　人はいふなり
わが身世にふる　ながめせしまに
知るも知らぬも　逢坂の関
  )
  return above_phrase[rand(above_phrase.size)] + lower_phrase[rand(lower_phrase.size)]
end
