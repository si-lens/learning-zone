class Account < ActiveRecord::Base
  has_many :users
end

class User < ActiveRecord::Base
  belongs_to :account
end

# This query gets 10 users from db
users = User.order(:finished_at).limit(10)

users.each do |user|
  # To print name of the account that user belongs to, for each user in the list
  # a query is executed to get that account
  puts user.account.name
end


# User Load (1.7ms) SELECT "users".* FROM "users" ORDER BY "users"."finished_at" ASC LIMIT 10

# Account Load (0.4ms) SELECT "accounts".* FROM "accounts" WHERE "accounts"."id" = $1 LIMIT 1 [["id", 11]]
# Account Load (0.8ms) SELECT "accounts".* FROM "accounts" WHERE "accounts"."id" = $1 LIMIT 1 [["id", 13]]
# Account Load (0.3ms) SELECT "accounts".* FROM "accounts" WHERE "accounts"."id" = $1 LIMIT 1 [["id", 15]]
# Account Load (0.3ms) SELECT "accounts".* FROM "accounts" WHERE "accounts"."id" = $1 LIMIT 1 [["id", 17]]
# Account Load (0.2ms) SELECT "accounts".* FROM "accounts" WHERE "accounts"."id" = $1 LIMIT 1 [["id", 19]]
# Account Load (0.3ms) SELECT "accounts".* FROM "accounts" WHERE "accounts"."id" = $1 LIMIT 1 [["id", 111]]
# Account Load (0.3ms) SELECT "accounts".* FROM "accounts" WHERE "accounts"."id" = $1 LIMIT 1 [["id", 113]]
# Account Load (0.3ms) SELECT "accounts".* FROM "accounts" WHERE "accounts"."id" = $1 LIMIT 1 [["id", 115]]
# Account Load (0.3ms) SELECT "accounts".* FROM "accounts" WHERE "accounts"."id" = $1 LIMIT 1 [["id", 117]]
# Account Load (0.3ms) SELECT "accounts".* FROM "accounts" WHERE "accounts"."id" = $1 LIMIT 1 [["id", 119]]

# It is called N+1 problem because we have initial one query, and the number of objects it returns 
# the same number of queries will be executed

# We can limit the number of queries to 2 by using includes

users = User.order(:finished_at).includes(:accounts).limit(10)

# User Load (0.5ms) SELECT "users".* FROM "users" ORDER BY "users"."finished_at" ASC LIMIT 10
# Account Load (0.5ms) SELECT "accounts".* FROM "accounts" WHERE "accounts"."id" IN (11, 13, 15, 17, 19, 111, 113, 115, 117, 119)