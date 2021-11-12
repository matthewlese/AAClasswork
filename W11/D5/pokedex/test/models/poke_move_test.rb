# == Schema Information
#
# Table name: poke_moves
#
#  id         :bigint           not null, primary key
#  move_id    :integer
#  pokemon_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class PokeMoveTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
