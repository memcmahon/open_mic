class User
  attr_reader :name,
              :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(audience, joke)
    audience.jokes << joke
  end

  def perform_routine_for(audience)
    @jokes.each do |joke|
      tell(audience, joke)
    end
  end
end
