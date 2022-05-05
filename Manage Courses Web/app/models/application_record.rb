class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  validate :email_domain

  def email_domain
    if defined?(email) && !email.blank?
      nameNumber = email.split("@").first
      domain = email.split("@").last
      
      errors.add(:email, "must end with osu.edu or buckeyemail.osu.edu") if domain != "osu.edu" && domain != "buckeyemail.osu.edu"
      
      name = nameNumber.split(".").first
      
      errors.add(:email, "must start with name dot number. name.#\@osu.edu format") if name.blank?
      
      number = nameNumber.split(".").last
      errors.add(:email, "must start with name dot number. name.#\@osu.edu format") if number.blank?
    end
  end
end
