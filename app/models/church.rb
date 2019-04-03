class Church < ActiveRecord::Base
  has_many :applicants
  has_many :requests, through: :applicants
  has_one :field_rep, class_name: "User"
end
