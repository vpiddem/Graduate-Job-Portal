require 'test_helper'

class TagTest < ActiveSupport::TestCase
  def tag_test
    tag = Tag.new :tag_value => tags(:one).tag_value
    assert tag.save

    assert tag.destroy
  end
end