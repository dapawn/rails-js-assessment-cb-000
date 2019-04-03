class Applicant < ActiveRecord::Base
  belongs_to :church
  has_many :assets
  has_many :requests
  has_many :household_members

  enum gender: [:male, :female]
  enum married_status: [:married, :single, :divorced, :seperated, :widow_er]
  enum occupation_status: [:employed, :unemployed, :self_employed]
  enum home_ownership: [:own, :rent, :other]

end
