require_relative "selected_month.rb"

date = SelectedMonth.new

#カレンダー用レイアウト作成
print "      #{date.first_date.month}月 #{date.first_date.year}\n日 月 火 水 木 金 土\n"
print " " * (( 3 * date.first_date.wday + 1) -1 ) 

#今日の日付を文字色と背景色を反転
def highlight_today(current_date)
  day_str = current_date.day.to_s.rjust(2) #1桁の日付を半角2文字分にする
  if current_date == Date.today
    "\e[7m#{day_str}\e[0m"
  else
    day_str
  end
end

#カレンダーを組む（土曜で改行）
def display_calendar(selected_month)
  current_date = selected_month.first_date
  month_last_date = selected_month.last_date
  while current_date <= month_last_date
      print highlight_today(current_date) #日付を並べる
      print current_date.saturday? ? "\n" : " " #土曜日なら改行、そうでなければ半角スペース
      current_date = current_date.next_day(1)
  end
end

display_calendar(date)
