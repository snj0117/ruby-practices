# frozen_string_literal: true

# スコアを取得。ストラクは（10,0）に。Integer型に変換。
scores = ARGV[0].split(',')
shots = []
scores.each do |s|
  if s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

# 2次元配列に格納
frames = []
shots.each_slice(2) do |s|
  frames << s
end

# 9フレームまでのポイントを算出
point = 0
frames[0..8].each_with_index do |frame, index|
  point += if frame[0] == 10 && frames[index + 1][0] == 10
             10 + 10 + frames[index + 2][0]
           elsif frame[0] == 10
             10 + frames[index + 1][0] + frames[index + 1][1]
           elsif frame.sum == 10
             frame.sum + frames[index + 1][0]
           else
             frame.sum
           end
end

# 最終フレームのポイントを算出
frames.drop(9).each do |frame|
  point += frame.sum
end

puts point
