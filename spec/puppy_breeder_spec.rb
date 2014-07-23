require "./puppy_breeder.rb"
describe PurchaseOrder do

  before(:each) do
    @emma = PurchaseOrder.new("Emma","Husky")
    @bob = PurchaseOrder.new("Bob", "Poodle")
    @bill = PurchaseOrder.new("Bill", "Malamute")
    3.times do
      Puppy.new("Husky")
    end
  end

  it "should return the breed requested" do   
    expect(@emma.breed).to eq("Husky")
  end

  it "should return the customer name" do
    expect(@emma.name).to eq("Emma")
  end

  it "should have a status of 'not reviewed' initially" do
    expect(@emma.status).to eq("not reviewed")
  end

  it "should not be able to be accepted twice" do
    accept_request(@emma.id)
    expect(STDOUT).to receive(:puts).and_return("Order already filled.")
    accept_request(@emma.id)
  end

  it "should put customer on waitlist if puppy is unavailable" do
  end
  
end

describe Puppy do

  it "should return the breed" do
  end

  it "should be available initially" do
  end

  it "should be unavailable if purchased" do
  end

end
