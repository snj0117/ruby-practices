require_relative "selected_month.rb"

date = SelectedMonth.new

#カレンダー用レイアウト作成
print "      #{date.first_date.month}月 #{date.first_date.year}\n日 月 火 水 木 金 土\n"
print " " * (( 3 * date.first_date.wday + 1) -1 ) 

#1桁の日付を半角2文字分にする
def format_single_digit_day(current_date)
  current_date.day.to_s.rjust(2)
end

#今日の日付を文字色と背景色を反転
def highlight_today(current_date)
  if current_date == Date.today
    print "\e[7m#{format_single_digit_day(current_date)}\e[0m"
  else
    format_single_digit_day(current_date)
  end
end

#カレンダーを組む（土曜で改行）
def display_calendar(current_date, month_last_date)
  while current_date <= month_last_date
    if current_date.saturday?
      print "#{highlight_today(current_date)} \n"
    else
      print "#{highlight_today(current_date)} "
    end
    current_date = current_date.next_day(1)
  end
end

display_calendar(date.first_date, date.last_date)
