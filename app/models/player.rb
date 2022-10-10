class Player < ApplicationRecord
  has_many :collections

  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }
  validates :username, uniqueness: { case_sensitive: false }

  def as_json(options = {})
    # this coerces the option into an array and merges the passed values with defaults
    # opting to do this instead of using active record serializer since i had issues
    # setting it up w/sorbet & tapioca
    excluding = [options[:except]].flatten
                                  .compact
                                  .union([:password_digest])
    super(options.merge(except: excluding))
  end
end
