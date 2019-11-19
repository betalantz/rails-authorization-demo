class User < ApplicationRecord
    has_secure_password
    has_many :journal_entries
    validates :username, uniqueness: true

end
