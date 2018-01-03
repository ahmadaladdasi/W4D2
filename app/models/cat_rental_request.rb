class CatRentalRequest < ApplicationRecord

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: {in: %w(PENDING APPROVED DENIED)}

  def overlapping_requests
    CatRentalRequest
      .find_by(id: self.cat_id)
      .where("start_date > #{self.end_date} OR end_date < #{self.start_date}")
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_request
    overlapping_approved_requests.exists?
  end

  belongs_to :cat,
    class_name: :Cat


end
