### DEFINITION ###
# Enumerable module adds several traversal, searching,
# and sorting algorithms to the main collection classes, Array and Hash

# Module Enumerable provides methods that are useful to a collection class for:
# Querying
# Fetching
# Searching
# Sorting
# Iterating
### DEFINITION ###

class ATeam
  include Enumerable

  def initialize(*members)
    @members = members
  end

  def each(&block)
    @members.each do |member|
      block.call(member)
    end
  end
end

ateam = ATeam.new("Face", "B.A. Barracus", "Murdoch", "Hannibal")
puts ateam.inspect
#use any Enumerable method from here on
p ateam.map(&:downcase)
p ateam.sort