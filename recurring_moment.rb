require 'active_support'
require 'active_support/core_ext'
require "pry"

class RecurringMoment
  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end

  def advance_by_i(date, i)

    if @period == 'monthly'
      date.advance(months: @interval * i)
    elsif @period == 'weekly'
      date.advance(weeks: @interval * i)
    elsif @period == 'daily'
      date.advance(days: @interval * i)
    end

  end

  def match(date)
    current = @start
    i = 1

    while current <= date
      if current == date
        return true
      end

      current = advance_by_i(@start, i)
      i += 1
    end

    return false
  end
end
