class Photo < ActiveRecord::Base
  belongs_to :graffiti

  # TODO: would like to validate but don't know how to redirect the user back
  # to the parent form as the form is only submitted with photo details
  #validates :link, format: { with: /\Ahttps?:\/\//,
  #  message: "must start http:// or https://" }
end
