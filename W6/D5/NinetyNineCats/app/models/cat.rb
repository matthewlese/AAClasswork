require 'action_view'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: ['cyan', 'red', 'zebra', 'gold', 'invisible', 'white', 'black']}
  validates :sex, inclusion: { in: ['M', 'F']}

  def age
    time_ago_in_words(self.birth_date)
  end
end
