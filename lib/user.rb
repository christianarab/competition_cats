require_relative ('./encryption.rb')

class User
  attr_accessor :email, :encrypted_password

  def initialize(email, password)
    @email, @encrypted_password = email, Encryption.encrypt(password)
  end

  def save
    File.open('././data/user', 'a') do |file|
      file.write("#{@email}, #{@encrypted_password}\n")
    end
  end

  def self.login(email, password)
    user = User.find_by(email)
    if user.encrypted_password == Encryption.encrypt(password)
      user
    else
      raise StandardError.new("This password is not correct.")
    end
  end

  def self.find_by(email)
    File.open('././data/user', 'r') do |file|
      file.each do |line|
        user_email, encrypted_password = line.split(', ')
        if user_email == email
          return User.new(user_email, encrypted_password.chomp)
        end
      end
    end
  end
end