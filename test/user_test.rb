require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require './lib/joke'

class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")

    assert_equal "Ali", ali.name
  end

  def test_it_starts_knowing_no_jokes
    sal = User.new("Sal")

    assert sal.jokes.empty?
  end

  def test_it_can_learn_a_joke
    sal = User.new("Sal")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})

    sal.learn(joke)

    assert_instance_of Joke, sal.jokes[0]
  end

  def test_it_can_learn_multiple_jokes
    sal = User.new("Sal")

    joke1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke2 = Joke.new({id: 3, question: "What do you call a cow with a twitch?", answer: "Beef jerky"})

    sal.learn(joke1)
    sal.learn(joke2)

    assert_instance_of Joke, sal.jokes[0]
    assert_instance_of Joke, sal.jokes[1]
  end
end
