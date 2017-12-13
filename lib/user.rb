require 'csv'

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

  def learn_routine(routine_file)
    CSV.foreach(routine_file, headers: true) do |row|
      joke = Joke.new({id: row[0], question: row[1], answer: row[2]})
      learn(joke)
    end
  end
end
