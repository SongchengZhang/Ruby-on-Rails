class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_course
  has_many :course, through: :user_course
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validate :email_domain
        #Initialize roles
         enum role: [:students, :instructor,:admin,  :student_pending_instructor, :student_pending_admin, :instructor_pending_admin]
         
         after_initialize :set_default_role 
        #Set email domain restriction to make sure email end with @osu.edu or @buckeyemail.osu.edu amd must be seperated by '.' and there shouldn't be empty next to '.'
         def email_domain
            nameNumber = email.split("@").first
            domain = email.split("@").last
            if !email.blank?
              errors.add(:email, "must end with osu.edu or buckeyemail.osu.edu") if domain != "osu.edu" && domain != "buckeyemail.osu.edu"
            end
            name = nameNumber.split(".").first
            if !email.blank?
              errors.add(:email, "must start with name dot number. name.#\@osu.edu format") if name.blank?
            end
            number = nameNumber.split(".").last
            if !email.blank?
              errors.add(:email, "must start with name dot number. name.#\@osu.edu format") if number.blank?
            end
          end
          #Specify roles and set basic role is students
         def set_default_role
          self.role ||= :students
         end





end
