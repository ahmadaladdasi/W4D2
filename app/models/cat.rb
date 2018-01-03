# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord

  COLORS = ['black', 'white', 'orange', 'brown']
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: COLORS }
  validates :sex, inclusion: { in: %w(M F) }

  def age
    current_time = Time.now
    # current_month = current_time.month
    current_time.year - birth_date.year
  end

  has_many :rental_requests, dependent: :destroy
    class_name: :CatRentalRequest

end
