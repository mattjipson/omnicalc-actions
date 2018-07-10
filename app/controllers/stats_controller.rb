class StatsController < ApplicationController
  def stats
    @numbers = params.fetch("list_of_numbers").gsub(",", "").split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @numbers.max-@numbers.min

    # Median
    # ======

    @median = @numbers.at((@numbers.count/2)-1)

    @sum = @numbers.sum

    @mean = @numbers.sum/@numbers.count

    # Variance
    # ========

    @variance = "Replace this string with your answer"

    @standard_deviation = "Replace this string with your answer"

    # Mode
    # ====

    @mode = "Replace this string with your answer"

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("stats/stats.html.erb")
  end
end
