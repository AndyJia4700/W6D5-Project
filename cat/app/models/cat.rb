require "action_view"

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    validates :birth_date, :color, :name, :sex, :description, presence: true 
    
    validates :color, inclusion: { in: %w(black red white),
    message: "%{value} is not a valid color" }
    validates :sex, inclusion: { in: %w(F M),  #ask TA
    message: "%{value} is not a valid sex" }

    
    has_many :rental_request,
    foreign_key: :cat_id,
    class_name: 'CatRentalRequest',
    dependent: :destroy

    def age 
        # Time.zone.now.year - self.birth_date.year #ask TA?
        time_ago_in_words(self.birth_date)
    end


# what is :limit - ask TA??
end

    # def year_not_in_future
    #     errors[:year] << "cannot be in the future" unless year < 2020
    # end
    