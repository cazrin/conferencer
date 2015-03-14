require "helper"
require "conferencer/talk"

class TestTalk < Test::Unit::TestCase
  def test_initialize_with_talk_string
    talk = Conferencer::Talk.new("Writing Fast Tests Against Enterprise Rails 60min")
    assert_equal "Writing Fast Tests Against Enterprise Rails", talk.title
    assert_equal 60, talk.length
  end

  def test_initialize_with_lightning_talk_string
    talk = Conferencer::Talk.new("Rails for Python Developers lightning")
    assert_equal "Rails for Python Developers", talk.title
    assert_equal 5, talk.length
  end
end
