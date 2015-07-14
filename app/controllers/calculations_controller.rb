class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.gsub(" ", "").length

    @word_count = @text.split.size

    @occurrences = @text.split.count("#{@special_word}")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

        # A = Loan Amount
        @A = @principal
        # r = Rate of Interest (compounded) = APR/1200 [monthly]
        @r = @apr / 1200
        # N = Number of Payments = Number of Years * 12
        @N = @years * 12
        # P = Payment Amount
        @P = ( @r * @A ) / ( 1 - (1+@r)**-@N)



    @monthly_payment = @P
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    # Calculate days first


    @seconds = @ending - @starting
    @minutes = (@ending - @starting) / 60
    @hours = ((@ending - @starting) / 60) / 60
    @days = (((@ending - @starting) / 60) / 60) / 24
    @weeks = ((((@ending - @starting) / 60) / 60) / 24) / 7
    @years = (((((@ending - @starting) / 60) / 60) / 24) / 7) / 52
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.size

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @numbers.max - @numbers.min

        @mid = (@sorted_numbers.size) / 2
        if @mid.odd?
            @median = @sorted_numbers[@mid]
        else
            @median = (@sorted_numbers[@mid - 1] + @sorted_numbers[@mid]) / 2
        end
    @median = @median.to_f

    @sum = @numbers.sum

    @mean = @numbers.sum / @numbers.size

        @v = 0
        @numbers.each do |i|
            @v = @v + (i - @mean)**2
        end
    @variance = @v / @numbers.size

    @standard_deviation = @variance**0.5

        @m = "NULL"
        @c = 0
        @multi = 0
        @w = 23400
        @numbers.each do |j|
            @w = j
                if @numbers.count(@w) == @c
                    if @w != @m
                        @multi = 1
                    end
                elsif @numbers.count(@w) > @c
                    @m = @w
                    @c = @numbers.count(@w)
                    @multi = 0
                end
        end
        if @multi == 1
            @mode = 'multiple modes'
        else
            @mode = @w #@numbers.count(23400) #
        end
  end
end
