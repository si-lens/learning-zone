# created to make the ActiveRecord’s models thinner. 
# We can often create a given record in multiple places,
# and each place has its rules regarding the validation rules, etc.

module Users
  class SignInForm
    include ActiveModel::Model

    attr_accessor :email, :password
    validates_presence_of :email, :password
  end
end

module Users
  class SignUpForm
    include ActiveModel::Model

    attr_accessor :email, :password, :first_name, :last_name
    validates_presence_of :email, :password, :first_name, :last_name

    def save
      return false unless valid?

      # save user
    end
  end
end

# Sign in
user = Users::SignInForm.new(user_params)
sign_in(user) if user.valid?

# Sign up
user = Users::SignUpForm.new(user_params)
user.save