require 'optparse'
require 'date'

class SelectedYearMonth
  def initialize
    today = Date.today
    @year = today.year
    @month = today.month
    params = ARGV.getopts("y:", "m:")
    if params["m"].nil?
      params["m"] = @month
    else
      @month = params["m"].to_i
    end
    if params["y"].nil?
      params["y"] = @year
    else
      @year = params["y"].to_i
    end
  end
  def first_date
    Date.new(@year, @month, 1)
  end
  def last_date
    Date.new(@year, @month, -1)
  end
end
