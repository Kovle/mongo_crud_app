class Member
  include Mongoid::Document
  
  after_create :create_more_members
  field :name, type: String
  field :age, type: Integer

  private
    def random_string
      o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
      string = (0...50).map { o[rand(o.length)] }.join
    end
    def create_more_members
      100.times do |x|
        Member.create!(name: "Angel") do |doc|
          doc.age = 12
        end
      end
    end
end
