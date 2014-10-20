class User
  module Authentication

    def self.included klass
      klass.extend ClassMethods
      klass.before_save :hash_password
    end

    module ClassMethods
      def authenticate email, password
        user = where(email: email).first
        if user && user.hashed_password == BCrypt::Engine.hash_secret(password, user.salt)
          user
        else
          nil
        end
      end
    end


    private

    def hash_password
      if password.present?
        self.salt = BCrypt::Engine.generate_salt
        self.hashed_password = BCrypt::Engine.hash_secret(@password, salt)
      end
    end

  end
end