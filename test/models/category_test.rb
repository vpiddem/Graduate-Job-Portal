require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def test_category
    category = Category.new :category => categories(:one).category
    assert category.save
    assert category.destroy
  end
end