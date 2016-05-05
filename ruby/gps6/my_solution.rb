# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# Include local file with the name between quotes.  Uses .bashprofile to locate file
# 
#
require_relative 'state_data'

class VirusPredictor

# Initialize class to the values in STATE_DATA
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

# Our class method for the report.
  def self.national_report
    STATE_DATA.each do |state, data|
    state = VirusPredictor.new(state, data[:population_density], data[:population])

    state.virus_effects
    end
  end

  
# Calling two methods
  def virus_effects
    predicted_deaths #(@population_density, @population, @state)
    speed_of_spread #(@population_density, @state)
  end

  private

# Calculate the number of deaths 
  def predicted_deaths #(population_density, population, state)
    # predicted deaths is solely based on population density
    # if @population_density >= 200
    #   number_of_deaths = (@population * 0.4).floor
    # elsif @population_density >= 150
    #   number_of_deaths = (@population * 0.3).floor
    # elsif @population_density >= 100
    #   number_of_deaths = (@population * 0.2).floor
    # elsif @population_density >= 50
    #   number_of_deaths = (@population * 0.1).floor
    # else
    #   number_of_deaths = (@population * 0.05).floor
    # end


    if @population_density >= 200
      pct = 0.4
    elsif @population_density >= 150
      pct = 0.3
    elsif @population_density >= 100
      pct = 0.2
    elsif @population_density >= 50
      pct = 0.1
    else
      pct = 0.05
    end

    number_of_deaths = (@population * pct).floor

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

# Calculate the speed of virus spreading.
  def speed_of_spread #(population_density, state) #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end



end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects

# def national_report
#   STATE_DATA.each do |state, data|
#     state = VirusPredictor.new(state, data[:population_density], data[:population])

#     state.virus_effects

#   end
# end


VirusPredictor.national_report



#=======================================================================
# Reflection Section








