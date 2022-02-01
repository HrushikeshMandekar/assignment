class Tutor < ApplicationRecord
  belongs_to :course
  validates :tutor_name, 
             presence: true,
             uniqueness: {case_sensitive: false}, 
             length: {minimum: 3, maximum: 30}
end