# typed: true
# frozen_string_literal: true

require_relative '../../../../test_helper'
require_relative '../../../../../src/business/checkout/domain/entity/dimension'

module Checkout
  module Domain
    module Entity
      class DimensionTest < Minitest::Test
        def setup
          @dimension = Dimension.new(100.0, 200.0, 300.0, 600.0)
        end

        def test_dimension_initialization
          assert_instance_of Dimension, @dimension
        end

        def test_invalid_dimension_negative_width
          assert_raises(ArgumentError) { Dimension.new(-1.0, 200.0, 300.0, 600.0) }
        end

        def test_invalid_dimension_negative_height
          assert_raises(ArgumentError) { Dimension.new(100.0, -1.0, 300.0, 600.0) }
        end

        def test_invalid_dimension_negative_length
          assert_raises(ArgumentError) { Dimension.new(100.0, 200.0, -1.0, 600.0) }
        end

        def test_invalid_dimension_negative_weight
          assert_raises(ArgumentError) { Dimension.new(100.0, 200.0, 300.0, -1.0) }
        end

        def test_get_volume
          volume = @dimension.get_volume

          assert_in_delta 6.0, volume, 0.01
        end

        def test_get_density
          density = @dimension.get_density

          assert_in_delta 100.0, density, 0.01
        end

        def test_get_density_zero_volume
          dimension_zero_volume = Dimension.new(0.0, 0.0, 0.0, 600.0)
          density = dimension_zero_volume.get_density

          assert_in_delta(0.0, density)
        end
      end
    end
  end
end
