require "action_view"

class CatRentalRequest < ApplicationRecord

    include ActionView::Helpers::DateHelper

    validates :cat_id, :start_date, :end_date, presence: true
    validates :status, inclusion: { in: %w(PENDING APPROVED DENIED),
    message: "%{value} is not a valid status" }

    belongs_to :cat,
    foreign_key: :cat_id,
    class_name: 'Cat'
    

    def overlapping_requests
        

    end


end