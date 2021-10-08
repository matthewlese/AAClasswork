require action_view

class Cat < ApplicationRecord
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: ['cyan', 'red', 'zebra', 'gold', 'invisible', 'white', 'black']}
  validates :sex, inclusion: { in: ['M', 'F']}

end
