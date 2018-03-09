class Member
  include Mongoid::Document
  after_create :create_more_members
  field :name, type: String
  field :age, type: Integer

  private
    def random_string

    end
    def create_more_members
      900.times do |x|
        puts "Member ##{x}"
        o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
        string = (0...50).map { o[rand(o.length)] }.join
        Member.create!(name: string) do |doc|
          doc.age = 12
        end
      end
    end
end
