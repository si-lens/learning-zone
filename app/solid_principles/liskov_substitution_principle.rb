### Definitions
# "Child class should add to a parent class’s behaviour, not replace it.”
# "it should be possible to replace the parent class with its child class, and it would work the same"

# There are two classes: a base class (UserStatistic) and its child class (AdminStatistic).
# The child class violates the LSP principle since it completely redefines the base class 
# by returning a string with filtered data, whereas the base class returns an array of posts.

# Example 1

# Violation of the Liskov Substitution Principle in Ruby
class UserStatistic
  def initialize(user)
    @user = user
  end

  def posts
    @user.blog.posts
  end
end

class AdminStatistic < UserStatistic
  def posts
    user_posts = super

    string = ''
    user_posts.each do |post|
      string += "title: #{post.title} author: #{post.author}\n" if post.popular?
    end

    string
  end
end

# Correct use of the Liskov Substitution Principle in Ruby
class UserStatistic
  def initialize(user)
    @user = user
  end

  def posts
    @user.blog.posts
  end
end

class AdminStatistic < UserStatistic
  def posts
    user_posts = super
    user_posts.select { |post| post.popular? }
  end

  def formatted_posts
    posts.map { |post| "title: #{post.title} author: #{post.author}" }.join("\n")
  end
end

# Example 2

# Imagine that you write drivers for the database:
class MySQLDriver
  def connect; end

  def create_record; end

  def delete_record; end
end

class PostgreSQLDriver
  def connect_to_database; end

  def create; end

  def delete; end
end

# Correct use of the Liskov Substitution Principle in Ruby
class BaseDriver
  def connect
    raise 'NotImplemented'
  end

  def create_record
    raise 'NotImplemented'
  end

  def delete_record
    raise 'NotImplemented'
  end
end

class MySQLDriver < BaseDriver
  def connect; end

  def create_record; end

  def delete_record; end
end

class PostgreSQLDriver < BaseDriver
  def connect; end

  def create_record; end

  def delete_record; end
end