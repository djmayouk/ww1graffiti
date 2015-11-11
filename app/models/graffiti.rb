class Graffiti < ActiveRecord::Base
  has_many :photos

  validates :surname, presence: true, length: { minimum: 2 }
  validates :location, presence: true

  validates :graffiti_month, presence: true, if: "grafitti_dayinmonth.present?"

# TODO: would like validation to force month if day in month has been specified
#  with_options if: validates :grafitti_dayinmonth, presence: true,
#             if: [ validates :graffiti_month, presence: true ]
#  end

#:month_present?

  def month_present?
    graffiti_month != ""
  end
end
