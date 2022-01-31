class Course < ApplicationRecord
  has_many :tutors
  validates :course_name, presence: true
  validates :course_name, presence: true, 
                       uniqueness: { case_sensitive: false }, 
                       length: { minimum: 3, maximum: 25 }
end