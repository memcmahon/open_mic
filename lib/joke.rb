class Joke
  def initialize(joke_info)
    @joke_info = joke_info
  end

  def id
    @joke_info[:id]
  end

  def question
    @joke_info[:question]
  end

  def answer
    @joke_info[:answer]
  end
end
