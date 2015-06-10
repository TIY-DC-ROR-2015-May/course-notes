require 'minitest/autorun'
require 'rack/test'

ENV["TEST"] = ENV["RACK_ENV"] = "test"

require './db/setup'
require './lib/all'

require './server'

require 'pry'

class ToDoTest < Minitest::Test
  include Rack::Test::Methods

  def app
    ToDoWeb
  end

  def setup
    Item.delete_all
  end

  def test_users_can_add_items
    List.create! list_name: "test"

    post "/add",
      description: "Figure out testing",
      list: "test"
    assert_equal 200, last_response.status

    item = Item.find_by_item "Figure out testing"

    assert item
    assert_equal item.id.to_s, last_response.body
  end

  def test_item_create_requires_a_list
    skip
    post "/add", description: "This doesn't have a list"
    assert_equal 0, Item.count
    assert_equal 400, last_response.status
  end

  def test_users_can_see_items_in_a_list
    l = List.create! list_name: "Groceries"
    l.items.create! item: "Food"
    l.items.create! item: "Milk"

    get "/list/Groceries"

    assert_equal 200, last_response.status
    assert_equal 2, last_response.body.count

    first_item = last_response.body.first
    assert_equal "Food", first_item["description"]
  end
end