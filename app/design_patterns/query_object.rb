# Used to store more complex queries or group of similar queries
class UsersListQuery
  def self.inactive
    User.where(sign_in_count: 0, verified: false)
  end

  def self.active
    User.where(verified: true).where('users.sign_in_count > 0')
  end

  def self.most_active
    # some more complex query
  end
end