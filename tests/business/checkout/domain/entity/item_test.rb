# typed: true
# frozen_string_literal: true

require_relative '../../../../test_helper'
require_relative '../../../../../src/business/checkout/domain/entity/item'
require_relative '../../../../../src/business/checkout/domain/entity/dimension'
require_relative '../../../../../src/business/checkout/domain/entity/order_item'

module Checkout
  module Domain
    module Entity
      class ItemTest < Minitest::Test
        def setup
          @dimension = Dimension.new(100.0, 200.0, 300.0, 600.0)
          @item = Item.new(1, 'Laptop', 3000.00, @dimension)
        end

        def test_initialize
          assert_equal 1, @item.id_item
          assert_equal 'Laptop', @item.description
          assert_in_delta(3000.00, @item.price)
          assert_equal @dimension, @item.dimension
        end

        def test_get_volume
          expected_volume = @dimension.get_volume

          assert_equal expected_volume, @item.get_volume
        end

        def test_get_density
          expected_density = @dimension.get_density

          assert_equal expected_density, @item.get_density
        end

        def test_create_order_item
          quantity = 2
          order_item = @item.create_order_item(quantity)

          assert_instance_of OrderItem, order_item
          assert_equal @item.id_item, order_item.id_item
          assert_equal @item.price, order_item.price
          assert_equal quantity, order_item.quantity
        end
      end
    end
  end
end
