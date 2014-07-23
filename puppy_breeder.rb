class PurchaseOrder
  
  attr_reader :breed, :name, :id
  attr_accessor :status

  @@id = 1000
  @@all_pos = []

  def initialize(name,breed)
    @name = name
    @breed = breed
    @status = "not reviewed"
    @@id += 1
    @id = @@id
  end

  def self.all
    @@all_pos
  end

end

class Puppy
  attr_reader :breed, :name
  def initialize(name,breed,price=nil)
    @breed = breed
    @name = name
    PuppyContainer.add_puppy_to_container(self, price)
  end

end
class PuppyContainer
  @@container = {}
  def self.add_puppy_to_container(puppy, price)
    if @@container.has_key?(puppy.breed)
      @@container[puppy.breed][:list] << puppy
    else
      @@container[puppy.breed] = {price: price, list: [puppy]}
    end
  end
  def self.container
    @@container
  end
end
def review_requests
  puts PurchaseOrder.all.find_all {|x| x.status == "not reviewed"}
end

def accept_request(id)
  po = PurchaseOrder.all.find {|x| x.id == id}
  if (Puppy.all.keys.include? po.breed) && (po.status == "not reviewed")
    po.status = 'accepted'
    Puppy.all["#{po.breed}"] -= 1
  elsif po.status != "accepted"
    puts "Order already filled."
  else
    puts "Breed unavailable"
    @@waitlist << po
  end
end

def completed_orders
  orders = PurchaseOrder.all.find_all {|x| x.status == "accepted"}
  orders.each {|x| puts "Name: #{x.name}\nBreed requested: #{x.breed}\nStatus: #{x.status}\nID: #{x.id}\n\n"}
end

# PurchaseOrder.new("Emma","Husky")
# PurchaseOrder.new("Bob", "Poodle")
# PurchaseOrder.new("Bill", "Malamute")
3.times do
  Puppy.new("Ruby","Husky", 300)
end
2.times do
  Puppy.new("Sass","Malamute", 200)
end
3.times do
  Puppy.new("Java","Husky", 100)
end

