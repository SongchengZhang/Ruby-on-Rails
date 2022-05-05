# Grader is a user<>section relationship
class Grader < ApplicationRecord
    belongs_to :user
    belongs_to :section
end
