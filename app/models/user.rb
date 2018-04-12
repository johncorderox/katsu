class User < ActiveRecord::Base

  has_many :moods
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, format: { with: /\A[a-zA-Z]+\z/},
   length: { minimum: 1}, on: :create

  # Validates that each username is unique
  validates_uniqueness_of :username, :email

  # Before creating a user, the default level will be set to 0
  before_create :default_level

  # Before creating a user, an at (@) symbol will prepend the username
  before_create :add_at_symbol_to_username

  # After creating a user, a default mood will be created.
  after_create :add_default_mood_to_user

    private

      def default_level
        self.level = 0;
      end

      def add_at_symbol_to_username
        self.username.insert(0, '@')
      end

      def add_default_mood_to_user
        Mood.create(mood: "New", url: "https://media.giphy.com/media/ASd0Ukj0y3qMM/giphy.gif", user_id: self.id)
      end

end
