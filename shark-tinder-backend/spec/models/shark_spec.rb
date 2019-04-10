require 'rails_helper'

RSpec.describe Shark, type: :model do
  it "should validate name" do
  	shark = Shark.create
  	expect(shark.errors[:name]).to_not be_empty
  end
end

RSpec.describe Shark, type: :model do
  it "should validate age" do
    shark = Shark.create
    expect(shark.errors[:age]).to_not be_empty
  end
end

RSpec.describe Shark, type: :model do
  it "should validate enjoys" do
    shark = Shark.create
    expect(shark.errors[:enjoys]).to_not be_empty
  end
end

RSpec.describe Shark, type: :model do
  it "should validate the lenght of enjoys" do
    shark = Shark.create
    expect(shark.errors[:enjoys]).to_not be_empty
  end
end