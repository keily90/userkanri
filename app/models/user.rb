class User < ActiveRecord::Base
  
  attr_accessor :password
  attr_accessible :name, :address,:phone, :password, :password_confirmation
  
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 1..40 }
                 
  validates(:name, :presence => true)
  
  before_save :encrypt_password
  before_create :create_remember_token
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
    def self.authenticate(name, submitted_password)
    user = find_by_name(name)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
  user = find_by_id(id)
  return nil  if user.nil?
  return user if user.salt == cookie_salt
end
  
  private
  
    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
    
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
  
  end
