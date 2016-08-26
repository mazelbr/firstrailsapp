class User <  ActiveRecord::Base
    
    has_many :articles
    before_save { self.email =email.downcase } #turns email to downcase before saving
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 3}
    VALID_EMAIL_REGEX= /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 3}, format: {with: VALID_EMAIL_REGEX}
    
    has_secure_password

end