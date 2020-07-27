require 'csv'
require 'pry'

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author , {@content}]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    id = id.to_i
    all_gossips = self.all
    return all_gossips[id]
  end


  def self.update(id,author, content)
    gossips = self.all
    puts i = id.to_i
    CSV.open("./db/gossip.csv", "w") do |csv|
      gossips.each_with_index do |x|
        if i == gossips.index(x)
          csv << [author_update, content_update]
        else
          csv << [x.author , x.content]
        end
      end
    end
  end
end