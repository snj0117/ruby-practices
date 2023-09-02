require_relative "selected_yearmonth.rb"

date = SelectedYearMonth.new
first_date = date.first_date
last_date = date.last_date
year = first_date.year
month = last_date.month
current_date = first_date
space = " "

print space * 6, "#{month}月#{space}#{year}\n"
print "日#{space}月#{space}火#{space}水#{space}木#{space}金#{space}土"
print "\n"
first_week_space  = space * (( 3 * first_date.wday + 1) -1 ) 
print first_week_space

def format_single_digit_day(current_date, space)
  if current_date.day <= 9
   print "#{space}#{current_date.day}"
   else
   print "#{current_date.day}"
  end
end

def highlight_today(current_date, space)
  today = Date.today
  if current_date == today
    print "\e[7m"
    format_single_digit_day(current_date, space)
    print "\e[0m"
  else
    print format_single_digit_day(current_date, space)
  end
end

def display_calendar(current_date, last_date, space)
  while current_date <= last_date
    if current_date.saturday?
      highlight_today(current_date, space)
      print "#{space}" 
      print "\n"
    else current_date.saturday?
      highlight_today(current_date, space)
      print "#{space}"
    end
    current_date = current_date.next_day(1)
  end
end

display_calendar(current_date, last_date, space)
