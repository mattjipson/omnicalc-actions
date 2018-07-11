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
    @median_index = @count / 2
    if @numbers.count.odd?
      @median = @sorted_numbers.at(@count / 2)     
    else
      @first_median = @sorted_numbers.at(@median_index)
      @second_median =@sorted_numbers.at(@median_index - 1) 
      @median = (@first_median + @second_median)/2
      # @median = (@sorted_numbers.at(@count / 2) + @sorted_numbers.at((@count / 2) - 1) / 2)
    end

    @sum = @numbers.sum

    @mean = @numbers.sum/@numbers.count

    # Variance
    # ========
    @squared_numbers = []

    @numbers.each do |num|
      
      @square = (num-@mean)**2           
      @squared_numbers.push(@square)  # Push it into the squared_numbers array
    end
    
    @variance = (@squared_numbers.sum)/(@count)

    @standard_deviation = @variance**0.5

    # Mode
    # ====
    
    @current_mode = @sorted_numbers.at(0)
    
    @sorted_numbers.each do |num|
      if @sorted_numbers.count(num) > @sorted_numbers.count(@current_mode)
        @current_mode = num
      end  

    end
    
    @mode = @current_mode
    
    #2 methods
    #  hash method
      #  make a hash
      # keys are the numbers in the array
      # the values are the counts of the keys in the array
      
    # set a variable (@current_mode) to the first element in the array
    #  loop through the numbers array and compare the count of the current number to the count of the current mode and if it is higher, replace the current mode with the current number

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("stats/stats.html.erb")
  end
end
