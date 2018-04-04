class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, format: { with: /\A[a-zA-Z]+\z/}, length: { minimum: 1}

  # Validates that each username is unique
  validates_uniqueness_of :username, :email

    # Before creating a user, the default level will be set to 0
  before_create :default_level

  # Before creating a user, an at (@) symbol will prepend the username
  before_create :add_at_symbol_to_username

    private

      def default_level
        self.level = 0;
      end

      def add_at_symbol_to_username
        self.username.insert(0, '@')

      end
end
