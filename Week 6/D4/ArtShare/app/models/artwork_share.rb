# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShare < ApplicationRecord
  validates :artwork_id, presence: true
  validates :viewer_id, presence: true
  validates :artwork_id, uniqueness: { scope: :viewer_id, message: "artwork already shared with this viewer" }


  belongs_to :viewer,
    primary_key: :id, 
    foreign_key: :viewer_id,
    class_name: :User

  belongs_to :artwork,
    primary_key: :id, 
    foreign_key: :artwork_id,
    class_name: :Artwork
end
