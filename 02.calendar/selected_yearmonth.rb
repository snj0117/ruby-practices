require 'optparse'
require 'date'

class SelectedMonth
  def initialize
    today_date
    option_values
    evaluate_option_values
  end
  def today_date # 今日の日付を取得する
    @today = Date.today
  end
  def option_values # オプションの値を取得する
    @params = ARGV.getopts("y:", "m:")
  end
  def evaluate_option_values # 値を評価し、基準の年月を決める
    @month = @params["m"].nil? ? @today.month : @params["m"].to_i
    @year = @params["y"].nil? ? @today.year : @params["y"].to_i
  end
  def first_date # 基準の年月の1日の日付を取得する
    Date.new(@year, @month, 1)
  end
  def last_date # 基準の年月の月末の日付を取得する
    Date.new(@year, @month, -1)
  end
end
