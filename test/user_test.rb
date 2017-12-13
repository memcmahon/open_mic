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
    assert_equal 1, sal.jokes[0].id
    assert_instance_of Joke, sal.jokes[1]
    assert_equal 3, sal.jokes[1].id
  end

  def test_users_can_tell_each_other_jokes
    sal = User.new("Sal")
    ali = User.new("Ali")

    joke = Joke.new({id: 13, question: "How does a man on the moon get his hair cut?", anser: "Eclipse it."})

    sal.tell(ali, joke)

    assert_instance_of Joke, ali.jokes[0]
    assert_equal 13, ali.jokes[0].id
    assert_equal 1, ali.jokes.count
  end

  def test_perform_routine_allows_users_to_tell_multiple_jokes
    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})
    ilana = User.new("Ilana")
    josh = User.new("Josh")

    ilana.learn(joke_1)
    ilana.learn(joke_2)

    ilana.perform_routine_for(josh)

    assert_equal 2, josh.jokes.count
    assert_instance_of Joke, josh.jokes[0]
    assert_instance_of Joke, josh.jokes[1]
    assert_equal 1, josh.jokes[0].id
    assert_equal 2, josh.jokes[1].id
  end
end
